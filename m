From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 16:15:20 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507211614340.20941@yvahk01.tjqt.qr>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<65aa6af905072107063ebab0bc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905072107063ebab0bc@mail.gmail.com>
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


>It's not like I'm freaky and I just want to load balance two of them
>leaving one out. I COUDLN'T get to load balance all three. After some
>experimentation I noticed that two of the interfaces didn't get along
>very well to make a multipath routing. I think it's because they're
>both on the same network. Maybe you know of some multipath guru that
>could help me with this so I can load-balance all of them.

Load balancing using route path cost and tc is done on a per-device basis;



Jan Engelhardt
-- 

