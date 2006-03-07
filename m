From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: NATing
Date: Tue, 7 Mar 2006 15:01:36 +0100 (CET)
Message-ID: <54857.193.173.147.3.1141740096.squirrel@webmail.sterenborg.info>
References: <2C3CB727B662D511889200508B4481F603D6A0BC@PERAGO_SERVER01>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2C3CB727B662D511889200508B4481F603D6A0BC@PERAGO_SERVER01>
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

On Tue, March 7, 2006 14:48, Carlo Henrico wrote:
> Hi All
>
> I am new to all this but here goes.
>
> I have read the docs on NAT'ing etc but am still lost.
>
> I have a linux box with 2 NIC's, one on the public network and one on t=
he
> LAN.
>
> The public side has a public IP address but we also have 4 more IP addr=
esses
> routed by the ISP down that line.
>
> I would like to "reroute" the traffic from one of those IP addresses to=
 a
> web server (port 80) on the LAN.
>
> What I have tried is :
>
> Iptables -t nat PREROUTING -I 1.2.3.4 -j DNAT --to 5.6.7.8

This rule can't possibly work and would generate an error when executing =
it. I
suspect it's a typo ?

> Where 1.2.3.4 is the public IP address and 5.6.7.8 is the LAN address o=
f the
> web server.
>
> Please help, what am I doing wrong?

man iptables.
-I means "insert rule" and should be used before "PREROUTING". You should=
 use
"-d <destination IP>" instead.

$ipt -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 \
  -j DNAT --to 5.6.7.8

Assuming your FORWARD policy is ACCEPT ($ipt -P FORWARD ACCEPT) and have =
IP
forwarding enabled (echo 1 > /proc/sys/net/ipv4/ip_forward).


Gr,
Rob



