From: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Subject: Change iptables log format
Date: Thu, 2 Oct 2003 16:40:05 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Is it possible to change the log format of iptables?

ala: 

from

Oct  2 16:39:44 charlie kernel: LOGPREFIX IN=eth0 OUT=eth1 
SRC=172.17.5.184 DST=80.60.235.54 LEN=48 TOS=0x00 PREC=0x00 TTL=123 
ID=52255 DF PROTO=TCP SPT=3240 DPT=1214 WINDOW=44032 RES=0x00 SYN URGP=0

to

Oct  2 16:39:44 charlie kernel: NEW:bred-kirstine:IN=eth0 OUT=eth1 
SRC=172.17.5.184 DST=80.60.235.54 PROTO=TCP SPT=3240 DPT=1214


--
Lasse B. Jensen

