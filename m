From: Johannes Gilger <gilger@umic.rwth-aachen.de>
Subject: Re: nfq_bind_pf(foo, PF_INET6) fails
Date: Wed, 17 Aug 2011 15:45:50 +0200
Message-ID: <20110817134550.GA1455@optiplex>
References: <20110817073215.GA8741@optiplex>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110817073215.GA8741@optiplex>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

On 17/08/11 09:32, Johannes Gilger wrote:
> nfq_unbind_pf(handle, AF_INET6);
> nfq_bind_pf(handle, AF_INET6);
>=20
> I'm using the 2.6.38-10-generic-tuxonice (Ubuntu 11.04), x86_64. Modu=
les
> nfnetlink, nfnetlink_queue, ip_queue, ip6_queue are loaded. Any point=
ers
> would be greatly appreciated.

Nevermind, it works now, after I unloaded ip_queue resp. ip6_queue.
Modules now look like this:

nfnetlink_queue
nfnetlink_log
nf_conntrack_netlink
nf_conntrack
nfnetlink
ip6table_filter
ip6_tables
iptable_filter
ip_tables
x_tables
=20
Regards,
Jojo

--=20
Dipl.-Inform. Johannes Gilger
Research Group IT-Security
UMIC Research Centre
RWTH Aachen University
Mies-van-der-Rohe-Stra=C3=9Fe 15
52074 Aachen

Office: 211
Phone: +49 241 80 20781
=46ax:   +49 241 80 22731

http://itsec.rwth-aachen.de
