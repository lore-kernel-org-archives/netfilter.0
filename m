From: zito.pol@zipmail.com.br
Subject: =?iso-8859-1?Q?DDoS=20counter=2Dmeasures=20=28Rules=29?=
Date: Sat, 5 Apr 2003 02:12:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8DDDF40000140F@www.zipmail.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hi folks,
I am new in list and I am need help with some extra IPTABLES DDoS/DoS rul=
es.

I am receiving a large volume of packets... in other words... I am been
dosed. 

The IP_FRAG OUTPUT: 
[**] MISC Tiny Fragments [**] 
04/03-03:03:24.131192 < l/l len: 0 l/l type: 0x200 0:0BBBB 
pkt type:0x0 proto: 0x800 len:0x2C 
200.182.128.30 -> 200.164.250.204 ICMP TTL:39 TOS:0x0 ID:67 IpLen:20 DgmL=
en:28
MF 
Frag Offset: 0x0680 Frag Size: 0xFFFFF988 
55 55 55 55 55 55 55 55 UUUUUUUU 

=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D

[**] MISC Tiny Fragments [**] 
04/03-03:03:27.251702 < l/l len: 0 l/l type: 0x200 0:0BBBB 
pkt type:0x0 proto: 0x800 len:0x2C 
200.182.128.30 -> 200.164.250.204 ICMP TTL:39 TOS:0x0 ID:69 IpLen:20 DgmL=
en:28
MF 
Frag Offset: 0x039C Frag Size: 0xFFFFFC6C 
55 55 55 55 55 55 55 55 UUUUUUUU 

=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D

[**] MISC Tiny Fragments [**] 
04/03-03:03:37.406839 < l/l len: 0 l/l type: 0x200 0:0BBBB 
pkt type:0x0 proto: 0x800 len:0x2C 
200.182.128.30 -> 200.164.250.204 ICMP TTL:39 TOS:0x0 ID:75 IpLen:20 DgmL=
en:28
MF 
Frag Offset: 0x0D01 Frag Size: 0xFFFFF307 
55 55 55 55 55 55 55 55 UUUUUUUU 

=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D
---------------------------------------------------------- 

The ICMP_ECHO OUTPUT: 
[**] ICMP Large ICMP Packet [**] 
04/03-03:04:07.018622 < l/l len: 0 l/l type: 0x200 0:0BBBB 
pkt type:0x0 proto: 0x800 len:0x7560 
200.182.128.30 -> 200.164.250.204 ICMP TTL:39 TOS:0x0 ID:89 IpLen:20 DgmL=
en:30032

Type:8 Code:0 ID:131 Seq:0 ECHO 
00 07 2C A6 55 55 55 55 55 55 55 55 55 55 55 55 ..,.UUUUUUUUUUUU 
55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 UUUUUUUUUUUUUUUU... UUUUU=
UUUUUUUUUUUU...
UUUUUUUU... 
VERY LARGE OUTPUT (2.44 MB) 
---------------------------------------------------------- 

Well, I need help with it... need one counter-measure... this box is one
old Pentium 2 with 512KB of band (ADSL), serving access to other 2 machin=
es
(IPTABLES + NAT). 

Any help is wellcome (some extra iptables rules too). 

Best regards... 
Joao Carlos
BOMPRE=C7O SYSTEM ADMINISTRATOR

PS: Sorry to my poor english, I am brazilian and in my country this type
of information is very hard to obtain.




------------------------------------------
Use o melhor sistema de busca da Internet
Radar UOL - http://www.radaruol.com.br




