From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith Psatz.
From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.
From Coq Require Import Nat.
Import ListNotations.

Open Scope string_scope.

Definition input : list string :=[
  "dtddvvhwttHJhwdhJPddhwJGppmGjgpQgTjQplQpTljwpg";
  "BfzSzRSVVMVNRMDDNBSNSnfBmbrglGQbmNpQggFjpgpbQlQb";
  "ZSBffLnVZdCCPJjhhL";
  "RGCZpWWWFlHQQbgvFssg";
  "jLnMzjnrnjjNjhrjdwbHscsVVgDVQPvPwh";
  "nfJnLMLzjJMtnjNnnBbZtBWBqqbTTTBRpT";
  "nddlhBtqTBqTVSlBtmCmVcRVmZggfWbcZc";
  "jDjvPrPSNPwrDNRWbbgWCjRRCcWm";
  "DzDwSpFrvrvFPQLzQnsqztBthTJnGJqlsJ";
  "gssGmzwgRgsNmTsqgDnDJnbDHHhhzFdDDh";
  "WQVFjMWrVQrVvVVjVctSSLSMZhnJZPBnbdnhbnHZZBDJBh";
  "VCtcccVQLrfvrSlGmfTfNgfmlFgm";
  "DsmfsBbNNZhDWsbmWmNbbPDHLFjcctjjGcnZGzncnctcGH";
  "SwVQJrjVwpgSVRpjpVRrlTMCFFCLCFFcHzzGMcHrtHHH";
  "ppVwTwSwpwvSlSlJTjVVbPhsvvBssWsNfsqWPvWs";
  "BJwqwJtqqDDDrGDnPFzPFfpphD";
  "TgZscCHQLSHgZcfMzpjFFjzsshfj";
  "LcNlTVQCCVLLZTLNvpRtpvBBvRJmNB";
  "bDBGQBBCTTNPGPPwPzcHfVHrDtLWLVrWVjjHWr";
  "gpssqqsqlMFfLZQWftjVpr";
  "lvqqFMRlFcQvbzCNCG";
  "fhhMDdPhWMJMWvhhSfwRSGlzFbSFNlzw";
  "LcqTCqcgZqjTggVjcwbFRwbDBTzbRGRwTS";
  "cHLpZgnCHpQsDdsmQp";
  "jwStJjJhtgJStpgwJMggQWqQTNTfNTWfbNNMCCNG";
  "zRZnFPRZPVncPGVFRlRmGHCTqfCCPCHHfLfbTQCbTq";
  "lnVmFZRZDnRVBFZcrZlhjpggvppthGhphpwprS";
  "lcttSptHHllQbMcsrltSQGpvNBzpgWBBBDDGWzvgLz";
  "PdjPVRFhFqFjRRCjzvRWnWLBLgbBBLzg";
  "hhCCFbPTmjPdhZjhPhZCmTjjMsrJSfHrcmHJrHHmlcJSsmft";
  "WhWnLZSSnSzQQhfLLNSfmDHrCFDDHtpjGGtTGQCG";
  "gJbJBcMVwJlRRdbwvwJBVtjdtHHTmptpHTCtTFrFCp";
  "JwwgvRMJlvJwgqgvqRMcnWWhLPzzsqfnZWnfWWnj";
  "zdwTSvzHMvVSzDCtZhtGmbTGhm";
  "lcBHfFjjgtsmDCgshD";
  "cJPBnqNFnLfHJFPqljclqJzQvSSVWvSnMwvSzSWWdMWM";
  "pNJMcZrsZDLDcbcccMpQffHqvgdwdFFmdmqwvqmgmzsw";
  "hhnWjTTStRCGSMgvvgvdqvdFjvVz";
  "hCTSWhPGttTCGBWMRlTCMSnPBDJpbDfDpNpbbNJfJDJbpJpN";
  "lbcQcSNFchhQNqHLLqhLqrMpqM";
  "WfsnsszPWfBBVpHdprrpdnGL";
  "WTzWfwjtTBzwwBDzmfSSQmmbFZcpQNcbZZbv";
  "PwSJSlmtPPgwgmHhPPvRvGHLRLQRBQGCQVGb";
  "rnsFDnnfGGRWQRnW";
  "dfTTfTFdfrfFFFzQFPJPSSlhqtllNPzgwS";
  "MMbTFZrcrGZMDqNStWScDtzS";
  "dvWmhQggQvCnfnqPqDnDjnfP";
  "lgvdvLClWCQlgdhlrMBBHpGlwbHHGH";
  "CQHgQpPdCQpsCpzRwSVRSzRZwZ";
  "JbNBbcbrJvbJnqVznwwTzrzz";
  "wNbfLvvfDNNBHPFLhddFsQss";
  "VVzqvwzpqvzqNVVHGNqjHpNfSQDWdWwJdPWrWccdQrWrrDdd";
  "nLcbtBRtBhcnWSJQlJSgll";
  "tFbLLLRRhMtsBMtRCRsLCMBVjjvHTNjHHjzcvFFppGHzTT";
  "QCPrPWNPlWjGGZqGmvdPGd";
  "JgpHpSfphhfpVmBSgnTvdtddGvZVdvddDv";
  "LhphBfHpSwSwfHcMgfpmBWWWbsNCjFWsljNbbjlLjb";
  "QJmQbRmdfmdSQRQZSJltTltNvTrtDtrlftDD";
  "wpZcHVwwMgBpWMVgWpHLphztDvvGvDPlnGvDLlNrDPnNPl";
  "McgWFWHHHzVpMgZQFqbjsdjqqRCq";
  "JPhLFfMJDLQnjNCvWWpdjjdM";
  "crSwnwVnwSRBcNBNjjWCdC";
  "GlbTGbsSzrtbmbfhnJQP";
  "fDLSWVDRHHfVWHgPcZlDlZbbQhBcZQbb";
  "jrmFmprTpFztmddjdjrpvBQlQZGhQbTsQbGcQbcbQs";
  "nvqdpmjFnwpLSWlfnVNnWl";
  "nZBRbBJzznNNCnJZwnBSCJMcpcTpcwhcqhmsmWMwFWLL";
  "jQfvjgtfvPlHHqWpvWThpWqWch";
  "VljjjgjQjrTDlDgrHtVCbnJZzNzNbnRNNJZrJR";
  "MQtJnttlMLlJQsNhQrVVrFVWRRbbVFdJDD";
  "vGjvzmjzgHqSjjSzmSGHTWbfDFWrbFzFfdDVrfRWDb";
  "qPRqvTSPggqGgHCmllnCNLtnhcnnsnnw";
  "zrlZsQMFrsgQFMMjMCbjVDCTCW";
  "NqHNRdBppcJJcTpdmRfHThpdDWDtvbWVtbLjWbttWqqCCbLt";
  "mhJpJHTJmBhcJhwhgwzsQwSSlzQQzGlZ";
  "TvsszlvnzRRVTqzVrqrjjZGPfQPFqPqG";
  "mcNhDNchppWmWSNhdSmSCQNjPFjrfGjrgPFCrgFPgPgrLf";
  "SDddWpdMWSwNDmMNwlJRQwJlsVRRvzlsHt";
  "DTtggjsFFFTlPJhvctBqBqSRmSMBSRnmnRcm";
  "fGfwZdrbHVLdbGdHHwwQGVwBBCMMfvCNRNSMMMSRBmmRCN";
  "dGZzGHGVVbvHvHwbzpGbHLrwFDDFTtsglhFspgJshslTDJjT";
  "CbzspssWwCPcvvplrfqfDCJrDqdllB";
  "LjttnjNTNGgQQJdBrffTwB";
  "nVtLSgggjFwtMczhvzpZbSZW";
  "HCzCHHvWthWFHhssWCVmnqZrnqVrmrmgnbrqmN";
  "wPPGBjQQGwGbSlSLwgnpnrBZnBBmnMNnMN";
  "jTTbJlJjPPLPGHHTthhhHcFWTT";
  "qRdvvPDrCpzPHzcdrrcRqtbJJgjhgtWjJgbWJtgCFb";
  "GTwGwNscLllGTZmGSTZGlSBMnhggjbgtgbtbsgWFFMhbMF";
  "ZSQBSmlmzcrdQRqz";
  "cSpTRphwwghRfgSScqPpnDqDCjDjJJJJDvDLCvvn";
  "BVmmQFQBQVNBVmsWlbQFGBBlCHTJznzHLHvvCnjjNLHJDLHD";
  "MFsZZMbBGblbQTmQsFsQMMfPcPcwSpwtStgPphZtctPc";
  "QZbbZBdjPBjbQQbZnSSltlfwWvlvwNtNjwFMMN";
  "DLVqTJqpSVtfsptwfWpv";
  "rcRRVVTSbPQBPrBZ";
  "tjSgSjLFSnVjDWRsQj";
  "lcdqhfFpqZGpZqznrVRWPrnWRVBsVG";
  "FHddNNNHwTHMHvvS";
  "qCSDSQlwBHNbgJrHnLJH";
  "GRpRpRfnmRWWVWgVrF";
  "jhdZjpnvGfTZZQPlCtqQQSsS";
  "FMZSGWWBrZjMBZMrBWMGjjZDnCRqpgPnbRwPbFnvvqFnDR";
  "QHcpfVVslfdVlQclcctqRgqgbsCwbCwPCCCPwD";
  "NLHfLhclmmhdfNNpfQMBmZWBrJMmZWBzMrjj";
  "pBMpRgBMQwzRthmzLC";
  "HPcJvrvDbjvrFDcvWrHfHfWHmdddtdTLztmtdtfllmNdNhNz";
  "DvPFDvnPJLngQsggMGGQ";
  "BbcFHvbhhDbbTSvZmwwgJPPlDlZldd";
  "prCrNLMNgWWJBdrJ";
  "fQMLCfLLtpqsNNMnnfBhcBSVGbhhhcqVbcjc";
  "ZchcZZjmmNpgmJtgmM";
  "RLrHllWrQZQGlBpbGFGFFM";
  "RQnLHrqPLnZHzqjfVPcvVTfCvPTC";
  "fMtwjfMwrbjfGrtrpPGrwpNNVNVqcbdVqHZTFNbcHSNL";
  "mgzvDnJmnJhFJHSTNqZLHncHLS";
  "vRzhzslJFhRffPPQMjGtGl";
  "VMMNjWppQVwzNWrZdrrtMCMZCtMT";
  "ngDScLcvPPgDPDGhGDPGSHVbHTHmZtTSrBHZbZBmBb";
  "LhlglLghnVlplswJjs";
  "bGJQZZTQQLJJbQZlTZLjCGQTsDhWFhmshhvjWVFVVrgtDsst";
  "NScqwHcwwnnzBwqPqqsmVNhgsDDVtsghrFFg";
  "pcrcwnpcffrcBzfbCRLpRLMMRlRLQl";
  "hzCzCzpRgCzzzCctNsNWNqsZqZhPqNPb";
  "TdBwmdrrrDmvwTvqNsSRssPlsWsq";
  "FDBRRHDMTmBfmrmngnpjGgVptMgLCp";
  "ZPLLnSPMFGvFZMSvHhDhqHfqvfqbDW";
  "GgcppCgBcrQBBgplrVddhDqqqfdHgWdfqb";
  "CcCjQszmGBQjrcCwCmCccPwPTPnMPTnMJSMMRZSPJL";
  "LcVVcqqSHRLzRnCfNnGzNW";
  "LZPPdljlCggMjgNM";
  "PTvwlPtwtlJvZTQvbcHppFLHVVTcFssF";
  "fpWzvzNgWJBVfBJzWzBVJNzWbZcbHhlbthjlrrPrjZZPHZhJ";
  "hRDmGCFDwQnStncrjnccHcMP";
  "GmmsGRmFTsFwSCsRQDsCSqqpfvfgzddWggvqdpfBWzVh";
  "wjRBFljJGDFwwlGGpBSjGDtwTVtTgHHHsHHsVTVzsHqq";
  "CPLNPdbWvbMWbcmvPNdLVqtsHqgCqHChZhhsVsHt";
  "PWcPfPvmvNQbbWdWpJjJBDptGnDFjftn";
  "mFFmJpDMmmnJFjWDVclsSpcflSsQwSsc";
  "HrjNNjHNfVwLNSSl";
  "tdZbhjHZHPbdCTvbbhhrGbbHMFmRMvnRRFmmvJMDmgJDJMnq";
  "szJZhshbsfZJjbttchPctdTnWnRWVWMMnBdLRpMnBz";
  "SrNwvDSwrCmnVRvjpWLBBn";
  "ggGmgNFrgSDwmNgrCmtPsZPsjQGsqPcsqqJP";
  "gjSWSjJSWrWzppzW";
  "MCMzHNGNqHfscsFtrtwscVcr";
  "qGHNGNHLCnLmTCHfMMmNTzzldzgJlJZZgJljgTdD";
  "QGTQtQzTmdTsGTLcdFTGzdtBBjtwvBBJDvDMHJgjJvww";
  "lPlqsZWnDJjZvZgV";
  "ShCfCRnWGFsRRRrF";
  "lwGtndCrrmGCwdmhzQrBzrHvLVggPgHv";
  "fjMjDZJqSDJfJqDNDjJffjZLHPHHFvVFzHBLgLFpFpBSgL";
  "MsTZWRNZfJZZqMGVGhhlhhccRnhC";
  "MMvncqvcHcSnsdzzgvdfQjpljpQVTdDQDRTRlVpQ";
  "wLCrNtBFFHHThRlH";
  "bPJtHmCWssqgGPvq";
  "LvTLsmDWvTWqTsmqjRTmjwgdwgnMHMMFgdtHmBmFVn";
  "rlSCJzCSfpGGlhznQdnwFhtHgBFwtV";
  "SGZJJSSrVfCbGJLjPsWbvjRsPTqR";
  "pNqVVDCMVMBpqJVdMNHrccGHrtNtTFFFrQ";
  "hwmllWbvvbnPvbSvtrFhhJzzHztcTztT";
  "WSnbnPbbbvlWlRvnsqqMgLRMjLgVLCJdRV";
  "GphVTGVMtQwtJmtCJP";
  "FRRsBBsFqRNZNNrgqBdRfCZvbmPgmQzJQPnmJbJmQPJPPmwj";
  "RNqsFrRfZZsZWvNqWRFvrBZvWhhCGVplhlWTlTpSCLpMhWMD";
  "RZRjgbZHjjhsSnRsZstDRStsTVpFhBqFphMqPPpTFQVMPFTM";
  "zrcGJwNNdwJrfNdJWvGdJzdTlTFlqTVPFTVFPPBpqNTbBP";
  "WwLdLGfrRLStCZbD";
  "mrmTqJWTvDDppTDb";
  "DGzBfCzNDzdMwnLlbn";
  "FVZPFZFFZPgjmWZsDtsq";
  "TpnFTnFRCgRgldMRnDnRcrcdbdPBHbtPqbVcccrH";
  "WNWLfQQmfhhSNwmrcbSVqPtbZDZcPb";
  "LQhwLQvQvNfJhJRDMGFRlCMDMD";
  "vLFTDmjVvLgnNHPphN";
  "lMClGCmsRdCnPzCccngCpz";
  "dlGZwRsRrRwswGsdSbbZSbVDrVBmDWWWFJrTrFvFTmqV";
  "SGsZRqGLWLLtZRHRRcLHGTlJjzgJpjzTpNTNJNWpTm";
  "MPMPvFFvFBrPPDPMQMPChjgpNpSNTmmmpNlTDljlTz";
  "vnhrvMvnhSRqqLqnfn";
  "mGFrlBmFQNQFljhqqqqbmHMsTPRbWWCsLMWRsb";
  "wnwtvpwVzDVpvzzwZppnctMLtMPWWCstTsWTsTLffRRW";
  "vwDJgZnvZJFqgLBFGqgl";
  "QdGltnWNWqTdqQWvWsMJcrTcFcrgshJRMs";
  "BzPLCDPzzzzCCLLfCBzfSDmLMrDJMglrcRbbhRsFhMrRJcsM";
  "fjSzwwHfSzPzfCVBHlpdjGnZqnZptqQWjGvG";
  "VbJZbgVzvzmhQpQWpQzhDp";
  "tHPPcGcFBlCctCGtGcBBNlDLMGfMLwWfwwqMLLJwQWwp";
  "dCHTPTPJdTBFPdrZjgsjrjnmdgms";
  "JJpBvJQBZVvcFqqnsWdWvjsn";
  "DCfbDbTtbgfCSHqqNdFMPhPDFnPPDWsPjM";
  "bTmzTNCTNmfqTgJQcpLrpZLzVlVL";
  "dtTLntTjzTftnmwnqGGQHNmm";
  "SWbShCPMBgBRRFSFtRZZmm";
  "DlJPCJCgPWhttzpvdjcpVl";
  "WdzsNvWMzNsMHWddWCVffqmSmScLPvLPgLgLPplrrPmL";
  "BtnzbnBhbwttwtZlmmlgcwSrLgmmpm";
  "bFhQtbGBTnjBBbjTtFBbVDzddDDfjdDDqNWVjWHj";
  "ppmtpgLLZLCbMQvQQThdtrvPhV";
  "BBlHBwHRjHqBzzbHHqjjQdDQTDhPQDvnQlrQDQvr";
  "HGjFzwHNczbzRFcGzHGFSJSpspsmpssMLLSZCppmfs";
  "MpGrMMMcTsHMVHcvbwwmmcRSmDmDmv";
  "zCNptqCBQQLCNLCzbfvSvbSzSDRDSmSv";
  "CNNqNgNQJNgQtCqLlllZdZhTrThsnHpVVssPTsGP";
  "jhSGcShDrLcLLFcw";
  "MVzQvQNZVLHvHPdhLW";
  "qzhhQlVbgqjmSjJDsgmR";
  "CFzSPCgcsVVzFgzSCsBJwjdwJtNllnwglJlp";
  "QrvbqWvvLbmvDMMmbdwFWpNNwwwwptjJWn";
  "RZRZZqvvvDbDHCRTGchHFSGG";
  "SszgPSPPVltDlqtz";
  "WfTdTBdQdFnWBBBhBhNjVJtpNsVlDDDHHJWp";
  "hQhrLFsBwdQPggbRgPwRMg";
  "frRppMMDMpDnJfprnZhrrhpzWgvvGCvvFzWFvzvVVWFGJB";
  "TcmLwTsccqwqbPwsdwqdTPSvBvzzztvggVvQCGWQCLBvCv";
  "sswNjscwmqjwSssjdZNMfHHlHhfrnrgnfR";
  "JpBJBdmdzZzzpngmbCnlqnNbNM";
  "MMTHGccLTLvwRMlRnnQnbblnRnSs";
  "vVGtvMcjLVGHfHDrPPWZppBpJpfZZZ";
  "FGJtlttPdPtGFldlPRGpJTVzSBSSggHgJjVmBMHjJm";
  "rhbvqrQLrWqrWLLfqbjjgNmVNSgzTmNgNS";
  "hsffZQqnqCfZzlPPGlRlcwDs";
  "HDDdZpcFwHFRFcZqDctpRDHpwTCVwjrBTQTBLBLBJJBjjQTJ";
  "ldlMzhlPshPbLrrVrQQCMQjB";
  "glzNfWlvbHqSdNNNcF";
  "jZCMtnZZHCZwBWMwCwtMmfPFfvHDvzHFLPmFDfvh";
  "RcrQdRRdGTzGvDGmfgjh";
  "TsQscdQsQNTNqQQpRrRVCCBMMJJWMMVNVjnNJM";
  "zVPWhVzLzWBWHZnlqBllqlpRbGNdffscGNdbDRnNSfcG";
  "MtvSFQQwMcpsGRNGFR";
  "vvTwJJSgmCSMmjVPPJWWhzllWLVV";
  "RjdfnJfmbVvVJVFQcs";
  "rZDZGBBZVvLZLHFW";
  "qPzTDPlVrjNgfCdmPd";
  "bcjmQPrnbmVmsLVrLrjmcHGRWlZHHRwHpZRHWWwH";
  "nFhqzFqJzDJfvfSFqFfGHWZZHGRJRWHZWdpWwZ";
  "hBCtDSSFCTqCCFzSnzMrLNmrMNPTNMQPMmNL";
  "qvNBSJVDJGGVSJbVDDVhDbbqPjpWpWzWrnpWvvWPMjnWnpWz";
  "mlTltwcwMWTPfNTN";
  "CtCwFmCgmcmlRFmFCtRCHgmDJsbBhVqsbBHVDbNHDHJqqb";
  "csBFBsLrBGBWcgLcBvRgpRhbwRwlbQwbwQgD";
  "DCqmDmtTRtRlhdlh";
  "qnCmTNPmmCnSSzmzNzGLzLccGDBzGrBLvvcW";
  "FjfBjHnHzPFwhvFFqh";
  "bjRpGsNsPqQvPclb";
  "NWGGWGrrZVZjsCLmDMMgzgrSnzSm";
  "MDgmmsNCmZMWmHCZLrvnLBBjPLVlPVbW";
  "zcJGQwJdFRnrBVzqzvPr";
  "hTQwhJwcfTFddFdGSfcRQQGFsggsgsHHnSmgsgsmgCnHNZpC";
  "BPfwzfsgsvfszvBRbQpttRVpJbJpVg";
  "LhTmHLbmbcFTFrWCbFqhFHLHVRpVtQpZVVDVprnDMJtJQnVZ";
  "TGWWbTFFGTqlHhqhSdNdNfNSldjjBfjv";
  "zCzpWTccHlWcPzMljMttbJfjmlfm";
  "DqqQVZZqVsqJnbbnmjbJJQ";
  "ZRmDZsSgVmGLsVqsLDFvrcccHrcTWCgWHBCHcCWp";
  "cvGlQMtQlPtQWWMlcGsrFwFdbgdbdGGDCDCwdd";
  "VChVZNBVjTTfhNTFgzrzrJgSdzgzwf";
  "THThZTqZRHZRqNVZNTVLjRCMmQsntQctMnsPmMmMcWtLMQ";
  "pNRHrbNlNnRLNpMMMTrcGcGTcccz";
  "ZttBmsJmZdjsvTTvvdBMjDhfMGWGDfDfcScjfD";
  "CmtTtwvtCsgllNHPPFbLpC";
  "NpQcvwwRHvdfRvQsNfBQNvfRhVmVMqsZMmMshjMMtWZtMmrm";
  "CGHbSSzFLSSHzTnbLnCWMrtWMtjnZMhZrqZtqW";
  "FzCPPzLbPgFJbHSPldNRpgNfvvccgvwf";
  "nSjpnnhNchMQZMSScnshshncJCGwHGClwmHPZlJPTVZCwHJf";
  "LvtzBTgLWgLPlPwHPLPJ";
  "dTBDqRqFzzhQFhshhNhM";
  "HjjdPsjnllHsbnnDnbTBzLBFBZLLpRFRcCHRFz";
  "wqqWwQhQQMCQffqqhtwMGhpZFRRZvzWzFvBvpvmcRvZm";
  "fGfghtNhthqJrQqMqMMSgDdbPjbssDbdSnjCdd";
  "cqPwJJnnffBFqSfJFnDDPVplLdglGgLVjzGLdVSzVt";
  "WHRTWNHsQTNbzsbCbTsvWrWtjlgVdLgLdvdgvmLjpGlgtm";
  "ZMQrTbNHZNsHHrQCZrNDFzhwnMJcfnDhJPPPFh";
  "LRCFbjNjbCZDmtmqmRRmLtFJBgWBBpvJMwBJvGjBBvMBgw";
  "TTrlfHzccVllZhdQgdGMJWvgWgBndwpG";
  "fVSshSVlsfslhsSHHSZtZZNmNFmtmbFCDF";
  "SPGCBPDMtbcbCtchSMccDTTrrrTFTrsrMTWHTHFVWF";
  "JmnzqVmmwwfpJpmdHRTRsdsTrFdrQp";
  "LqwLgzJgnjqLwgGcVbtjDGjcVbhv";
  "PQcMvrvMsvmdSPPVccmSJcSpGBWWWbBHfWWnfttJWnWJpJ";
  "wDzqhjzmqRzDRwqDzNDbWtjWBBBtGbtHpHnnBf";
  "zglRhDqqDZgRNmZQVCdcCPQvvdZv";
  "RpVjRgvFjGBNWtBWFDtt";
  "dcqQwlqMMsCLLfbgQmtD";
  "snlgzsggTzSTSJTr";
  "dLHhDdtlMngFcFsFLFzzsj";
  "vWRGGRVrrWvvGQQJBRsmQzmsqnffqcNfNcfz";
  "vSRVJBVBwTvWTnHphTgDgtMpDl";
  "bvvGnnJbfPmfdgJJSVtwwCpTScVfNpSC";
  "sjsZWDqBqqMRZsDjbWMVwtwNNcNtScRHpRRttp";
  "hzhDqqWDzZzDZzZLQPJPdPnPvlrbGdlnFQ";
  "PwWHTwzFvNHsNzmmMwzNWGQrCqCFjpZbpnGqrqnpbr";
  "gRVRgJRJlDLSJddDccQVrtZnCqjndnrZdnqnqpdq";
  "chhgSSJfQhRRcSSSSBLVfzmzHTNzMNsTNWHMMvMP";
  "lftqSpBSvhlDBDlhBSczQGmcFMcMVVFMmGFWsm";
  "rHLHTNdggsLLnwLHbTTgdrTMPPmMGWZGQQMzQVQFZQGM";
  "gbJnrHHjnbrgLrRrHpBJvSBDDsfJsDtstq";
  "dBTtFLTtVmpdLhMprSRSWMRSMR";
  "QvJvQbjbCgCQRBhzzRsNWNBC";
  "bjgGqQGbQnjGQgnQgbGgjJnDLHLdfPVtdDmLZdBFVVZttdTf"
  ].

