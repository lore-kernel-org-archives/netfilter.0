From: Sven Riedel <sr@gimp.org>
Subject: trouble setting up ftp server
Date: Mon, 21 Jul 2003 10:18:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030721081859.GA29576@localnet>
Reply-To: sr@gimp.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I'm having trouble setting up an ftp server, wrt passive mode and the
data channel.

My relevant ruleset looks like this (from iptables -v -L <chain>):
INPUT (Policy: DROP):

70896   72M ACCEPT     all  --  any    any     anywhere anywhere
	 state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  any    any     anywhere anywhere 
	 tcp spts:1024:65535 dpts:1024:65535 state ESTABLISHED 
    3   170 ACCEPT     tcp  --  any    any     anywhere anywhere  
	 tcp dpt:ftp state NEW 
    0     0 ACCEPT     tcp  --  any    any     anywhere anywhere
	 tcp dpt:ftp-data state NEW 

OUTPUT (Policy: DROP):
74312   69M ACCEPT     all  --  any    any     anywhere  anywhere
	 state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  any    any     anywhere  anywhere
	 tcp spts:1024:65535 dpts:1024:65535 state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  any    any     anywhere  anywhere 
	 tcp spt:ftp-data 
    0     0 ACCEPT     tcp  --  any    any     anywhere  anywhere
	 tcp spt:ftp 

The data connections get filtered out in the Input chain, log entries
look like this:

Jul 21 09:52:59 turing kernel: Dropped from input IN=ppp0 OUT= MAC=
   SRC=128.32.112.247 DST=82.82.155.165 LEN=60 TOS=0x00 PREC=0x00 TTL=48 
   ID=59818 DF PROTO=TCP SPT=2577 DPT=34510 WINDOW=32767 RES=0x00 SYN URGP=0  

Linux kernel 2.4.21, ip-conntrack-ftp module is loaded, 
iptables version 1.2.8.

I didn't find anything new or useful in online recepies, nor do I see
anything obviously wrong (to me that is, I do get stricken by selective
blindness from time to time though ;) ). Anyone have any ideas?

Regs,
Sven


-- 
Sven Riedel                      sr@gimp.org
Liebigstr. 38 
30163 Hannover                  "Python is merely Perl for those who
                                 prefer Pascal to C" (anon)

