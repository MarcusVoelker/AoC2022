From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith Psatz.
From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.
Import ListNotations.


Inductive command :=
  | cd : string -> command
  | cd_up : command
  | cd_top : command
  | ls : command
  | dir : string -> command
  | file : Z -> string -> command
.

Open Scope Z_scope.

Definition test_in : list command := [
  cd_top;
  ls;
  dir "a";
  file 14848514 "b.txt";
  file 8504156 "c.dat";
  dir "d";
  cd "a";
  ls;
  dir "e";
  file 29116 "f";
  file 2557 "g";
  file 62596 "h.lst";
  cd "e";
  ls;
  file 584 "i";
  cd_up;
  cd_up;
  cd "d";
  ls;
  file 4060174 "j";
  file 8033020 "d.log";
  file 5626152 "d.ext";
  file 7214296 "k"
].

Definition input : list command := [
cd_top;
ls;
dir "cmwrq";
dir "ftrccld";
dir "jjlbmtw";
dir "jpncfpb";
dir "mddr";
dir "mthvntdd";
file 55644 "pjts.dzh";
dir "ptzsl";
dir "wmqc";
cd "cmwrq";
ls;
dir "dtbzzl";
dir "pjnghbm";
file 16144 "rvs";
file 50956 "swngfrsj.pcj";
dir "vhvn";
dir "vrt";
dir "zgrjmtcq";
cd "dtbzzl";
ls;
file 42503 "ljhpmvd.zqf";
dir "wwpnn";
cd "wwpnn";
ls;
file 58541 "jjdgzwnq";
dir "lwqgsbg";
dir "nztw";
dir "rdtjztmt";
file 101609 "sqqpcvq.llm";
dir "ssdlqcrw";
cd "lwqgsbg";
ls;
file 207528 "cpqhb.jsf";
file 38543 "cqjgspw";
dir "dtbzzl";
file 106337 "dtbzzl.njz";
file 302201 "pdv.ppg";
dir "pjts";
file 175215 "pvczm.cfw";
dir "sbvljdh";
cd "dtbzzl";
ls;
file 252091 "vhvn.zqv";
cd_up;
cd "pjts";
ls;
file 155681 "bdbfjbgt.rwg";
file 219192 "dtcz.gqt";
cd_up;
cd "sbvljdh";
ls;
dir "rdrqc";
dir "rtfpcswj";
cd "rdrqc";
ls;
file 242263 "pjts.mbt";
cd_up;
cd "rtfpcswj";
ls;
file 228044 "ssgcjt.twr";
cd_up;
cd_up;
cd_up;
cd "nztw";
ls;
file 30777 "vqfsh.smp";
cd_up;
cd "rdtjztmt";
ls;
file 276602 "pvczm.cfw";
dir "rzbb";
file 305089 "ssdlqcrw.dgb";
cd "rzbb";
ls;
file 155253 "pvczm.cfw";
cd_up;
cd_up;
cd "ssdlqcrw";
ls;
file 22423 "vqfsh.smp";
cd_up;
cd_up;
cd_up;
cd "pjnghbm";
ls;
file 189296 "ctqfg.ljd";
dir "dtbzzl";
dir "pjts";
file 205394 "ssdlqcrw.lgv";
cd "dtbzzl";
ls;
file 239152 "fbb.gtn";
dir "hlw";
file 39308 "hsnbffzf.qvc";
file 211316 "nhm.zhz";
dir "nztw";
dir "pvsjpn";
file 230237 "twjq";
cd "hlw";
ls;
dir "lfqqrp";
dir "nztw";
cd "lfqqrp";
ls;
dir "mbmfpz";
dir "mdhfdlw";
dir "pjts";
dir "qzs";
dir "ssdlqcrw";
cd "mbmfpz";
ls;
dir "fsrbwl";
dir "lsmpw";
cd "fsrbwl";
ls;
file 154657 "ftlc.zbr";
dir "ltsj";
file 228929 "pvczm.cfw";
dir "ssdlqcrw";
file 234216 "tdl";
cd "ltsj";
ls;
file 51204 "vmq.sjg";
cd_up;
cd "ssdlqcrw";
ls;
file 64928 "nztw.gpn";
cd_up;
cd_up;
cd "lsmpw";
ls;
file 61867 "dtbzzl.dgj";
cd_up;
cd_up;
cd "mdhfdlw";
ls;
file 92462 "dtbzzl.jmq";
file 239442 "tczcgf.zwj";
cd_up;
cd "pjts";
ls;
file 144464 "dtbzzl.lnz";
dir "pjts";
file 118500 "swgt.smz";
cd "pjts";
ls;
file 173783 "dvztnn";
file 103088 "jlv.pgh";
file 39332 "nhm.zhz";
file 266947 "pppfcg";
cd_up;
cd_up;
cd "qzs";
ls;
file 11155 "cpqhb.jsf";
cd_up;
cd "ssdlqcrw";
ls;
file 192414 "gcwqcwrf.vmb";
cd_up;
cd_up;
cd "nztw";
ls;
file 313009 "nwt";
cd_up;
cd_up;
cd "nztw";
ls;
file 280535 "dtbzzl.grj";
file 269725 "ssdlqcrw.tqs";
cd_up;
cd "pvsjpn";
ls;
file 105150 "jvjb.mdd";
file 142501 "nztw.cvp";
cd_up;
cd_up;
cd "pjts";
ls;
dir "btc";
dir "tpwcmvch";
file 259357 "vqfsh.smp";
cd "btc";
ls;
file 5264 "gdjpql.wqr";
cd_up;
cd "tpwcmvch";
ls;
file 141657 "jjdgzwnq";
file 15650 "nhm.zhz";
dir "nlrq";
file 182100 "qgf.qgj";
file 302332 "qshf";
file 244799 "vhvn";
dir "wvnqzjf";
cd "nlrq";
ls;
dir "dtbzzl";
file 207207 "gnd.vmb";
cd "dtbzzl";
ls;
file 271143 "wjbzmc";
cd_up;
cd_up;
cd "wvnqzjf";
ls;
file 64128 "mtzc.rqb";
cd_up;
cd_up;
cd_up;
cd_up;
cd "vhvn";
ls;
file 187526 "vqfsh.smp";
cd_up;
cd "vrt";
ls;
dir "drrnm";
dir "fqr";
file 270995 "nztw.mfg";
file 137476 "vqfsh.smp";
cd "drrnm";
ls;
file 250912 "pvczm.cfw";
cd_up;
cd "fqr";
ls;
file 229272 "nszfcq";
dir "nztw";
file 170643 "phh.pdl";
cd "nztw";
ls;
dir "bqf";
cd "bqf";
ls;
file 9998 "vqfsh.smp";
cd_up;
cd_up;
cd_up;
cd_up;
cd "zgrjmtcq";
ls;
file 109025 "vhvn";
cd_up;
cd_up;
cd "ftrccld";
ls;
dir "dtbzzl";
dir "fvmh";
dir "fwztt";
file 22306 "jngjc.mpd";
file 190320 "lnr.jhn";
dir "lsvvn";
file 295676 "nztw";
file 135025 "nztw.ssc";
dir "pjts";
dir "qglhlggq";
dir "rslphgp";
file 247764 "ssdlqcrw.jnm";
dir "vhvn";
cd "dtbzzl";
ls;
dir "fgwh";
cd "fgwh";
ls;
dir "dpdvswq";
cd "dpdvswq";
ls;
dir "jsstq";
file 248465 "vhvn";
cd "jsstq";
ls;
file 252517 "nztw";
cd_up;
cd_up;
cd_up;
cd_up;
cd "fvmh";
ls;
dir "djcn";
dir "dtbzzl";
file 303052 "fbnnfsbp.zzg";
file 77238 "mdpcghq.nls";
dir "mvppnhr";
file 238683 "ptw";
dir "zdqlwnc";
cd "djcn";
ls;
file 8600 "jjdgzwnq";
cd_up;
cd "dtbzzl";
ls;
dir "sppdjcm";
dir "vtnzqtvj";
cd "sppdjcm";
ls;
file 237925 "dvfctpg.zbn";
dir "fghb";
dir "pfjdsm";
dir "pjts";
file 314661 "zfchfq";
cd "fghb";
ls;
file 280081 "cpqhb.jsf";
file 88448 "wbcpnnvs.sjc";
cd_up;
cd "pfjdsm";
ls;
file 256877 "bssmgf";
file 127978 "drwttw";
file 103674 "hznr.hjg";
cd_up;
cd "pjts";
ls;
file 191709 "qhwwpzn.dsc";
cd_up;
cd_up;
cd "vtnzqtvj";
ls;
dir "rrl";
cd "rrl";
ls;
file 281036 "jjdgzwnq";
dir "lzlswv";
dir "sjsqnvq";
file 245082 "ssdlqcrw.smq";
cd "lzlswv";
ls;
dir "dmh";
cd "dmh";
ls;
file 41234 "hlhgn.mvr";
file 233542 "tgv.csn";
cd_up;
cd_up;
cd "sjsqnvq";
ls;
file 221327 "qjncmbn";
cd_up;
cd_up;
cd_up;
cd_up;
cd "mvppnhr";
ls;
dir "ldwv";
file 176153 "nztw";
dir "rmdjdqvl";
dir "tmj";
dir "vhvn";
cd "ldwv";
ls;
file 161179 "mjsm";
cd_up;
cd "rmdjdqvl";
ls;
dir "gnztqmhv";
dir "lpmhfr";
dir "tphjm";
cd "gnztqmhv";
ls;
file 176043 "qlds.mpq";
cd_up;
cd "lpmhfr";
ls;
dir "jrrdsd";
cd "jrrdsd";
ls;
file 114477 "vqfsh.smp";
cd_up;
cd_up;
cd "tphjm";
ls;
file 74809 "dcfmjn";
cd_up;
cd_up;
cd "tmj";
ls;
file 252001 "cpqhb.jsf";
file 49666 "pqpq";
file 139885 "qpj.wpb";
file 116339 "vqfsh.smp";
cd_up;
cd "vhvn";
ls;
file 89397 "dtbzzl.hvp";
file 105454 "pvczm.cfw";
file 280352 "zdzm";
cd_up;
cd_up;
cd "zdqlwnc";
ls;
dir "fbhcv";
file 8676 "jjdgzwnq";
file 99885 "nhm.zhz";
file 234563 "pjts.gdj";
dir "rsdltnvc";
cd "fbhcv";
ls;
file 71695 "hrzzgwqt";
file 296401 "vqfsh.smp";
cd_up;
cd "rsdltnvc";
ls;
file 41623 "gcvtqf";
file 233747 "wdcssvgh.vfs";
cd_up;
cd_up;
cd_up;
cd "fwztt";
ls;
file 96594 "jjdgzwnq";
file 245415 "mtp.szl";
file 129782 "pjts.jjr";
file 308104 "pvczm.cfw";
dir "ssdlqcrw";
file 155109 "vhvn.smj";
dir "vvzsr";
cd "ssdlqcrw";
ls;
dir "bzd";
file 292228 "dtbzzl.tdb";
file 107505 "ssdlqcrw";
file 181384 "tfnrpsd";
cd "bzd";
ls;
file 84648 "brdc";
file 171457 "vhvn";
cd_up;
cd_up;
cd "vvzsr";
ls;
dir "bcdqrs";
file 147437 "jjdgzwnq";
dir "ssdlqcrw";
file 197054 "ssdlqcrw.dpz";
dir "vhvn";
dir "wthshgg";
cd "bcdqrs";
ls;
file 297401 "pspd.dlq";
file 136072 "pvczm.cfw";
cd_up;
cd "ssdlqcrw";
ls;
file 293104 "dtbzzl.pdh";
cd_up;
cd "vhvn";
ls;
file 178932 "gvrht.cbm";
cd_up;
cd "wthshgg";
ls;
dir "dppwvtmp";
dir "ljgszd";
file 88822 "pcmw.bbq";
file 255776 "pvczm.cfw";
file 163501 "ssdlqcrw";
dir "vbjsmgp";
dir "vzqc";
dir "zmpdrpd";
cd "dppwvtmp";
ls;
file 45608 "dtbzzl.lfq";
file 164648 "gdch.bzp";
file 65225 "nhm.zhz";
cd_up;
cd "ljgszd";
ls;
file 125627 "vqfsh.smp";
cd_up;
cd "vbjsmgp";
ls;
file 236951 "zpbgb.zmv";
cd_up;
cd "vzqc";
ls;
file 234565 "fjfpbjjp";
file 254986 "jjdgzwnq";
file 164495 "nztw.qhz";
dir "vhvn";
cd "vhvn";
ls;
file 199196 "nztw";
cd_up;
cd_up;
cd "zmpdrpd";
ls;
file 123210 "bznqq.dbv";
file 141163 "jjdgzwnq";
file 302352 "wjf.tdv";
file 92016 "wljnwsh";
cd_up;
cd_up;
cd_up;
cd_up;
cd "lsvvn";
ls;
file 282867 "phv.ncc";
cd_up;
cd "pjts";
ls;
file 40866 "jjdgzwnq";
cd_up;
cd "qglhlggq";
ls;
file 19577 "dtbzzl.ngb";
file 21171 "jjdgzwnq";
file 136074 "pvczm.cfw";
file 212428 "rlpjjf.lvh";
dir "vhvn";
file 274669 "wcqlws.ndv";
dir "wpvq";
cd "vhvn";
ls;
file 183301 "cbppfp.vbc";
file 84069 "cqnz";
dir "dtbzzl";
dir "mdng";
file 126627 "pjts.pvp";
dir "ptqq";
file 47594 "pvczm.cfw";
file 154978 "qlnnfbvd";
cd "dtbzzl";
ls;
file 50385 "ccgbrdmb.hrr";
file 22427 "rzlwl.jbt";
cd_up;
cd "mdng";
ls;
dir "gdqqtvnp";
file 224013 "gtv.tbz";
file 121884 "jjdgzwnq";
dir "nrmhpblm";
file 142950 "nztw";
file 9710 "pvczm.cfw";
dir "vhvn";
cd "gdqqtvnp";
ls;
file 292349 "vhvn.nfr";
cd_up;
cd "nrmhpblm";
ls;
file 52703 "jbvd.mlc";
file 78268 "pfns.lpr";
cd_up;
cd "vhvn";
ls;
file 274549 "pjts";
cd_up;
cd_up;
cd "ptqq";
ls;
file 257967 "jqppq.lgb";
file 166450 "nhm.zhz";
cd_up;
cd_up;
cd "wpvq";
ls;
file 173437 "vqfsh.smp";
cd_up;
cd_up;
cd "rslphgp";
ls;
file 29192 "pvczm.cfw";
file 18984 "ttpfnqvn.cdr";
file 302301 "vqfsh.smp";
file 291211 "vsvtc.wwf";
cd_up;
cd "vhvn";
ls;
dir "ssdlqcrw";
cd "ssdlqcrw";
ls;
file 76864 "jpwvws.fwv";
file 26365 "nztw.css";
file 185966 "vqfsh.smp";
cd_up;
cd_up;
cd_up;
cd "jjlbmtw";
ls;
file 211239 "ctfhmm.ssv";
file 230020 "nztw";
file 109641 "sqtjn";
cd_up;
cd "jpncfpb";
ls;
dir "hjgwcmh";
file 286054 "pcffhsw.bdm";
file 260831 "pvczm.cfw";
dir "vhvn";
cd "hjgwcmh";
ls;
file 92277 "bbjhc";
dir "fmst";
dir "gzjq";
cd "fmst";
ls;
file 105833 "cpqhb.jsf";
file 315858 "nhm.zhz";
file 233459 "nztw";
cd_up;
cd "gzjq";
ls;
dir "prjqfwf";
dir "ssdlqcrw";
cd "prjqfwf";
ls;
file 151003 "jnmgdb.rhn";
cd_up;
cd "ssdlqcrw";
ls;
file 103688 "cpqhb.jsf";
cd_up;
cd_up;
cd_up;
cd "vhvn";
ls;
file 14901 "cpqhb.jsf";
file 98212 "tztzq";
cd_up;
cd_up;
cd "mddr";
ls;
dir "qpfjp";
cd "qpfjp";
ls;
dir "cfhv";
cd "cfhv";
ls;
dir "ssdlqcrw";
cd "ssdlqcrw";
ls;
file 134280 "vvnpvrqb.hdv";
cd_up;
cd_up;
cd_up;
cd_up;
cd "mthvntdd";
ls;
dir "bcdcz";
dir "cngbf";
file 62389 "cwtvl";
dir "mqjjbq";
dir "nhblb";
file 6743 "pvczm.cfw";
dir "ssdlqcrw";
dir "ttvgr";
dir "vdmm";
dir "wnhnwjm";
dir "zdvbsb";
cd "bcdcz";
ls;
file 213688 "dtbzzl.hsv";
dir "lbvbc";
file 100222 "nndbhrf";
file 115627 "rqnsfbz.rmf";
dir "tvgclpsc";
file 258672 "vqfsh.smp";
file 163927 "whgmd";
cd "lbvbc";
ls;
file 224836 "fpfpwtf.zfz";
file 103806 "nztw";
cd_up;
cd "tvgclpsc";
ls;
file 76900 "cpqhb.jsf";
file 282820 "qtffdmsg";
cd_up;
cd_up;
cd "cngbf";
ls;
dir "hstph";
file 12089 "jqvnttq.dsh";
file 38052 "nztw.sqj";
dir "qrnpjz";
cd "hstph";
ls;
file 172788 "pjts.qmt";
cd_up;
cd "qrnpjz";
ls;
dir "blzc";
dir "rvl";
dir "zvhtzqqc";
cd "blzc";
ls;
file 108342 "nhm.zhz";
cd_up;
cd "rvl";
ls;
dir "bcrf";
dir "sjbr";
cd "bcrf";
ls;
file 182498 "cpqhb.jsf";
dir "dcb";
file 14228 "ggsq";
dir "gnhvtgm";
cd "dcb";
ls;
dir "zlgjzcjv";
cd "zlgjzcjv";
ls;
file 18316 "cpqhb.jsf";
cd_up;
cd_up;
cd "gnhvtgm";
ls;
file 110236 "nhm.zhz";
cd_up;
cd_up;
cd "sjbr";
ls;
file 133009 "cscbp";
file 315907 "vtpmnwt";
cd_up;
cd_up;
cd "zvhtzqqc";
ls;
dir "fglfpn";
dir "gtzrq";
dir "hfgdcf";
file 274977 "ltbzhjn";
dir "msc";
dir "ssdlqcrw";
cd "fglfpn";
ls;
file 39153 "dvhjpfc";
cd_up;
cd "gtzrq";
ls;
file 60625 "sqljdlpz.wpw";
cd_up;
cd "hfgdcf";
ls;
file 36016 "qdvnn.pbt";
cd_up;
cd "msc";
ls;
file 56601 "cpqhb.jsf";
dir "hrz";
dir "vlhllqz";
cd "hrz";
ls;
file 241511 "fhngt.mlb";
file 286505 "nhm.zhz";
cd_up;
cd "vlhllqz";
ls;
file 157880 "nhm.zhz";
cd_up;
cd_up;
cd "ssdlqcrw";
ls;
file 121507 "dssrvr";
file 295897 "lvtwlb.whn";
file 12047 "pjts.gqc";
cd_up;
cd_up;
cd_up;
cd_up;
cd "mqjjbq";
ls;
file 157818 "blbmb.fcv";
file 119103 "ccppbmqb.pbt";
file 141463 "cpqhb.jsf";
file 197900 "drhmws.fdd";
dir "fmvp";
dir "rhldnjlt";
file 175029 "vqfsh.smp";
cd "fmvp";
ls;
dir "dhnn";
dir "dlcvwqw";
file 131432 "hnv.tlr";
dir "jzqt";
file 98127 "nhm.zhz";
dir "nvsdbjj";
dir "pjts";
file 9179 "pvczm.cfw";
file 121310 "vqfsh.smp";
cd "dhnn";
ls;
file 173921 "qcjsdg.zfg";
file 58654 "vhvn.csb";
cd_up;
cd "dlcvwqw";
ls;
file 285116 "zjb";
cd_up;
cd "jzqt";
ls;
file 104478 "clmzwnf";
file 299622 "cpqhb.jsf";
file 301236 "jjdgzwnq";
dir "nsvlqq";
file 136737 "vhvn";
dir "vmp";
file 12932 "wrd.jsz";
cd "nsvlqq";
ls;
file 111712 "dtbzzl.htn";
file 213593 "hvzlmtj.ztr";
cd_up;
cd "vmp";
ls;
file 104275 "jjdgzwnq";
cd_up;
cd_up;
cd "nvsdbjj";
ls;
file 180999 "jjdgzwnq";
file 219819 "vhvn";
cd_up;
cd "pjts";
ls;
file 111715 "npzn";
cd_up;
cd_up;
cd "rhldnjlt";
ls;
dir "ffhcbvmf";
dir "vprlq";
cd "ffhcbvmf";
ls;
file 247668 "cpqhb.jsf";
cd_up;
cd "vprlq";
ls;
file 168090 "jmmtz.fzt";
file 68360 "nhm.zhz";
file 304580 "vqfsh.smp";
cd_up;
cd_up;
cd_up;
cd "nhblb";
ls;
file 154794 "hrgsrbnj.tch";
dir "nfwl";
dir "ptc";
dir "rng";
file 50110 "swtt.tct";
dir "vhvn";
dir "vlj";
cd "nfwl";
ls;
dir "lqs";
dir "mlvnlz";
cd "lqs";
ls;
dir "mbcft";
dir "ntmvt";
dir "nztw";
cd "mbcft";
ls;
file 78188 "bdnr";
file 194668 "pjts";
cd_up;
cd "ntmvt";
ls;
file 75647 "nhm.zhz";
file 186651 "scsvrqpf.jhb";
cd_up;
cd "nztw";
ls;
file 164920 "vqfsh.smp";
cd_up;
cd_up;
cd "mlvnlz";
ls;
file 289891 "wjf";
cd_up;
cd_up;
cd "ptc";
ls;
file 190002 "pjts.vmh";
cd_up;
cd "rng";
ls;
file 39093 "nhm.zhz";
cd_up;
cd "vhvn";
ls;
file 275854 "hbv";
cd_up;
cd "vlj";
ls;
dir "qqqrm";
file 203390 "ssdlqcrw";
cd "qqqrm";
ls;
dir "wcpllh";
cd "wcpllh";
ls;
dir "pwg";
cd "pwg";
ls;
file 19102 "dtbzzl.qvp";
cd_up;
cd_up;
cd_up;
cd_up;
cd_up;
cd "ssdlqcrw";
ls;
file 181610 "vqfsh.smp";
cd_up;
cd "ttvgr";
ls;
dir "vpcpd";
cd "vpcpd";
ls;
file 28102 "mbb.szv";
file 304017 "rshrzjhn";
cd_up;
cd_up;
cd "vdmm";
ls;
file 95079 "tssjcd.lfg";
cd_up;
cd "wnhnwjm";
ls;
file 67931 "mmhcgsc.zjf";
file 22062 "nqpzsf.ccc";
file 219285 "trr.vcn";
cd_up;
cd "zdvbsb";
ls;
file 293736 "dtbzzl.ftj";
cd_up;
cd_up;
cd "ptzsl";
ls;
file 26404 "jnsdzmbd";
cd_up;
cd "wmqc";
ls;
dir "dtbzzl";
dir "hdzmzc";
dir "nmmpwqvz";
dir "qjnm";
cd "dtbzzl";
ls;
dir "hpzgnb";
cd "hpzgnb";
ls;
file 189696 "sbmdrbm";
cd_up;
cd_up;
cd "hdzmzc";
ls;
file 143510 "dtbzzl.dmp";
cd_up;
cd "nmmpwqvz";
ls;
file 276725 "nhm.zhz";
cd_up;
cd "qjnm";
ls;
file 202264 "cpqhb.jsf"
].