Definition test_in :=
  [
  "vJrwpWtwJgWrhcsFMMfFFhFp";
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL";
  "PmmdzqPrVvPwwTWBwg";
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn";
  "ttgJtRGJQctTZtZT";
  "CrZsJsPPZsGzwwsLwLmpwMDw"
  ].

Open Scope char_scope.

Fixpoint in_str (a : ascii) (l : string) :=
  match l with
  | EmptyString => false
  | String y r => if y =? a then true else (in_str a r)
  end.

Inductive InStr : ascii -> string -> Prop :=
  | InStr_found a l : InStr a (String a l)
  | InStr_next a b l : InStr a l -> InStr a (String b l) 
  .

Definition halves (s : string) : (string * string) :=
  (substring 0 (Nat.div (length s) 2) s,substring (Nat.div (length s) 2) (Nat.div (length s + 1) 2) s).

Fixpoint overlap (s1 s2 : string) : option ascii :=
  match s1 with
  | EmptyString => None
  | String c r => if in_str c s2 then Some c else overlap r s2
  end.

Definition score (c : option ascii) : nat :=
  match c with
  | None => 0
  | Some a => nat_of_ascii a - (if Nat.leb 97 (nat_of_ascii a) then 96 else 38)
  end.

Definition value (s : string) : nat :=
  match halves s with
  | (s1,s2) => score (overlap s1 s2)
  end.

