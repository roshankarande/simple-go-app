$pkg_name = "simple-go-app"
# $pkg_origin = "gscho"
$pkg_version = "0.1.0"
# $pkg_scaffolding=core/scaffolding-go
$pkg_deps= @("core/go")
# $scaffolding_go_module=on
$pkg_bin_dirs= @("bin")

function Invoke-Build {

    # go build -o "${pkg_name}"

    Push-Location "$PLAN_CONTEXT/.."
    try {
        go build -o "${pkg_name}"
        if($LASTEXITCODE -ne 0) {
            Write-Error "go build failed!"
        }
    }
    finally { Pop-Location }

}

function Invoke-Install {
    mkdir -p "${pkg_prefix}/bin"
    Copy-Item "${SRC_PATH}/${pkg_name}" "${pkg_prefix}/bin" -Force
}
