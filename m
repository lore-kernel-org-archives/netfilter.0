From: Jesper Dangaard Brouer <hawk@comx.dk>
Subject: [ANNOUNCE] IPTV-Analyzer project released v0.9.2
Date: Thu, 02 Jun 2011 14:37:14 -0400
Message-ID: <1307039834.2703.178.camel__14600.5394672558$1307039895$gmane$org@probook>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hawk <hawk@comx.dk>

The new release 0.9.2 of the IPTV-Analyzer project is coming to you
from Montreal, Canada.

 The new feature is SNMP traps, for no_signal detection.

The collector sends SNMP "no_signal" traps, when the state
transition from, signal to no-signal, and back from no-signal to
signal.  The SNMP traps are described via an compliant MIB.

 Homepage:
  http://www.iptv-analyzer.org

 Git tree:
  https://github.com/netoptimizer/IPTV-Analyzer

The IPTV-Analyzer is a continuous/real-time tool for analyzing the
contents of MPEG2 Transport Stream (TS) packets, which is commonly
used for IPTV multicast signals. The main purpose is continuous
quality measurement, with a focus on detecting MPEG2 TS/CC packet
drops.

 Bugreports and feature requests please use:
  https://github.com/netoptimizer/IPTV-Analyzer/issues

-- 
Best regards,
  Jesper Dangaard Brouer
  ComX Networks A/S
  Linux Network Kernel Developer
  Cand. Scient Datalog / MSc.CS
  Author of http://adsl-optimizer.dk
  LinkedIn: http://www.linkedin.com/in/brouer

