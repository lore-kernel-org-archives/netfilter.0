From: darcy w.christ <darcy@1000camels.com>
Subject: DNAT and udp
Date: Thu, 23 May 2002 12:58:58 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <60031D7A-6E6E-11D6-A1A0-000502212A00@1000camels.com>
Mime-Version: 1.0 (Apple Message framework v481)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

hi,

   i'm trying to do some DNATing and i'm having some trouble.  The 
particular problem exists only for a udp port.  The port is 3283.  It's 
for apple's remote desktop.   i've got allow DNATs setup for appletalk 
and other protocals over tcp.  They work fine.  But when i try to 
connect to this port, i see the following logged.

May 23 12:41:31 one kernel: IN= OUT=eth0 SRC=192.168.0.4 
DST=64.229.137.72 LEN=66 TOS=0x00 PREC=0x00 TTL=63 ID=6476 PROTO=UDP 
SPT=3283 DPT=3283 LEN=46
May 23 12:41:41 one kernel: IN= OUT=eth0 SRC=192.168.0.4 
DST=192.168.181.3 LEN=33 TOS=0x00 PREC=0x00 TTL=63 ID=6486 PROTO=UDP 
SPT=3283 DPT=3283 LEN=13

My question is is why do i see the 192.168.181.3 address, which is what 
is suppose to be DNATed.  Obviously my machine cannot get to it.  The 
logs for the other tcp ports shows only the first line and the 
connection works.

Anyway, here is the rule i have.

/sbin/iptables -A PREROUTING -t nat -i ppp0 -p udp --dport 3283 -j DNAT 
--to 192.168.181.3:3283

i appreciate any thoughts that anyone has.

~darcy w. christ
1000camels in a courtyard


