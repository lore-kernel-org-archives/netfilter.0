From: Stindl Wolfgang EXT <Wolfgang.Stindl.extern@icn.siemens.de>
Subject: Ip_conntrack_rpc_tcp
Date: Tue, 23 Mar 2004 15:44:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <47D438A0510BD611B9470002A58EDAE704DE6545@mchh2a6e.mchh.siemens.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C410E5.527F1292"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C410E5.527F1292
Content-Type: text/plain

Hi,

I have some trouble with ip_conntrack_rpc_tcp.
It seems, that it doesn't find the right rpc-packets when making an nfs mount.

Do you have any ideas what I'm doing wrong?

Thanks a lot
Wolfi

Here are the rules
iptables -F
iptables -F PREROUTING -t nat

iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -p tcp --dport 111 -j LOG
iptables -A OUTPUT -p tcp --sport 111 -j LOG
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 111 -m rpc -m state --state NEW -j ACCEPT
iptables -A INPUT -p UDP --dport 111 -m rpc -m state --state NEW -j ACCEPT

iptables -A INPUT -j LOG
iptables -A OUTPUT -j LOG



Here is some debugging output


Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=21635 DF PROTO=TCP SPT=716 DPT=111 WINDOW=5840 RES=0x00 SYN URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN= OUT=eth0 SRC=10.8.15.10 DST=10.8.15.12 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=111 DPT=716 
WINDOW=5792 RES=0x00 ACK SYN URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21636 DF PROTO=TCP SPT=716 DPT=111 WINDOW=5840 RES=0x00 ACK URGP=0

