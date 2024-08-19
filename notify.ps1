# Load necessary assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Notification Scheduler"
$form.Size = New-Object System.Drawing.Size(340, 400)
$form.StartPosition = "CenterScreen"

# Create the title label and textbox
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Message Title:"
$titleLabel.Location = New-Object System.Drawing.Point(10, 20)
$titleLabel.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($titleLabel)

$titleTextbox = New-Object System.Windows.Forms.TextBox
$titleTextbox.Location = New-Object System.Drawing.Point(120, 20)
$titleTextbox.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($titleTextbox)

# Create the message label and textbox
$messageLabel = New-Object System.Windows.Forms.Label
$messageLabel.Text = "Message Body:"
$messageLabel.Location = New-Object System.Drawing.Point(10, 60)
$messageLabel.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($messageLabel)

$messageTextbox = New-Object System.Windows.Forms.TextBox
$messageTextbox.Location = New-Object System.Drawing.Point(120, 60)
$messageTextbox.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($messageTextbox)

# Create the time delay labels and numeric inputs
$hoursLabel = New-Object System.Windows.Forms.Label
$hoursLabel.Text = "Hours:"
$hoursLabel.Location = New-Object System.Drawing.Point(10, 100)
$hoursLabel.Size = New-Object System.Drawing.Size(50, 20)
$form.Controls.Add($hoursLabel)

$hoursTextbox = New-Object System.Windows.Forms.NumericUpDown
$hoursTextbox.Location = New-Object System.Drawing.Point(60, 100)
$hoursTextbox.Size = New-Object System.Drawing.Size(60, 20)
$hoursTextbox.Minimum = 0
$hoursTextbox.Maximum = 23
$form.Controls.Add($hoursTextbox)

$minutesLabel = New-Object System.Windows.Forms.Label
$minutesLabel.Text = "Minutes:"
$minutesLabel.Location = New-Object System.Drawing.Point(130, 100)
$minutesLabel.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($minutesLabel)

$minutesTextbox = New-Object System.Windows.Forms.NumericUpDown
$minutesTextbox.Location = New-Object System.Drawing.Point(190, 100)
$minutesTextbox.Size = New-Object System.Drawing.Size(60, 20)
$minutesTextbox.Minimum = 0
$minutesTextbox.Maximum = 59
$form.Controls.Add($minutesTextbox)

$secondsLabel = New-Object System.Windows.Forms.Label
$secondsLabel.Text = "Seconds:"
$secondsLabel.Location = New-Object System.Drawing.Point(10, 130)
$secondsLabel.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($secondsLabel)

$secondsTextbox = New-Object System.Windows.Forms.NumericUpDown
$secondsTextbox.Location = New-Object System.Drawing.Point(70, 130)
$secondsTextbox.Size = New-Object System.Drawing.Size(60, 20)
$secondsTextbox.Minimum = 0
$secondsTextbox.Maximum = 59
$form.Controls.Add($secondsTextbox)

# Create the recurrence checkbox
$recurCheckbox = New-Object System.Windows.Forms.CheckBox
$recurCheckbox.Text = "Repeat notification"
$recurCheckbox.Location = New-Object System.Drawing.Point(10, 160)
$recurCheckbox.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($recurCheckbox)

# Create the recurrence interval labels and numeric inputs
$recurHoursLabel = New-Object System.Windows.Forms.Label
$recurHoursLabel.Text = "Recur every (Hours):"
$recurHoursLabel.Location = New-Object System.Drawing.Point(10, 190)
$recurHoursLabel.Size = New-Object System.Drawing.Size(120, 20)
$form.Controls.Add($recurHoursLabel)

$recurHoursTextbox = New-Object System.Windows.Forms.NumericUpDown
$recurHoursTextbox.Location = New-Object System.Drawing.Point(130, 190)
$recurHoursTextbox.Size = New-Object System.Drawing.Size(60, 20)
$recurHoursTextbox.Minimum = 0
$recurHoursTextbox.Maximum = 23
$form.Controls.Add($recurHoursTextbox)

$recurMinutesLabel = New-Object System.Windows.Forms.Label
$recurMinutesLabel.Text = "Minutes:"
$recurMinutesLabel.Location = New-Object System.Drawing.Point(200, 190)
$recurMinutesLabel.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($recurMinutesLabel)

$recurMinutesTextbox = New-Object System.Windows.Forms.NumericUpDown
$recurMinutesTextbox.Location = New-Object System.Drawing.Point(260, 190)
$recurMinutesTextbox.Size = New-Object System.Drawing.Size(60, 20)
$recurMinutesTextbox.Minimum = 0
$recurMinutesTextbox.Maximum = 59
$form.Controls.Add($recurMinutesTextbox)

