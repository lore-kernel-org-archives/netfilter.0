From: richard lucassen <mailinglists@lucassen.org>
Subject: bug in iptables-restore and "recent" module
Date: Sun, 15 Feb 2015 13:31:47 +0100
Message-ID: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

When using the "recent" module and when the hitcount max (defaults to
20) is violated, "iptables-restore" is testing the file OK, but fails
on loading the filter table:

The file "iptables.save" contains the rule (note: "--hitcount 21"
exceeds the default max of 20):

-A INPUT  -m state --state NEW -p tcp --dport 443 -m recent --update
--name https --seconds 50 --hitcount 21 -j REJECT

The -t option (test file) shows an OK:

# iptables-restore -t < iptables.save
# echo $?
0

But:

# iptables-restore < iptables.save
iptables-restore: line 180 failed

On line 180 there is the "COMMIT" of the filter table.

Distro: Debian testing
# iptables --version
iptables v1.4.21

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