This is the RPC Call

Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet is from the initiator. [cont]
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: TCP header length is; tcplen=76 ..   (I added this to debugging-output
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: tcph id; tcph->doff=8 ..   (I added this to debugging-output
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet length is not correct. [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=96 TOS=0x00 PREC=0x00 TTL=64 ID=21637 DF PROTO=TCP SPT=716 DPT=111 WINDOW=5840 RES=0x00 ACK PSH URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN= OUT=eth0 SRC=10.8.15.10 DST=10.8.15.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=14112 DF PROTO=TCP SPT=111 DPT=716 WINDOW=5792 RES=0x00 ACK URGP=0


This should be the RPC-REPLY
As you can see: tcplen-(tcph->doff*4) != 32
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet is from the receiver. [cont]
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: TCP header length is; tcplen=432 .. (I added this to debugging-output)
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: tcph id; tcph->doff=8 .. (I added this to debugging-output)
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet length is not correct. [skip]
Mar 23 15:48:54 DEVil kernel: IN= OUT=eth0 SRC=10.8.15.10 DST=10.8.15.12 LEN=452 TOS=0x00 PREC=0x00 TTL=64 ID=14113 DF PROTO=TCP SPT=111 DPT=716 
WINDOW=5792 RES=0x00 ACK PSH URGP=0


Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21638 DF PROTO=TCP SPT=716 DPT=111 WINDOW=6432 RES=0x00 ACK URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet is from the receiver. [cont]
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: TCP header length is; tcplen=68 ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: tcph id; tcph->doff=8 ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet length is not correct. [skip]
Mar 23 15:48:54 DEVil kernel: IN= OUT=eth0 SRC=10.8.15.10 DST=10.8.15.12 LEN=88 TOS=0x00 PREC=0x00 TTL=64 ID=14114 DF PROTO=TCP SPT=111 DPT=716 
WINDOW=5792 RES=0x00 ACK PSH URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21639 DF PROTO=TCP SPT=716 DPT=111 WINDOW=6432 RES=0x00 ACK URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21640 DF PROTO=TCP SPT=716 DPT=111 WINDOW=6432 RES=0x00 ACK FIN URGP=0
Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=108 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=717 DPT=32771 LEN=88
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]
Mar 23 15:48:54 DEVil kernel: IN= OUT=eth0 SRC=10.8.15.10 DST=10.8.15.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=14115 DF PROTO=TCP SPT=111 DPT=716 
WINDOW=5792 RES=0x00 ACK FIN URGP=0
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: new packet to evaluate ..
Mar 23 15:48:54 DEVil kernel: ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). [skip]

This is the NFS mount which will be dropped.

Mar 23 15:48:54 DEVil kernel: IN=eth0 OUT= MAC=00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 SRC=10.8.15.12 DST=10.8.15.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21641 DF PROTO=TCP SPT=716 DPT=111 WINDOW=6432 RES=0x00 ACK URGP=0




------_=_NextPart_001_01C410E5.527F1292
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2657.73">
<TITLE>Ip_conntrack_rpc_tcp</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have some trouble with =
ip_conntrack_rpc_tcp.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">It seems, that it doesn't find the =
right rpc-packets when making an nfs mount.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Do you have any ideas what I'm doing =
wrong?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks a lot</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Wolfi</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Here are the rules</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -F</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -F PREROUTING -t =
nat</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">iptables -P INPUT DROP</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -P OUTPUT DROP</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A INPUT -p tcp --dport =
111 -j LOG</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A OUTPUT -p tcp =
--sport 111 -j LOG</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A INPUT -m state =
--state RELATED,ESTABLISHED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A OUTPUT -m state =
--state RELATED,ESTABLISHED -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A INPUT -p tcp --dport =
111 -m rpc -m state --state NEW -j ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A INPUT -p UDP =
--dport 111 -m rpc -m state --state NEW -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A INPUT -j LOG</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">iptables -A OUTPUT -j =
LOG</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Here is some debugging output</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D60 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21635 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D5840 =
RES=3D0x00 SYN URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3D OUT=3Deth0 SRC=3D10.8.15.10 DST=3D10.8.15.12 LEN=3D60 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DTCP SPT=3D111 DPT=3D716 =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">WINDOW=3D5792 RES=3D0x00 ACK SYN =
URGP=3D0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21636 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D5840 =
RES=3D0x00 ACK URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">This is the RPC Call</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet is from the initiator. [cont]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: TCP header length is; tcplen=3D76 ..&nbsp;&nbsp; =
(I added this to debugging-output</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: tcph id; tcph-&gt;doff=3D8 ..&nbsp;&nbsp; (I =
added this to debugging-output</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet length is not correct. [skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D96 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21637 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D5840 =
RES=3D0x00 ACK PSH URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3D OUT=3Deth0 SRC=3D10.8.15.10 DST=3D10.8.15.12 LEN=3D52 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D14112 DF PROTO=3DTCP SPT=3D111 DPT=3D716 =
WINDOW=3D5792 RES=3D0x00 ACK URGP=3D0</FONT></P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Courier New">This should be the =
RPC-REPLY</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">As you can see: =
tcplen-(tcph-&gt;doff*4) !=3D 32</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet is from the receiver. [cont]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: TCP header length is; tcplen=3D432 .. (I added =
this to debugging-output)</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: tcph id; tcph-&gt;doff=3D8 .. (I added this to =
debugging-output)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet length is not correct. [skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3D OUT=3Deth0 SRC=3D10.8.15.10 DST=3D10.8.15.12 LEN=3D452 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D14113 DF PROTO=3DTCP SPT=3D111 DPT=3D716 =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">WINDOW=3D5792 RES=3D0x00 ACK PSH =
URGP=3D0</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21638 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D6432 =
RES=3D0x00 ACK URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet is from the receiver. [cont]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: TCP header length is; tcplen=3D68 ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: tcph id; tcph-&gt;doff=3D8 ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet length is not correct. [skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3D OUT=3Deth0 SRC=3D10.8.15.10 DST=3D10.8.15.12 LEN=3D88 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D14114 DF PROTO=3DTCP SPT=3D111 DPT=3D716 =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">WINDOW=3D5792 RES=3D0x00 ACK PSH =
URGP=3D0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21639 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D6432 =
RES=3D0x00 ACK URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21640 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D6432 =
RES=3D0x00 ACK FIN URGP=3D0</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D108 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D717 DPT=3D32771 =
LEN=3D88</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3D OUT=3Deth0 SRC=3D10.8.15.10 DST=3D10.8.15.12 LEN=3D52 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D14115 DF PROTO=3DTCP SPT=3D111 DPT=3D716 =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">WINDOW=3D5792 RES=3D0x00 ACK FIN =
URGP=3D0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: new packet to evaluate ..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
ip_conntrack_rpc_tcp: packet has no data (may still be handshaking). =
[skip]</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">This is the NFS mount which will =
be dropped.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mar 23 15:48:54 DEVil kernel: =
IN=3Deth0 OUT=3D MAC=3D00:30:05:3f:ca:c3:00:e0:00:5e:13:ad:08:00 =
SRC=3D10.8.15.12 DST=3D10.8.15.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID=3D21641 DF PROTO=3DTCP SPT=3D716 DPT=3D111 WINDOW=3D6432 =
RES=3D0x00 ACK URGP=3D0</FONT></P>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C410E5.527F1292--

