From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a pptp
 VPN server.
Date: Sat, 16 Jun 2007 13:24:44 +0200
Message-ID: <4673C87C.4050609@freemail.hu>
References: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Cc: netfilter@lists.netfilter.org

rajeev.sekhar =EDrta:
> hi list ,
>
> Right now my PPTP VPN server is outside the firewall consuming 2=20
> Static IPaddress,
>
> I want to pleace my PPTP VPN server behind firewall.
>
> i followed good docs on=20
> http://tldp.org/HOWTO/VPN-Masquerade-HOWTO-5.html , but still cant=20
> understand some words in it.
>
> I DNATed 1723, and 500 (which is used for control channels on pptp) to =

> my vpn server behind my firewall.
> The encrypted data channel in PPTP is carried over GRE, IP protocol=20
> 47,  Now how can allow IP protocol 47 from outside , Is this possible? =

> ( pretty new for me)
iptables -p 47 ....
or
iptables -p gre

see /etc/protocols
> They are telling to   ""masquerade ALL protocol traffic"  What they=20
> mean by this?
> I am pasting my firewall rules.
>
>
>
> Is it possible to put vpn server befind firewall?
Maybe... :D
> Is anybody did this before?
I neved did :D


Swifty


