From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 16:01:19 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101501.g6AF1R812859@vulcan.rissington.net>
References: <001601c22819$406b6a30$0300a8c0@W2KP01> <200207101422.g6AEMi812683@vulcan.rissington.net> <000b01c22821$3c6b1e00$0300a8c0@W2KP01>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000b01c22821$3c6b1e00$0300a8c0@W2KP01>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Wednesday 10 July 2002 3:51 pm, Mark Ayad wrote:

> Nice try but no luck
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j
>
> can't use -i in POSTROUTING

Yup.   Tom just pointed that out to me :-)

> So I tried
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF 192.168.0.0/24 -j MASQUERADE
>
> No luck there although this time the rule is correct.

You should have a "-s" in there before the address ?

Anyway, I realised that your DNAT rule was specifying the input interface=20
(which presumably is your external interface), so it won't do anything for =

packets coming in the other (internal) interface.   You need to change the =

DNAT rule so it specifies the target address instead:

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j=A0DNAT --to =

192.168.0.3

where a.b.c.d is the ext IP of the firewall.

=20

Antony.

