From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fw: Yahoo Messenger
Date: Sun, 6 Oct 2002 18:43:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210061743.g96HhwL13290@vulcan.rissington.net>
References: <001701c26d5e$28e75d80$7cfcc5cb@humanpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c26d5e$28e75d80$7cfcc5cb@humanpc>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 06 October 2002 6:31 pm, HareRam wrote:

> anyn help will be appriciated
>
> thanks
> hare
> ----- Original Message -----
> From: "HareRam" <hareram@sol.net.in>
> To: "Antony Stone" <Antony@Soft-Solutions.co.uk>; "Netfilter"
> <netfilter@lists.netfilter.org>
> Sent: Sunday, October 06, 2002 4:55 PM
> Subject: Re: Yahoo Messenger
>
> > Hi all
> >
> > i have developped some front end to user to login and log out
> > using Visual c++ and i want to count how many minutes he is online
> > and how many minutes he has reamaining.
> > all the things are working fine....
> >
> > all users have static IP and ARP table is binded to specific user PC MAC
> > when the user looged in, iam replacing the  FORWARD rules with  ACCEPT
> > when he logged out iam replacing the same FORWARD Rules wiht DROP
> >
> > the problems after this is.
> >
> > 1. after Dropping the Forward Rules, still he able to browse the existing
> > site which he is browsing
> >     but he is not getting any new sites, so i feel he is able to get the
> > existing connection data.

This is because there is an entry in the connection tracking table, and as 
slong as that is there the connection will be allowed by your ESTABLISHED 
rule - you would have to put the DROP rules in front of that in your FORWARD 
chain to cut off any current connections.

> > 2. when he connect to Yahoo Messenger, he is not disconnecting, his
> > connection is continueing

I have no idea how Yahoo Messenger works.   I am not the person to answer 
this question.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

