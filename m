From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MS Messenger
Date: Tue, 12 Nov 2002 21:11:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021112211133.CBFI18329.mta06-svc.ntlworld.com@there>
References: <Pine.LNX.4.33.0211121036290.3900-100000@ts1.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0211121036290.3900-100000@ts1.alberni.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 12 November 2002 6:38 pm, Aaron Clausen wrote:

> I'm running iptables, and have a user claiming that they cannot use MS
> Messenger.  I have no other complaints, but I'm not exactly sure if any
> other users are actually using MS Messenger?  Does there have to be special
> connection tracking.
>
> I'm also blocking the MS file sharing ports at the router.  Would this
> cause the problem?

I don't know about MS Massager specifically, but you could investigate what's 
going on by logging the packets which get dropped from this particular user's 
IP address- that should at least tell you what protocol they're trying to 
use...

Put this at the end of your FORWARD chain, just before the default drop:

iptables -A FORWARD -s a.b.c.d -j LOG --log-prefix="MSM user: "

where a.b.c.d is the IP address of the user who's complaining.

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

