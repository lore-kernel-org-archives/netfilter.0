From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple source question
Date: Wed, 19 Jun 2002 15:14:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206191414.g5JEEhU30257@vulcan.rissington.net>
References: <000e01c21799$ddca6820$0205a8c0@maxima>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000e01c21799$ddca6820$0205a8c0@maxima>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 19 June 2002 3:01 pm, Benny Butler wrote:

> Ok, lemme explain the setup a bit.
>
> This machine sits between a doctors office's network and the hospital's
> network. Eth1 (192.168.2.2) is static on the doctor's side, and eth0
> (10.46.1.254 I believe) is on the hospital's side.  We've told the local
> router

What do you mean by "local" ?   Which network are you talking about here - 
192.168.... or 10.46..... ?

> that anything trying to get to the hospital should go through the
> linux box, and not use it's default gw.  We've also added a route to the
> linux box so it can get to 10.46.210.5.

What are the default routes on the client and server systems - ie the two 
endpoints which are communicating with each other (192.168.2.70 and 
10.46.210.5) ?   Do they know how to contact each other's networks via the 
Linux machine ?

> That should answer #1 and #3

Okay, I understand the php setup etc, and I don't see any problem with that.  
However, I still don't quite understand what is the answer to my question #1 
- why do you need to do Source NAT at all in order to get these machines 
talking to each other ?   Maybe it's the same as the answer to my new 
questions above....

> #2 sounds great.  I missed that before because I copied a rule off of my
> home firewall which is a dhcp slave to comcast.  Do you think that will
> fix the problem or just make the system run better?

It won't fix the problem (although I don't quite understand why the problem 
exists - if you can get it to work with one machine, why can't it work with 
severalof them?), but it will make the ruleset clearer and will be a bit more 
efficient in operation (because each packet which gets Source NATted simple 
gets a static value substituted, instead of having to look up the address of 
the interface first every time).

Tell us the routing tables on machine 192.168.2.70, the linux box we're 
talking about, and machine 10.46.210.5.   Also show me the extra rule you 
added for another machine in addition to 192.168.2.70 so I can see what 
didn't work.

 

Antony.

