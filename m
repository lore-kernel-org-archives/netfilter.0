From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: chance to impress the suits
Date: Thu, 27 Feb 2003 02:01:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302270201.04762.netfilter@newkirk.us>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
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
To: Jason <baker@cyborgworkshop.com>, Netfilter List <netfilter@lists.netfilter.org>

On Wednesday 26 February 2003 06:57 pm, Jason wrote:
> Hello,  I have been given a task that I think netfilter is ideal for,
> but need a little help.  I need to be able to limit the number of
> connections going through a router running netfilter to a max of 500.
> When I hit 500, I want to reject any new connections. I know that the
> iplimit match does this, but I don't seem to be having any luck
> getting it to work.  Here is the scenario..
>
> ----                ----                ----
> =3DA =3D  -> Port 80 -> +NF+  -> Port 80 -> =3DC =3D
> ----                ----                ----
>
> Simple enough.  NF is my netfilter router, A is source, C is
> destination. C is an application that when it gets overworked, pretty
> much tarpits connecting clients and never lets go.  I have tried many
> permutations of
>
> iptables -A FORWARD -p tcp -i lan -m state --state NEW -m iplimit
> --iplimit-above 1 -j REJECT
>
> with out much luck.  Does anyone have any idea on how to make iplimit
> in a router situation work?  Should I apply this to the output chain?

Definitely the FORWARD chain, OUTPUT is for connections from the=20
firewalling box itself.  Make sure this appears before any ACCEPT rules=20
in your FORWARD chain, too.  Have you tried:

iptables -A FORWARD -i eth0 -p tcp --syn --dport 80 -m iplimit=20
--iplimit-above 500 -j REJECT

This is almost precisely the format of the example rule for iplimit...  I=
=20
noticed you used "-i lan" above - is that a typo?  You have to specify a=20
valid interface name, which my version presumes is eth0 for traffic from=20
the LAN.

When you say "without much luck" what do you mean?  Everything still gets=
=20
through, nothing gets through at all, or what?  Does "iptables -L -v -n"=20
show any matches to this rule?

j