Close Scope Z_scope.
Open Scope string_scope.

Inductive file_tree :=
  | t_dir : string -> list file_tree -> file_tree
  | t_file : string -> Z -> file_tree
.

Inductive context_tree :=
  | ctx_top : context_tree
  | ctx_idx : nat -> string -> list file_tree -> context_tree -> context_tree
.

Definition loc_tree : Set := (file_tree * context_tree).

Definition op_bind {A B} (o : option A) (f : A -> option B) :=
  match o with
  | None => None
  | Some a => f a
  end.

Fixpoint find_idx' {A} (f : A -> bool) (l : list A) (n : nat) : option (A * nat) :=
  match l with
  | nil => None
  | a :: r => if f a then Some (a,n) else find_idx' f r (S n)
  end.

Definition find_idx {A} (f : A -> bool) (l : list A) := find_idx' f l 0.

Fixpoint remove_nth {A} (n : nat) (l : list A) :=
  match n, l with
  | _,nil => nil
  | O, (a::r) => r
  | S n, (a :: r) => a :: remove_nth n r
  end.

Fixpoint insert_at {A} (n : nat) (a : A) (l : list A) :=
  match n, l with
  | _,nil => [a]
  | O, r => a :: r 
  | (S n),(h :: r) => h :: insert_at n a r
  end.

