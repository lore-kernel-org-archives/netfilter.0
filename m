From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323-conntrack-nat.patch problem
Date: Tue, 17 Sep 2002 23:47:58 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209172346530.16587-100000@blackhole.kfki.hu>
References: <DGEFLNBBHJDEGJNHJIEMGEELCEAA.ludovic.ducros@isep.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DGEFLNBBHJDEGJNHJIEMGEELCEAA.ludovic.ducros@isep.fr>
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
To: Ludovic Ducros <ludovic.ducros@isep.fr>
Cc: netfilter@lists.netfilter.org

On Tue, 17 Sep 2002, Ludovic Ducros wrote:

> 1 - I untar the linux kernel sources 2.4.18 in /usr/src/linux-2.4.18
> 2 - I did the same with iptables-1.2.7a.
> 3 - In the directory patch-o-matic, I ran './runme extra' to patch with
> h323-conntrack-nat.patch
>     Here is the result :

The h323 patch depends on the corresponding newnat patch. You must apply
first that.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


