From: "Catalin(ux aka Dino) BOIE" <util@deuroconsult.ro>
Subject: Re: Compiling sch_tbf.c in user space
Date: Thu, 17 Feb 2005 13:42:54 +0200 (EET)
Message-ID: <Pine.LNX.4.62.0502171341490.25118@webhosting.rdsbv.ro>
References: <20050216154154.90209.qmail@web50403.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20050216154154.90209.qmail@web50403.mail.yahoo.com>
Sender: lartc-admin@mailman.ds9a.nl
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: vinay mathew <vinaymathew80@yahoo.com>
Cc: netfilter@lists.netfilter.org, lartc@mailman.ds9a.nl

> Hi,
Hi!

> I am new to kernel programming.
> My task is to route packets from different hosts
> through one single token bucket filter as we are
> trying to model a wireless scenario with many hosts
> communicating and sharing the same bandwidth.So the

But why do you want to go to userspace for this simulation. Why not in 
kernel. If you want to simulate wireless, take a lokk at netem scheduler.

> idea we came up with was to route packets from
> different hosts to user space using Netfilter and then
> send them through a common tbf implemented in user
> space in order to model a simple bandwidth shaping
> scenario.
> Routing packets to user space has been easy using the
> Netfitler hooks and libipq.
> My problem now is that i need to implement a tbf in
> user space.I was thinking if its possible to modify
> the sch_tbf.c code to make it work in user space so
> that i can compile it as part of my user space program
> that handles the packets sent to user space thro
> netfilter.Ive tried modifying this code a bit but it
> gives me a huge number of errors when i try to compile
> it as a simple C program in user space.
> If this is not possible does any one have a simple
> basic implementation of the token bucket filter that i
> can use in my program to test this scenario or any
> other ideas on how to implement this tbf in user
> space.
> Thanx a million in advance.......and im sorry i didnt
> know exactly where to post the query so thats why i
> posted to both lists.
> thanx and kind regards
> vinay
>
>
>
>
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - You care about security. So do we.
> http://promotions.yahoo.com/new_mail
> _______________________________________________
> LARTC mailing list / LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
>

---
Catalin(ux aka Dino) BOIE
catab at deuroconsult.ro
http://kernel.umbrella.ro/
_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
