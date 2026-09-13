# ============================================================================
# AWK + GNU Octave: cross-section bathymetric profile of the Kuril-Kamchatka
# Trench (single profile, with AWK column preprocessing)
#
# This script produced an Octave figure in the peer-reviewed article:
#   Lemenkova, P. (2019). AWK and GNU Octave Programming Languages Integrated
#   with Generic Mapping Tools for Geomorphological Analysis.
#   GeoScience Engineering, 65(4), 1-22.
#   DOI:      https://doi.org/10.35180/gse-2019-0020
#   figshare: https://doi.org/10.6084/m9.figshare.11374542
#   HAL:      https://hal.science/hal-02425687
#   Zenodo:   https://zenodo.org/record/3579575
#   SSRN:     https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3505007
#
# The article integrates AWK, GNU Octave and GMT (Generic Mapping Tools); this
# repository holds the AWK-preprocessing + GNU Octave plotting for one profile.
#
# Author: Polina Lemenkova  |  ORCID: 0000-0002-5759-1089
# ============================================================================

# Script to plot cross-section bathymetric profile (here: profile #1, Kuril-Kamchatka Trench)
# cd /Users/pauline/Documents/Octave
# reshaped initial table by AWK: select two necessary columns; field separator as space.
awk 'BEGIN{FS=" "; OFS=" "} {print $3, $5}' profile1.txt > profile1s.txt
# load table into Octave
load profile1s.txt
# look up the table
profile1s
# assign variables
P = profile1s; % assign table to P
K = P(:,1); % assign 400-kilometer cross-section line (km) to x axis
D = P(:,2); % assign depths to y axis
# prepare plot
figure;
clf;
hold on;
plot(K, D, "ro", "markersize", 5); % plot x against y
    grid on;
    axis tight;
    set(gca,'xlim',[-200 200])
    title({'Octave plot: cross-section profile 1'},
          'FontSize', 12, 'Color', 'black', 'FontWeight', 'normal', 'FontName', 'Monaco');
    xlabel('Observations along 400-km cross-section');
    ylabel('Depths, m');
    ylim ([-9000 200]);
    xlim ([-200 200]);
    axis([-200 200 -9000 200])
print('plot_KKTprofile1.jpg','-djpg','-r300');
#close all % Close all open figure windows
#clc Clear command window (shell)
