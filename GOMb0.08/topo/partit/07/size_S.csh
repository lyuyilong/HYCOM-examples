#
set echo
# DS is datasets/topo directory
# D  is current directory
# T  is topography file name
# TV is version of topography to use
#
#setenv DS ~/HYCOM-examples/GOMb0.08/datasets/topo
setenv DS /p/work1/${user}/HYCOM-examples/GOMb0.08/datasets/topo
setenv D ${cwd}
setenv T `echo $cwd | awk -f depth.awk`
setenv TV `echo ${T} | cut -d"_" -f 3-`
cd ${DS}/partit/${TV}
#
# --- produce a sorted list of patch files by processor count.
#
#cat S04/patch.input_* | head -1 >! size_S.tmp
head -1 S04/patch.input_004 >! size_S.tmp
#
foreach f ( S*/patch.input_* )
  head -2 $f | tail -1 >> size_S.tmp
end
#
sort -n -k 1,10 size_S.tmp >! size_S.lis
/bin/rm size_S.tmp
