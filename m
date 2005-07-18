From: Nikolai Alexandrov <voyager123bg@gmail.com>
Subject: Re: how to upgrade an installed iptables?
Date: Mon, 18 Jul 2005 12:36:43 +0300
Message-ID: <42DB782B.4090802@gmail.com>
References: <3115d56e0507172241b07d0bf@mail.gmail.com>
Reply-To: voyager123bg@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0507172241b07d0bf@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: afshin lamei <afshinlamei@gmail.com>
Cc: netfilter@lists.netfilter.org


afshin lamei wrote:

>hi all,
>2 questions:
>is there any patched source of iptables (with p-o-m), which i can just
>compile and use?
>  
>
Nope. p-o-m is a separate patchset, which in order to use you must have 
sources of both kernel and iptables. It then do its magic (patching the 
source :)), and you then need to recompile kernel modules/iptables.

>how can i upgrade from iptables 1.2.8 to 1.2.9, 1.3, ... etc? there is
>a patch named patch-iptables-1.2.8-1.2.9, can i apply it on an
>installed 1.2.8 one?
>regards
>afshin
>
>
>  
>
Gee, I've no idea. I always get the newest (stable) source, build a 
package from it, and install... :) works pretty well. Basically... yes. 
Patches are usually containing some bugfixes/new features, so this may 
be the case... :) yet I dunno if you could dl patch 1.3.2 (for example) 
and apply it over the 1.2.8 source, resulting the 1.3.2... I think in 
order to get this source updated, you have to apply them one by one, 
till you get where you want to... (again, this might not be the case. I 
never did it that way).

