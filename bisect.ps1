Function Get-TestResult{
    [CmdletBinding()]
    param($antOutput)

    if ($antOutput -like "*FAILED*") {
        $result = "bad"
    }
    else{
        $result = "good"
    }

    return $result
}
Set-Location C:\Users\ToddHaugen\OneDrive\Documents\GradSchool\CSE504\basic-stats
ant clean
git checkout v1.0.0
git bisect start
git bisect good
git checkout main
git bisect bad

do{
    $antOutput = ant test
    $result = Get-TestResult($antOutput)
    $bisectComplete = git bisect $result
} until ($bisectComplete -like "*is the first bad commit*")