$recurSecondsLabel = New-Object System.Windows.Forms.Label
$recurSecondsLabel.Text = "Seconds:"
$recurSecondsLabel.Location = New-Object System.Drawing.Point(10, 220)
$recurSecondsLabel.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($recurSecondsLabel)

$recurSecondsTextbox = New-Object System.Windows.Forms.NumericUpDown
$recurSecondsTextbox.Location = New-Object System.Drawing.Point(70, 220)
$recurSecondsTextbox.Size = New-Object System.Drawing.Size(60, 20)
$recurSecondsTextbox.Minimum = 0
$recurSecondsTextbox.Maximum = 59
$form.Controls.Add($recurSecondsTextbox)

# Create the "Recur Until" label and datetime picker
$recurUntilLabel = New-Object System.Windows.Forms.Label
$recurUntilLabel.Text = "Recur until (Time):"
$recurUntilLabel.Location = New-Object System.Drawing.Point(10, 250)
$recurUntilLabel.Size = New-Object System.Drawing.Size(120, 20)
$form.Controls.Add($recurUntilLabel)

$recurUntilTimePicker = New-Object System.Windows.Forms.DateTimePicker
$recurUntilTimePicker.Format = [System.Windows.Forms.DateTimePickerFormat]::Time
$recurUntilTimePicker.ShowUpDown = $true
$recurUntilTimePicker.Location = New-Object System.Drawing.Point(130, 250)
$recurUntilTimePicker.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($recurUntilTimePicker)

# Create the "Recur How Many Times" label and numeric input
$recurTimesLabel = New-Object System.Windows.Forms.Label
$recurTimesLabel.Text = "Recur how many times:"
$recurTimesLabel.Location = New-Object System.Drawing.Point(10, 280)
$recurTimesLabel.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($recurTimesLabel)

$recurTimesTextbox = New-Object System.Windows.Forms.NumericUpDown
$recurTimesTextbox.Location = New-Object System.Drawing.Point(160, 280)
$recurTimesTextbox.Size = New-Object System.Drawing.Size(60, 20)
$recurTimesTextbox.Minimum = 1
$recurTimesTextbox.Maximum = 1000
$form.Controls.Add($recurTimesTextbox)

# Create the submit button
$submitButton = New-Object System.Windows.Forms.Button
$submitButton.Text = "Send Notification"
$submitButton.Location = New-Object System.Drawing.Point(100, 320)
$submitButton.Size = New-Object System.Drawing.Size(120, 30)
$form.Controls.Add($submitButton)

# Define the action on submit button click
$submitButton.Add_Click({
    $messageTitle = $titleTextbox.Text
    $messageBody = $messageTextbox.Text
    $hours = [int]$hoursTextbox.Value
    $minutes = [int]$minutesTextbox.Value
    $seconds = [int]$secondsTextbox.Value

    # Calculate the total delay time in seconds
    $timeInSeconds = ($hours * 3600) + ($minutes * 60) + $seconds

    # Get recurrence settings
    $recur = $recurCheckbox.Checked
    $recurHours = [int]$recurHoursTextbox.Value
    $recurMinutes = [int]$recurMinutesTextbox.Value
    $recurSeconds = [int]$recurSecondsTextbox.Value
    $recurInterval = ($recurHours * 3600) + ($recurMinutes * 60) + $recurSeconds

    $recurUntil = $recurUntilTimePicker.Value
    $recurTimes = [int]$recurTimesTextbox.Value

    # Close the form immediately
    $form.Close()

    $currentRecurCount = 0
    $endTime = [datetime]::Now.AddSeconds($timeInSeconds) # Calculate when the first notification should occur

    do {
        # Wait for the specified time
        Start-Sleep -Seconds $timeInSeconds

        # Create the notification icon
        $objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon
        $objNotifyIcon.Icon = [System.Drawing.SystemIcons]::Information
        $objNotifyIcon.BalloonTipIcon = "Info"
        $objNotifyIcon.BalloonTipTitle = $messageTitle
        $objNotifyIcon.BalloonTipText = $messageBody
        $objNotifyIcon.Visible = $True

        # Show the notification for 10 seconds
        $objNotifyIcon.ShowBalloonTip(10000)

        # Increment the counter and check conditions
        $currentRecurCount++
        $timeInSeconds = $recurInterval

        # Stop if the max number of recurs is reached or the time is past the "recur until" time
        if ($currentRecurCount -ge $recurTimes -or [datetime]::Now -ge $recurUntil) {
            break
        }

        $endTime = [datetime]::Now.AddSeconds($timeInSeconds)
    } while ($recur -and $timeInSeconds -gt 0)
})

# Show the form
$form.ShowDialog()
