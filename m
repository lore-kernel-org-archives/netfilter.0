From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: is there a way to discriminate the ESTABLISHED traffic?
Date: Mon, 4 Apr 2005 15:10:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504041507400.13084@blackhole.kfki.hu>
References: <4250ABAC.5010207@lorenzutti.com.ar>
	<1112602678.5125.4.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112602678.5125.4.camel@jasiiitosh.nexusmgmt.com>
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

On Mon, 4 Apr 2005, John A. Sullivan III wrote:

> other device.  I believe that once the traffic flow is being managed by
> connection tracking, the packets never traverse the filter table.  Thus,
> you cannot them there.

s/filter/nat/, but there is no NAT involved in the question.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

