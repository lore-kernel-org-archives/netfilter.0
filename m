From: "Jim Gifford" <maillist@jg555.com>
Subject: Re: Block/Accept by MAC Address
Date: Tue, 1 Oct 2002 17:48:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c2699c$9eb9b320$cd06ea43@W2RZ8L4S02>
References: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02> <20021001083118.SDVF28874.mta06-svc.ntlworld.com@there>
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
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

This guy is moving around from IP's and different addresses. The main thing
I noticed is that I have numerous connections with keep-alives on my Apache
and Proftp server. Here is an example of what I have been noticing.
67.234.6.201,1032     64.30.195.78,21       tcp     ESTABLISHED  119:59:59
67.234.6.201,1121     64.30.195.78,21      tcp     ESTABLISHED  119:55:55
67.234,6,201,1692    64.4.13.144,1863      tcp     ESTABLISHED  119:50:52
67,234,6,201,1695    64.4.13.144,1863      tcp     ESTABLISHED  119:49:12

I usually have about 10 or 15 of these from his IP range. I just figured
blocking his MAC would be a option, since they are unique.


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, October 01, 2002 3:31 AM
Subject: Re: Block/Accept by MAC Address


> On Tuesday 01 October 2002 2:33 am, Jim Gifford wrote:
>
> > I have a guy who keeps hacking my machine and his IP
> > address is always changing and so does his hostname.
>
> How is he hacking your machine ?   What is accessible on your system for
him
> to have a go at ?
>
> A firewall is not the answer to every problem.
>
> Antony.
>
> --
>
> There are only 10 types of people in the world:
> those who understand binary notation,
> and those who don't.
>
>


