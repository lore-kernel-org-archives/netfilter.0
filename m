From: Scott Radvan <scott@radsy.com>
Subject: Re: block kazaa
Date: Wed, 26 Mar 2003 01:27:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030326012710.2c9f4e37.scott@radsy.com>
References: <20030325144636.21700.qmail@web80403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030325144636.21700.qmail@web80403.mail.yahoo.com>
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

On Tue, 25 Mar 2003 14:46:36 +0000 (GMT)
realsite internetcafe <realsiteinternetcafe@yahoo.com> wrote:

> according to many port 1214 is kazaa's port, not until
> i monitored my lan, it changes from time to time! now
> how do i disable kazaa from my network? any other way?
> 
> blocking kazaa is my last resort, but what i want is
> just to limit the workstations' internet bandwidth if
> kazaa is used. ive tried cbq and tc but my kernel
> doesnt seem to support it RTNETLINK: Invalid Argument
> ?? 
> 
> well whats important is i need tips.. any better suggestion?


It is true that in more recent versions of KaZaA and KaZaALite, the incoming port can be modified to work on whatever is asked of it.

I assume by your sender address that you are in control of an Internet cafe.

One thing that's possible is to perform some sort of registry hack to disable the 'options' setting of kazaa. That way you can be sure that Kazaa will only connect at 1214, and can take control of it. Obviously, change them all to port 1214 and other settings that you want as standard, then implement a reg-hack across the clients, so that the port can't be changed. Not my area, but I imagine that's a decent option. Try to beat it at the client-end. Also, consider reverting to older clients that don't give the option of changing ports. Keep in mind you may not be able to log onto the KaZaA network with these older client versions.

However, KaZaA has gotten markedly difficult to firewall, filter and monitor at the server/gateway end, thanks to this port flexibility. If you can't reg-hack the thing, my wild guess would be to examine the TCP transmission techniques to see if anything is done differently in Kazaa than any other app. You _may_ be able to then filter based on this. Throw Ethereal on and see if you can filter Kazaa-like traffic. I could be, and most likely am, glaringly wrong on this one.

I am unaware of any specific netfilter technique to simply block the newer versions of kazaa. Wish I could help you further. Good Luck.




=====
"I don't like spinach, and I'm glad I don't, because if I liked it I'd
eat it, and I just hate it."
		-- Clarence Darrow
=====

