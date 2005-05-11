From: Jeroen Akershoek <jeroena@sara.nl>
Subject: invalid state: no input device?
Date: Wed, 11 May 2005 09:14:03 +0200
Message-ID: <20050511091403.5eeaa15c.jeroena@sara.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I've got quite a strange problem. I'm using the UIF wrapper script to generate my firewall rules and
ever since switching to 2.6 my log is filled with lots, really LOTS of messages about invalid
state packets (UIF logs those by default).

Example:
--------
FW INVALID STATE: IN= OUT=lo SRC=145.xxx.xxx.xxx DST=145.xxx.xxx.xxx LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=19968 DF PROTO=TCP SPT=46228 DPT=636 WINDOW=256 RES=0x00 ACK RST URGP=0 OPT (0101080A94777CD5947034AC)

It's mostly on port 636 (ldaps) to localhost, but I've seen it happen on port 80 as well:
FW INVALID STATE: IN= OUT=eth0 SRC=145.xxx.xxx.xxx DST=194.109.xxx.xxx LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=38898 DF PROTO=TCP SPT=49927 DPT=80 WINDOW=128 RES=0x00 ACK PSH FIN URGP=0 OPT (0101080AB7996BDF00B6B4B8)

relevant iptables config is as follows:
----------------------------------------
Chain OUTPUT (policy DROP)
target     prot opt source               destination
STATEOUTPUT  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain STATEOUTPUT (1 references)
target     prot opt source               destination
STATELESSOUTPUT  all  --  anywhere             anywhere            state INVALID
ACCOUNTINGOUTPUT  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
STATENOTNEW  all  --  anywhere             anywhere            state INVALID,RELATED,ESTABLISHED,UNTRACKED

Chain STATELESSOUTPUT (1 references)
target     prot opt source               destination
ACCOUNTINGSTATELESSOUTPUT  all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere            limit: avg 20/min burst 5 LOG level debug tcp-options ip-options prefix `FW INVALID STATE: '
DROP       all  --  anywhere             anywhere


Any ideas what this might be? I've had it with several versions of 2.6.x and my huge log files are really starting to
annoy me. Otherwise the system seems to be working fine. I've considered just overruling the UIF rules and disabling
logging, but I don't think it should even generate those invalid state packets, right?

Regards,
  Jeroen
-- 
Jeroen Akershoek - BOFH extraordinaire
SARA Computing and Network Services - Visualisation department
tel: +31 20 5923000   fax: +31 20 6683167

A day without sunshine is like, you know, night.

