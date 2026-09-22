from ScriptCollection.GeneralUtilities import Platform
import os
from ScriptCollection.TFCPS.Docker.TFCPS_CodeUnitSpecific_Docker import TFCPS_CodeUnitSpecific_Docker_Functions,TFCPS_CodeUnitSpecific_Docker_CLI


def build():
    platforms:list[Platform] = [
            Platform.Linux_AMD64,
            Platform.Linux_ARM64,
    ]
    tf:TFCPS_CodeUnitSpecific_Docker_Functions=TFCPS_CodeUnitSpecific_Docker_CLI.parse(__file__)
    tf.build(platforms,{
        "image_alpine":tf.tfcps_Tools_General.oci_image_manager.get_registry_address_for_image_with_default_tag(tf.get_repository_folder(),"Alpine"),
        "icecast_version":tf.tfcps_Tools_General.get_dependency_version_in_resources_folder(os.path.join(tf.get_codeunit_folder(),"Other","Resources"), "Icecast"),
    })


if __name__ == "__main__":
    build()
