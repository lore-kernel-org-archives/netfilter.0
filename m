From: marcoz123@comcast.net
Subject: detecting rapid outbound open/close connections
Date: Wed, 27 Feb 2008 16:45:18 +0000
Message-ID: <022720081645.22415.47C5939E000E8E590000578F2213539653CCCDCE96010C9D0E03@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: netfilter@vger.kernel.org

Thanks for your patience. Ive already posted this
to the snort list serv and no response.

I have an issue with some LAN devices, (users), who feel the need to=20
monitor the entire galaxy and draw pretty maps with connecting lines,=20
(war games). Originally this was done with constant ICMP polling so=20
I filtered that at the border. Now the technique being used is to open =
(syn)=20
an outbound connection to a web server, port 80, then close the connect=
ion. As far as I can=20
tell, no data is exchanged, zero length packets?.=20

Personally, I consider this sort of inbound and outbound traffic (ICMP =
polling, NMAP=20
scans etc), as reconnaissance and therefore a threat. I=92m guessing he=
re that=20
others might consider this a threat as well and it=92s somewhat my resp=
onsibility=20
to not allow it out on the Internet if it=92s not necessary to the miss=
ion of this place.=20
The sequence goes as follows:=20
Local SYN sent out=20
SYN, ACK received=20
ACK sent=20
=46IN,ACK sent=20
=46IN, ACK received=20
ACK sent.=20
=46rom open to close, connection the time is something around 100 ms.=20
as measured with wireshark.=20

Question is, can I detect these sort of =93fast=94 open/close connectio=
n that=20
seem not to exchange any data other than open and tear down connection,=
=20
with an iptables/ebtables rule or connection tracking or somthing?=20

Then perhaps fire off an iptables command to block the connection with =
snortsam=20
or something like that?=20

Or:=20

Can this be done with tcpdump and some scripting or something?=20

Any pointers and or advice would be greatly appreciated.=20

Thanks,=20

--marcoz=20
