From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Filter in POSTROUTING
Date: Fri, 12 Sep 2003 10:41:21 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309121036010.2544@oskar-lap.agatha>
References: <7C9884991ADAE0479C14F10C858BCDF5122E2E@alderaan.smgtec.com>
 <3F60F89E.7D439592@inka.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F60F89E.7D439592@inka.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claus Regelmann <claus.regelmann@inka.de>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

Hi Claus et al,

It will not work correctly. Only the first packet in a stream passes
through the nat and mangle tables, hence consider this rule:

iptables -t nat -A POSTROUTING -p tcp --tcp-flags SYN,FIN,ACK ACK -j DROP

Stupid example perhaps, but still a valid one. Even more stupid if you
consider that an ACK packet will _never_ be the first packet in a stream
and will hence not do what you expected it to (probably).

Also, there are other considerations when doing work in the nat and mangle
tables. Anyways, this isn't to say that you should _never_ filter in the
nat and mangle table, just that you should think it through very carefully
before you actually do.

//Oskar

On Fri, 12 Sep 2003, Claus Regelmann wrote:

> Hello Daniel,
>
> for me this is not a question of style, but a question of functionallity
> -- will filtering work correctly in the PRE/POST-ROUTING chain.
> Nevertheless thanks for your prompt answer.
>
> Claus
> -------------------------------------------------------------
> Daniel Chemko wrote:
> >
> > It is against style to do anything like that in the NAT table. It is
> > preferable to do it in the filter table, but if you must be lazy about
> > it all, please use the mangle table instead, which does have a valid
> > reason to filter certain traffic at times.
> >
> > The -I is to make sure no matching rules get called before we check that
> > we want these packets at all. If you do the ordering yourself, then just
> > make sure they are all ordered properly.
> >
> > iptables -t mangle -I POSTROUTING -o ppp0 -p tcp --dport 137:139 -j DROP
> > iptables -t mangle -I POSTROUTING -o ppp0 -p udp --dport 137:139 -j DROP
> > iptables -t mangle -I PREROUTING -i ppp0 -p tcp --dport 137:139 -j DROP
> > iptables -t mangle -I PREROUTING -i ppp0 -p udp --dport 137:139 -j DROP
> >
> > -----Original Message-----
> > From: Claus Regelmann [mailto:claus.regelmann@inka.de]
> > Sent: Thursday, September 11, 2003 2:03 PM
> > To: netfilter@lists.netfilter.org; blueflux@koffein.net
> > Subject: Filter in POSTROUTING
> >
> > Hello,
> >
> > There is a figure Oskar Andreassoons IPTABLES TUTORIAL (V1.1.19, chap.
> > 3.1, pg.19)
> > where both, the forwarded and the local output, join the postrouting
> > chain.
> >
> > Why shoudnt it be possible to filter all outgoing e.g. smb traffic from
> > a local
> > network at that place with a command like
> > >iptables -t nat -A POSTROUTING -o ppp0 -p tcp --dport 137:139 -j DROP
> > >iptables -t nat -A POSTROUTING -o ppp0 -p udp --dport 137:139 -j DROP
> > 
> > The same question applies to the PREROUTING chain for input
> > >iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 137:139 -j DROP
> > >iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 137:139 -j DROP
> >
> > Thanks
> > Claus
>
>
>

----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net

