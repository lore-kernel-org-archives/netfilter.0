From: Jan Humme <jan.humme@xs4all.nl>
Subject: Do I need a firewall rule for RST ?
Date: Tue, 9 Jul 2002 18:50:13 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070918501400.02824@Lms>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

In /var/log/messages, I often find packages that have been rejected because 
of the following rules:

$IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
	-j ACCEPT --tcp-flags ACK ACK
$IPTABLES -A FORWARD -m multiport -p tcp -o ppp0 --dports $TCPOUT\
	-j ACCEPT

In short, what I want to achieve is that incoming traffic should always have 
the ACK-bit set.

Packets that are rejected most often are packets that have the RST-flag set:

Jul  9 14:08:58 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=32896 PROTO=TCP SPT=80 DPT=1068 WINDOW=0 
RES=0x00 RST URGP=0
Jul  9 14:08:59 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=33682 PROTO=TCP SPT=80 DPT=1068 WINDOW=0 
RES=0x00 RST URGP=0
Jul  9 14:09:01 jhh kernel: IN=ppp0 OUT=eth0 SRC=145.58.30.9 DST=192.168.0.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=35186 PROTO=TCP SPT=80 DPT=1068 WINDOW=0 
RES=0x00 RST URGP=0

Questions:

1) AFAIK these packets are harmless, correct? Or could some of them be used 
in attacks?

2) (Assuming they are harmless:) is it safe then to add a rule:

$IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
	-j ACCEPT --tcp-flags RST RST
 
3) Is there perhaps a better way to deal with these kinds of packets? 
Perhaps i should better use "state" and forget about the flags?

Jan Humme.

