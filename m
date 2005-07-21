From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: help for iptables
Date: Thu, 21 Jul 2005 07:47:15 -0400
Message-ID: <1121946435.2645.10.camel@localhost>
References: <A85D74936A4B4CE196FE8F9CD719976A@mitpl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A85D74936A4B4CE196FE8F9CD719976A@mitpl.com>
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
To: SWAPNIL <postmaster@modular-infotech.com>
Cc: ilugd@lists.linux-delhi.org, netfilter@lists.netfilter.org

On Wed, 2005-07-20 at 11:52 +0530, SWAPNIL wrote:
> Dear All,
> 
> Please find the link of my network for your reference.
> 
> http://downloadftp.modular-infotech.com/common/share/network.gif
> 
> My client1 PC and client 2 PC will be connected to the internet using proxy
> and only client 2 pc  will be connected to one remote sever or domain or ip
> using iptables.
> 
> >From remote location anyone can connect my local web sever through my global
> DNS server
> eg. someone must first connected to my global DNS server for resolving host
> name then he will get routed to my local router and router will connect that
> remote user to my local webserver on any proto and any port.
> 
> Also I would like to track each connection session with my websever.
> 
> what should I do in such scenario ?
> 
> please help me otherwise my job will be in trouble.
> 
> Basically I am new in Linux I had tried lot of on iptables rules, but I cant
> achieve final target.
<snip>
I'm a little unsure of what you are trying to accomplish.  What do you
mean by "someone must first connect to my global DNS server or resolving
host name then he will get routed to my local router"? Perhaps I don't
understand but that seems strange.

Do you really want to publicly expose any protocol and any port on a
server to the world? That sounds awfully dangerous.

What do you mean my track each connection session with your webserver.
Will simple logging of the connection event be sufficient or do you need
details web server logs?

I'm afraid I will be offline for a couple of days so, if someone else
could jump in to help, that would be much appreciated - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


