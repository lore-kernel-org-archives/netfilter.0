From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 11 Aug 2005 07:57:27 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110756110.28320@yvahk01.tjqt.qr>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<42DFA8D1.207@mnemon.de>
	<Pine.LNX.4.58.0507211557070.27131@blackhole.kfki.hu>
	<65aa6af905072107096e1d6d06@mail.gmail.com>
	<65aa6af9050810083761c164a8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050810083761c164a8@mail.gmail.com>
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
To: Edmundo Carmona <eantoranz@gmail.com>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>


>Sorry to reply on an old thread.. but I think it's a good point to
>start my next questions. Does the same policy stand on FORWARD? There
>will be another routing decision if source address, destination
>address, nfmark field or tos of the skbuff changed???

No, that's too late. You can only change the src/dst addresses in the nat 
table, which comes before the routing decision. If you write a module for 
-t mangle which then pokes on the addr, you're probably too late, i.e. no 
routing.

You might however, force a rerouting decision when using the -j ROUTE target.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

