From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problem with UN-DNAT, source is same machine
Date: Mon, 16 Dec 2002 16:22:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212161622.46685.netfilter@newkirk.us>
References: <3DF2E9D3.6010006@technologist.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF2E9D3.6010006@technologist.com>
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
To: Frank Wallingford <frank.wallingford@technologist.com>, netfilter@lists.netfilter.org

On Sunday 08 December 2002 01:42 am, Frank Wallingford wrote:
> Here's one I can't quite wrap my head around.

> iptables -t nat -A OUTPUT -d 192.168.0.100 --dport 22 \
>    -j DNAT --to 192.168.0.200
>
> Now, I'm only trying to get this one case working:
>
> (from machine 192.168.0.100:) ssh 192.168.0.100
>
> and I'd like it to connect to 192.168.0.200. I'm not sure why it
> isn't.

>  From what I understand, this should be the case:
> (1) The packet starts as
> =09SOURCE: 192.168.0.100:port_a (some random port)
> =09DEST:   192.168.0.100:22
> (2) While traversing the OUTPUT chain in the NAT table, it's changed:
> =09SOURCE: 192.168.0.100:port_a
> =09DEST:   192.168.0.200:22
> (3) The packet is sent out
> (4) Host 192.168.0.200 sees it and sends the reply
> =09SOURCE: 192.168.0.200:22
> =09DEST:   192.168.0.100:port_a
> (5) The packet arrives, and is un-snat'd:
> =09SOURCE: 192.168.0.100:22
> =09DEST:   192.168.0.100:port_a
> (6) The local process sees a reply from the local machine, and accepts
> it.
>
> What's actually happening is that it's getting as far as (4), and the
> reply comes in, but the local process doesn't accept it. I'm guessing
> this is because it wasn't un-snat'd correctly, or I'm doing something
> wrong.

Are you sure you are allowing it through the INPUT chain?  You can=20
confirm whether or not it is reaching that point with two log rules, one=20
as first in PREROUTING, one as first in INPUT.  If it hits both, then it=20
is likely being dropped in INPUT, but is getting unDNATted properly.  If=20
it gets here, check the info on the packet logged at the INPUT chain and=20
make sure that you have a rule to allow it through.

j

