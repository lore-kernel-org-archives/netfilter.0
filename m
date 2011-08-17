From: Johannes Gilger <gilger@umic.rwth-aachen.de>
Subject: nfq_bind_pf(foo, PF_INET6) fails
Date: Wed, 17 Aug 2011 09:32:15 +0200
Message-ID: <20110817073215.GA8741@optiplex>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org
Cc: gilger@umic.rwth-aachen.de

Hi netfilter-list,

I'm trying to adapt a legacy IPv4 NFQUEUE handler to support IPv6 as
well. As far as I understood the documentation I have to do:

nfq_unbind_pf(handle, AF_INET6);
nfq_bind_pf(handle, AF_INET6);

Which returns -1 in both cases. Simply ignoring the return value for
bind_pf is no solution either. I don't know where else to look, as the
program works fine when using AF_INET instead of AF_INET6.

I'm using the 2.6.38-10-generic-tuxonice (Ubuntu 11.04), x86_64. Module=
s
nfnetlink, nfnetlink_queue, ip_queue, ip6_queue are loaded. Any pointer=
s
would be greatly appreciated.

Regards,
Jojo

(Please CC me, I'm not subscribed to the list)

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
