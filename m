From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: DNAT to another Network?
Date: Wed, 7 Jul 2004 14:40:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071440.50694.gdh@acentral.co.uk>
References: <200407071201.i67C12P23199@ps0.linanet.is>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071201.i67C12P23199@ps0.linanet.is>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wednesday 07 July 2004 13:22, Svavar =D6rn Eysteinsson wrote:
> Cool :0)
> Thanks.
>
> Anyone know how I would draw this in fwbuilder?.
> This scenario confuses me. :0(

I've never used fwbuilder, but I suspect that a 'black magic' incantation l=
ike=20
this would be beyond the scope of a GUI firewall tool.

To be honest, I'm not entirely sure how it works, but I understand it enoug=
h=20
to be able to adjust the values to suit the scenario, and that's good enoug=
h=20
for me at the moment.=20

I last used this in a physical server move, so that requests for the old IP=
=20
address would be proxied to the new one. It used a lot of bandwidth, but wa=
s=20
a much better solution than simply having the server 'offline' for some=20
clients for many hours whilst DNS propogated...

Now we use BGP and multiple providers which solves the addressing problem, =
but=20
throws up dozens of new problems :)

Cheers,
Gavin.

