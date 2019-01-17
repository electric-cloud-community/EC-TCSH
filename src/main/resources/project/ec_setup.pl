my %runTCSH = (
    label       => "TCSH - Run TCSH",
    procedure   => "runTCSH",
    description => "Creates a TCSH step",
    category    => "Scripting/Shell"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-TCSH - runTCSH");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/TCSH - Run TCSH");

@::createStepPickerSteps = (\%runTCSH);
