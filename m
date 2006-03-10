From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Fri, 10 Mar 2006 14:33:10 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603101421580.6303@blackhole.kfki.hu>
References: <s410b957.066@gwia201.syr.edu> <44112723.30505@netboxblue.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44112723.30505@netboxblue.com>
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

On Fri, 10 Mar 2006, Menno Smits wrote:

> On a side note, I agree that IPset is fabulous and should be part of
> mainline netfilter. It can greatly simplify otherwise complex firewall
> configurations.

Thanks ;-). Currently we are working on rewriting some part of ipset
(kernel-userspace communication are converted to netlink) and improving
the hash types for the next release.

The 'binding' as a hard to grasp and not effective enough feature will go,
instead of that there will be some new set types. I wonder wether anyone
uses binding at all...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

