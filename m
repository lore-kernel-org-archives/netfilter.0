From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables, stateful checking using tcp sequence numbers
Date: Fri, 14 Jun 2002 13:15:06 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141310510.17402-100000@blackhole.kfki.hu>
References: <67024BB66045D511A9380000F6B2EF85F20C1F@RBGMSG02>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <67024BB66045D511A9380000F6B2EF85F20C1F@RBGMSG02>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Williamson, Fionn" <FWilliamson@fnb.co.za>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Tue, 7 May 2002, Williamson, Fionn wrote:

> 1. if the sequence numbers are actually used in iptables to MAINTAIN the
> state of a connection, or if it is merely used to ESTABLISH connections,
> and thereafter ignored.

Sequence numbers are checked when the tcp-window-tracking patch is applied
from patch-o-matic. Otherwise sequence numbers are *used* only when the
mangling of those is required (ftp/irc/etc NAT helpers).

> 2. point me towards documentation confirming or denying this.

The documentation states nowhere that sequence number would be used to
check wether the packets belongs to a TCP session.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


