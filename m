From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: port forwarding
Date: Sat, 07 Dec 2002 13:11:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF1E55A.7000102@karlsbakk.net>
References: <285598680.20021205235627@rtsnet.ru> <1585.192.168.7.41.1039245381.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Smith <nfml@k1k2.com>
Cc: netfilter@lists.netfilter.org

Andrew Smith wrote:

>If they want to play on an external server then there is
>nothing required other than standard masquerading/nat
>
>HOWEVER, if you resrtict outgoing (and return) ports then
>you need to allow UDP on port 21705
>(I'm not sure if TCP is used at all?)
>
>WARNING
>if 3 or 4 people do a standard full server update at the
>same time it will fill your conntrack table and you will
>start dropping other connections for a while
>
>Counterstrike is beyond the tiny limitation of a 64K conntrack
>table and since you cannot specifically say to timeout the
>counterstrike server update connections quickly (due to the
>fact that you will never need to do this - yeah I know that's
>wrong but ... that's what the netfilter developers say)
>you end up filling the conntrack table
>
>You need to be able to set it to handle about 20,000 connections
>per user that is using Counterstrike but I think it is limited
>to only 64K - but I'm not 100% certain.
>
>  
>
Then what sort of idiot was there that wrote the counterstrike protocol?
I mean - 20.000 connections per user???? It's crazy! How about a good 
old TCP connection instead?



