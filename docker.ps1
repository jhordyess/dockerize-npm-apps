$defaultImageName = "crazy/container"
$defaultPCHostPort = "80-90"
$defaultContainerPort = "80"

$imageName = Read-Host "Image name (default: $defaultImageName)"
if ([string]::IsNullOrWhiteSpace($imageName)) { $imageName = $defaultImageName }

$pcHostPort = Read-Host "Host port (default: $defaultPCHostPort)"
if ([string]::IsNullOrWhiteSpace($pcHostPort)) { $pcHostPort = $defaultPCHostPort }

$containerPort = Read-Host "Container port (default: $defaultContainerPort)"
if ([string]::IsNullOrWhiteSpace($containerPort)) { $containerPort = $defaultContainerPort }

if (-not (Get-Command docker.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Please install it and try again."
    exit 1
}

docker build -t $imageName .

docker run -d --rm -p $pcHostPort":"$containerPort $imageName
