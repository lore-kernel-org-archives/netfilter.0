From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: cvs password
Date: Wed, 6 Jul 2005 14:27:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0507061426440.29049@mercury.sdinet.de>
References: <001401c581d0$ea21ee00$0a00a8c0@rowehost.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001401c581d0$ea21ee00$0a00a8c0@rowehost.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andy Rowe <andy@roweboat.net>
Cc: netfilter@lists.netfilter.org

On Tue, 5 Jul 2005, Andy Rowe wrote:

> i can not get the cvs password " cvs " listed at 
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.html
>
> when i run the commands below wich are listed at the website address above i 
> get a connection refused. Am i doing something wrong?
>
> cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
> cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co netfilter/userspace 
> netfilter/patch-o-matic

The docs are outdated.
CVS has been replaced by subversion, the pserver has been shut down.

Current docs:
http://www.netfilter.org/downloads.html#svn

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