Example part1test : list_sum (map value test_in) = 157.
  Proof. simpl. reflexivity. Qed.

Compute (list_sum (map value input)).

Fixpoint overlap3 (s1 s2 s3 : string) : option ascii :=
  match s1 with
  | EmptyString => None
  | String c r => if andb (in_str c s2) (in_str c s3) then Some c else overlap3 r s2 s3
  end.

Fixpoint overlaps (l : list string) : list (option ascii) :=
  match l with
  | a :: b :: c :: r => overlap3 a b c :: overlaps r
  | _ => nil
  end.

Example part2test : list_sum (map score (overlaps test_in)) = 70.
  Proof. simpl. reflexivity. Qed.

Compute (list_sum (map score (overlaps input))).

Lemma each_overlap (s : string) :
  In s input -> value s > 0.
Proof.
  intros. repeat (try destruct H); vm_compute; lia.
Qed.

Fixpoint windows3 {T} (l : list T) : list (T * T * T) :=
  match l with
  | a :: b :: c :: r => (a,b,c) :: windows3 r
  | _ => nil
  end.

Definition each_3_overlap_def (l : list string) :=
  forall x, In x (map (fun x => match x with | (a,b,c) => overlap3 a b c end) (windows3 l)) -> exists k, Some k = x.

Lemma each_3_overlap (s : string) : each_3_overlap_def input.
Proof.
  unfold each_3_overlap_def. intros. repeat (try destruct H);eexists; reflexivity. 
Qed.

