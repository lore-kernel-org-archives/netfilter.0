From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 07:38:14 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <273150000.1026311894@wookie.shorewall.net>
References: <001601c22819$406b6a30$0300a8c0@W2KP01>
 <200207101422.g6AEMi812683@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207101422.g6AEMi812683@vulcan.rissington.net>
Content-Disposition: inline
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>



--On Wednesday, July 10, 2002 15:22:33 +0100 Antony Stone 
<Antony@Soft-Solutions.co.uk> wrote:

>
> This one looks a bit odd to me, even though I've written it myself, but I
> think it should do the trick:
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j MASQUERADE

"-i" can't be used in the POSTROUTING hook. Example:

[root@gateway root]# iptables -t nat -A POSTROUTING -i eth3 -o eth4 -j 
MASQUERADE
iptables v1.2.6a: Can't use -i with POSTROUTING

Try `iptables -h' or 'iptables --help' for more information.
[root@gateway root]#


>
> If it doesn't, then just use the standard version:
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j MASQUERADE
>
> where a.b.c.d/n is your internal network range.

That's better -- since the internal interface usually has a static address, 
the following is preferable:

$IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j SNAT --to-source 
$INTIP

-Tom
--
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


