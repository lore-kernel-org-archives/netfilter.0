From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: Dropping network "noise"
Date: Sun, 13 Feb 2005 16:30:01 +0300
Message-ID: <200502131630.01401.e-boogie@yandex.ru>
References: <200502130928.41225.e-boogie@yandex.ru>
	<1108296226.10876.16.camel@nostromo.bgsecm.com>
	<420F5186.5060703@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <420F5186.5060703@hotpop.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Sunday 13 February 2005 16:09, Georgi Alexandrov wrote:
> Jose Maria Lopez Hernandez wrote:
> >El dom, 13-02-2005 a las 09:28 +0300, Mikhail Zotov escribi=C3=B3:
> >>I have a Linux machine (with a static routable IP address)
> >>connected to a windoops LAN.  As is known, there is certain
> >>"noise" in windoops networks, which can be silently dropped
> >>by a rule like this:
> >>
> >>iptables -A INPUT -p udp --dport 135:139 -j DROP
> >>
> >
> >That's OK, but also DROP port 445 because there's also a great
> >amount of traffic in that port.
> >
> How exactly is that OK ?=20
> The only point in a rule like that maybe is - if you are logging not=20
> matched packets at the end of the filter table/INPUT chain and don't=20
> want your logs flooded by that broadcast traffic.

Yes, I just want to drop them silently without logging.
Otherwise get hundreds of "noisy" records every day.

Regards,
Mikhail

