#!/usr/bin/python3

from datetime import date

from pyversion_info import get_pyversion_info


def _1_is_greater_than_2_release(first: str, second: str) -> bool:
    return int(first.replace(".", "")) > int(second.replace(".", ""))


if __name__ == "__main__":
    pyvinfo = get_pyversion_info()
    today = date.today()
    current_releases = []
    for minor in pyvinfo.supported_series():
        version_dict = {}
        current_release = f"{minor}.0"
        for bugfix in pyvinfo.subversions(minor):
            if _1_is_greater_than_2_release(bugfix, current_release) \
                    and pyvinfo.release_date(bugfix) < today:
                current_release = bugfix
        current_releases.append(current_release)
    print(",".join(current_releases), end="")
