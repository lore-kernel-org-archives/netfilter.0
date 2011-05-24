From: Jesper Dangaard Brouer <hawk@comx.dk>
Subject: [ANNOUNCE] IPTV-Analyzer project released v0.9.1
Date: Tue, 24 May 2011 16:40:05 -0400
Message-ID: <1306269605.11061.10.camel@probook>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hawk@comx.dk

The new release 0.9.1 of the IPTV-Analyzer project is comming to you
directly from New York City RedHat office ;-)

New features include bytes and packet counters, no-signal detection,
heartbeat system per stream, and new event types.

 Homepage:
  http://www.iptv-analyzer.org

 Git tree:
  https://github.com/netoptimizer/IPTV-Analyzer

Notice, database changes in this release.  Its possible to upgrade
the database schema without loosing your current data.

The IPTV-Analyzer is a continuous/real-time tool for analyzing the
contents of MPEG2 Transport Stream (TS) packets, which is commonly
used for IPTV multicast signals. The main purpose is continuous
quality measurement, with a focus on detecting MPEG2 TS/CC packet
drops.

 Bugreports and feature requests please use:
  https://github.com/netoptimizer/IPTV-Analyzer/issues

(Disclaimer, RedHat is not directly associated with project, I just
hangout with them during my visit to NYC).

-- 
Best regards,
  Jesper Dangaard Brouer
  ComX Networks A/S
  Linux Network Kernel Developer
  Cand. Scient Datalog / MSc.CS
  Author of http://adsl-optimizer.dk
  LinkedIn: http://www.linkedin.com/in/brouer

