From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Strange Problem - IPTables or Hardware related ????
Date: Fri, 18 Oct 2002 17:01:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210181701.02881.netfilter@newkirk.us>
References: <5.1.1.6.0.20021018113106.00a91488@webmail.persogo.com.br>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.1.6.0.20021018113106.00a91488@webmail.persogo.com.br>
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
To: Rodolfo Siviero Stein <rstein@persogo.com.br>, netfilter@lists.netfilter.org

On Friday 18 October 2002 10:56 am, Rodolfo Siviero Stein wrote:
> Hello Guys,
>
> =09I have a strange problem here that I want to share with you.
>
> =09Here it is:
>
> =09I have three NICS
> =09eth0 -> LAN  HWaddr 00:06:29:2E:EA:1C
> =09eth1 -> DMZ  HWaddr 00:A0:C9:9E:A0:7C
> =09eth2 -> INTERNET   HWaddr 00:50:DA:27:5A:41
>
> =09Kernel 2.4.19
> =09iptables v1.2.7a-20021015
> =09patch-o-matic-20021015 ( with pending patches applied )
>
> =09in the eth2  I have several IPs  assigned thru ifconfig running insi=
de the
> rc.local file.
>
> =09I am receiving packets from the internet, destined to one of the ali=
ases
> of the ETH2 as if they come from the LAN.  See the log tha follows:
>
> Oct 13 08:42:43 firewall kernel: IP_LAN_BLOCKED:IN=3Deth0 OUT=3D
> MAC=3D00:06:29:2e:ea:1c:00:b0:c2:89:9d:a1:08:00 SRC=3D216.81.218.193
> DST=3D200.XXX.XXX.58 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D112 ID=3D238=
8 DF PROTO=3DTCP
> SPT=3D4928 DPT=3D1080 SEQ=3D2076289920 ACK=3D0 WINDOW=3D64240 RES=3D0x0=
0 SYN URGP=3D0 OPT
> (020405B401010402)
> Oct 13 08:46:43 firewall kernel: IPT_LAN_BLOCKED:IN=3Deth0 OUT=3D
> MAC=3D00:06:29:2e:ea:1c:00:b0:c2:89:9d:a1:08:00 SRC=3D210.113.239.50
> DST=3D200.XXX.XXX.51 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D109 ID=3D640=
46 DF PROTO=3DTCP
> SPT=3D2542 DPT=3D80 SEQ=3D3750889304 ACK=3D0 WINDOW=3D16384 RES=3D0x00 =
SYN URGP=3D0 OPT
> (020405B401010402)
>
> =09How a packet from internet appears to me as "IN=3Deth0" ????

What makes you think it's inbound from the internet?  If it says "IN=3Det=
h0"=20
then that is likely where it is coming in, from a machine on the LAN that=
 is=20
(for whatever reason :^) claiming an IP other than what it is supposed to=
=20
have.

> =09In the OUT=3D  we have an MAC address where the initial part is the =
ETH0
> mac.  What is the other numbers ?

Actually, OUT=3D"", undefined, would be more accurate, since the packet i=
s=20
currently INbound (at eth0) from MAC and SRC.  You're catching the packet=
=20
before it reaches a routing decision for OUTPUT.

Very likely the MAC similarity is another NIC in your LAN, from the same=20
source & lot.  I have two that are sequentially numbered.

> =09The machine is a IBM Netfinity 3000  with an etherexpress pro lan on=
board,
> and 2 3com 3x59x boards.  And if I take out the eth0 RJ-45 cable, all t=
he
> others NICs  stop working.
>
> =09I have tried several iptables releases in the branch 1.2.6 thu 1.2.7=
a.
>
> =09Anyone had a problem like this ?  Any comments ?  Is this hardware r=
elated
> or software ?

Try logging a sample of packets containing that MAC address, see if most =
of=20
them are a machine on your LAN.  If it's a single machine inside your=20
network, then find out if it's a fluke. (not likely :^) deliberate on the=
=20
part of the user, or some trojan/bot thingy or an unsecured mail server o=
r=20
something.

j

