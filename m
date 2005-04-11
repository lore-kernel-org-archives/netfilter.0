From: Mariusz Kruk <Mariusz.Kruk@epsilon.eu.org>
Subject: Re: iptables crashes server? [OT]
Date: Mon, 11 Apr 2005 11:15:30 +0200
Message-ID: <20050411091530.GA26092@epsilon.rdc.pl>
References: <4250F7E0.3070203@uplink-verein.ch>
	<1403218a05040404475c810345@mail.gmail.com>
	<42523486.7000107@uplink-verein.ch>
	<20050405164544.GA8468@epsilon.rdc.pl>
	<425904E3.2000600@uplink-verein.ch>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425904E3.2000600@uplink-verein.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Apr 10, 2005 at 12:50:11PM +0200, Moritz Gartenmeister wrote:
> i was shutting down all services and also unloaded almost all of iptables 
> modules. i didn't solve the problem.

Ooops. A kernel oops.
It's a 2.6.x series kernel, isn't it?
I had some problems of my own with this line of kernels, so I'd advice
to stay with the 2.4.x line.
I also had oopses when heavily manipulating iptables/packet scheduling
queues. Unfortunately, It was a production machine and I didn't have
time to debug. Just switched to latest 2.4.x and the router runs well
and has several weeks of uptime with no problems.

-- 
[------------------------] Bodies  in  motion tend to remain in motion.
[  Kruk@epsilon.eu.org   ] Bodies at rest tend to remain in bed
[ http://epsilon.eu.org/ ] 
[------------------------] 