Fixpoint to_top (ft: file_tree) (ctx: context_tree) : file_tree :=
  match ctx with
  | ctx_top => ft
  | ctx_idx i s cs ctx' => to_top (t_dir s (insert_at i ft cs)) ctx'
  end.

Definition build_tree_step (c : command) (t : loc_tree) : option loc_tree :=
  match c, t with
  | cd s, (t_dir n cs, ctx) =>
    let ft := find_idx (fun x => match x with | t_dir s' cs' => s =? s' | _ => false end) cs in
    op_bind ft (fun pair => let (t0,i) := pair in
      Some (t0,ctx_idx i n (remove_nth i cs) ctx)
    )
  | cd_up, (t, ctx_top) => None
  | cd_up, (t, ctx_idx i s cs ctx) => Some (t_dir s (insert_at i t cs),ctx)
  | cd_top, _ => let (ft,ctx) := t in Some (to_top ft ctx,ctx_top)
  | ls, _ => Some t
  | dir name, (t_dir s cs,ctx) => Some (t_dir s (t_dir name []::cs),ctx)
  | file z name, (t_dir s cs, ctx) => Some (t_dir s ((t_file name z)::cs),ctx)
  | _,_ => None
end.

Fixpoint build_tree' (l : list command) (t : loc_tree) : option loc_tree :=
  match l with
  | nil => Some t
  | c :: cs => op_bind (build_tree_step c t) (fun lt => build_tree' cs lt)
  end.

Definition build_tree (l : list command) : option file_tree :=
  op_bind (build_tree' l (t_dir "/" [], ctx_top)) (fun x => let (t,c) := x in Some (to_top t c)).

Open Scope Z_scope.

Fixpoint zsum (l : list Z) :=
  match l with
  | nil => 0
  | (x :: t) => x + zsum t
  end.

Fixpoint calc_size (t : file_tree) : Z :=
  match t with
  | t_file _ z => z
  | t_dir _ cs => zsum (map calc_size cs)
  end.

Fixpoint calc_1 (t : file_tree) : Z :=
  match t with
  | t_file _ _ => 0
  | t_dir _ cs => zsum (map calc_1 cs) + let s := calc_size t in if s <=? 100000 then s else 0
  end.

Definition impl_1 (l : list command) : option Z := option_map calc_1 (build_tree l).

Example test_1 : impl_1 test_in = Some 95437. Proof. vm_compute. reflexivity. Qed.

Fixpoint zmin (l : list Z) :=
  match l with
  | nil => 0
  | [x] => x
  | (x :: t) => if x <=? zmin t then x else zmin t
  end.

Fixpoint calc_2 (t : file_tree) (z : Z) : Z :=
  match t with
  | t_file _ _ => 0
  | t_dir _ cs => zmin (let s := calc_size t in if s >=? z then s :: filter (fun x => x >? 0) (map (fun r => calc_2 r z) cs) else filter (fun x => x >? 0) (map (fun r => calc_2 r z) cs))
  end.

Definition impl_2 (l : list command) : option Z := option_map (fun t => calc_2 t (calc_size t - 40000000)) (build_tree l).
  
Example test_2 : impl_2 test_in = Some 24933642. Proof. vm_compute. reflexivity. Qed.

Compute (impl_1 input).
Compute (impl_2 input).