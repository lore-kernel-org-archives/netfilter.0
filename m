From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Stateless NAT
Date: Thu, 24 Feb 2005 17:43:12 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0502241738490.5273@blackhole.kfki.hu>
References: <1109243487.9286.4.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
In-Reply-To: <1109243487.9286.4.camel@jasiiitosh.nexusmgmt.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Thu, 24 Feb 2005, John A. Sullivan III wrote:

> Thanks to some help from Philip Craig of SnapGear, I'm still alive on
> this issue of UDP broadcast helping using iptables.  The next problem is
> creating the stateless NAT that I need.  My first choice would be to do
> this with iproute2 but it appears to be broken in the 2.6 kernel.
>
> I next tried doing this by using the raw table and NOTRACK target for
> udp broadcasts on the needed port and then DNAT on the same packets to
> the unicast address.  However, apparently NOTRACK disables NAT so that
> didn't work.  When using conntrack for most packets, how does one
> disable conntrack for certain NAT packets only? In other words, how does
> one do selective, stateless NAT in iptables? Thanks - John

You cannot do NAT without conntrack, because NAT in netfilter is built on
the top of conntrack. By the NOTRACK target you disable conntrack for
the selected packets thus disable NAT as well.

Currently there is no way to define stateless NAT in netfilter. That is
the bad news. The good one is that however one could write a stateless NAT
target module, nothing prevents that.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

