# AWK + GNU Octave Bathymetric Profile — Kuril-Kamchatka Trench

A GNU Octave script that plots a single cross-section (bathymetric) profile of a
deep-sea trench, illustrating the integration of AWK text preprocessing with
Octave numerical plotting. AWK first extracts the two needed columns (distance
and depth) from a raw whitespace-delimited profile table; Octave then loads the
reduced table and plots the sea-floor depth along a 400-km cross-section line of
the Kuril-Kamchatka Trench.

## Related publication

This script (octave_awk_bathymetric_profile_kuril_kamchatka.m) produced an Octave
figure in:

Lemenkova, P. AWK and GNU Octave Programming Languages Integrated with Generic
Mapping Tools for Geomorphological Analysis. GeoScience Engineering 2019, 65(4),
1-22.

- DOI:      https://doi.org/10.35180/gse-2019-0020
- figshare: https://doi.org/10.6084/m9.figshare.11374542
- HAL:      https://hal.science/hal-02425687
- Zenodo:   https://zenodo.org/record/3579575
- SSRN:     https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3505007
- ISSN:     1802-5420

The article integrates three tools - AWK (text/table preprocessing), GNU Octave
(numerical plotting) and GMT (Generic Mapping Tools, cartography). A companion
repository plots ten profiles together:
https://github.com/paulinelemenkova/octave-bathymetric-profiles-kuril-kamchatka

## Script

### octave_awk_bathymetric_profile_kuril_kamchatka.m
- AWK preprocessing: awk 'BEGIN{FS=" "; OFS=" "} {print $3, $5}' extracts the
  along-track distance (column 3) and depth (column 5) from the raw profile table
  (profile1.txt) into a two-column file (profile1s.txt), demonstrating
  field-based table reduction from within the Octave script.
- Loads the reduced table into Octave (load) and assigns the distance (x) and
  depth (y) vectors.
- Plots depth against distance with markers, a grid and fixed axis limits
  (x in [-200, 200] km, y in [-9000, 200] m).
- Exports the figure to a 300-dpi JPG with print (-djpg -r300).

## Methods and techniques

- AWK field extraction / column selection for tabular preprocessing.
- Whitespace-delimited table loading into Octave (load).
- Single-series cross-section plotting with fixed axis scaling (vertical
  exaggeration control).
- Raster export at fixed resolution (print).

## Data

- profile1.txt: raw across-trench profile of the Kuril-Kamchatka Trench sampled
  along a 400-km cross-section line (multiple columns).
- profile1s.txt: the two-column (distance, depth) table produced by the AWK step.

## Requirements

- GNU Octave (>= 5), or MATLAB (MATLAB-compatible syntax)
- AWK (gawk or the system awk), available on the shell path

## Usage

Place profile1.txt in the working directory and run in Octave:

    octave octave_awk_bathymetric_profile_kuril_kamchatka.m

The AWK step regenerates profile1s.txt, and the script writes plot_KKTprofile1.jpg.

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use this script, please cite:

Lemenkova, P. AWK and GNU Octave Programming Languages Integrated with Generic
Mapping Tools for Geomorphological Analysis. GeoScience Engineering 2019, 65(4),
1-22. https://doi.org/10.35180/gse-2019-0020

## License

See the LICENSE file in this repository.
