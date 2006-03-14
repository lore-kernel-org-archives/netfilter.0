From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Tue, 14 Mar 2006 10:22:34 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603141017050.11147@blackhole.kfki.hu>
References: <4410F444.3090407@netboxblue.com>
	<Pine.LNX.4.58.0603100910240.6303@blackhole.kfki.hu>
	<4414A4EE.8040207@netboxblue.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4414A4EE.8040207@netboxblue.com>
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
To: Menno Smits <menno@netboxblue.com>
Cc: Netfilter Mailing list <netfilter@lists.netfilter.org>

Hi,

On Mon, 13 Mar 2006, Menno Smits wrote:

> How would you feel about a "union" set type? Union sets would be
> configured to refer to 1 or more other sets. If the IP is found in any
> of the child sets it returns a match.

Technically it is not difficult to add an union type. But first we'd like
to complete the transition from sockopt to netlink based kernel-userspace
communication (it involves the internal API of the settypes as well).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

