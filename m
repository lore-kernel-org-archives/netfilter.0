From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Route packets by source IP
Date: Wed, 19 Mar 2008 19:02:23 -0500
Message-ID: <47E1A98F.7070603@riverviewtech.net>
References: <47DFCF36.3060500@riverviewtech.net> <43cba8b55bae94158c0580f06e368ea4@localhost> <47E1836C.7050707@riverviewtech.net> <558A5399260B4A88B7FB73AD35D2244B@shs1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <558A5399260B4A88B7FB73AD35D2244B@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 3/19/2008 5:03 PM, Steffen Heil wrote:
> Even more: In my scenario the same client should be able to reach the 
> service using the public ip of both servers.  Therefor routing based 
> on the destination (=client) ip is not possible at all.  However if 
> the target ip was the A1 then reply as usual (use default route) and 
> if the target ip was A2 (only possible because it was forwarded from 
> B1) then route the packet to B2, where B will route the packets as 
> usual (using default route).

Ok, going back and re-reading things, I'm getting a better picture.

It sounds like you have (one or more ports of) ExtA port forwarded to 
IntA and (one or more ports of) ExtB port forwarded to IntB.  You now 
want (one or more different ports of) ExtB port forwarded to IntA and 
possibly (one or more different ports of) ExtA port forwarded to IntB. 
This will allow IntA to effectively be accessed via one port range on 
ExtA and another port range of ExtB and possibly vice versa.

To make this simpler, I'm going to drop this down to one port on each 
server.

ExtA:80 port forwarded to IntA:80
ExtB:80 port forwarded to IntB:80

Let's see if I understand you correctly.  (In addition to what you 
already have) you now want ExtB:81 port forwarded to IntA:<something> 
and associated reply traffic to go back out ExtB, not the default of ExtA.

Presuming this is correct, you can fairly easily do this if you are 
willing to do something simple.  If you will send the traffic that you 
want to reply through the non default route to a different IP or port, 
you can easily use tc to match the traffic to use a different routing 
table and thus route out the non default interface.

You can either use a different port or a different IP address on the 
internal server(s).  You need something to be different between the 
traffic that comes in to the default and non default routes so that you 
have an easy way to identify the traffic and apply tc rules.

If you are talking about one service, say HTTP, you can probably easily 
use a different port.  However if you are wanting to do this with 
multiple services, it may be easier to use different IPs internally. 
This way, you can just match the internal source IP rather than the port.

Are you wanting to run similar services on both ExtA and ExtB, and have 
them be redundant of each other?  Presuming this is the case, this is 
what I'd recommend you do.  Get an additional IP address for each 
external connection.  The IPs don't need to be contiguous or even on the 
same subnet, they just need to route to your external connection.

ExtA1 is the existing IP on the A connection.
ExtA2 is the new IP on the A connection.
ExtB1 is the existing IP on the B connection.
ExtB2 is the new IP on the B connection.

IntA1 is the existing IP on the A server.
IntA2 is the new IP on the A server.
IntB1 is the existing IP on the B server.
IntB2 is the new IP on the B server.

ExtA1 port forwards to IntA1
ExtA2 port forwards to IntB2
ExtB1 port forwards to IntB1
ExtB2 port forwards to IntB2

Here is some ASCII art to help depict what is happening.

e  e     e  e
A  A     B  B
1  2     2  1
|  |     |  |
|   \   /   |
|    \ /    |
|     X     |
|    / \    |
|   /   \   |
|  |     |  |
i  i     i  i
A  A     B  B
1  2     2  1

This will allow server A to be accessed by either ExtA1 or ExtB2 and 
server B to be accessed by either ExtB1 or ExtA2.

Seeing as how you have two different IP addresses on each internal 
server, you can easily have tc use one set of routing tables for one IP 
and the other set of routing tables for the other IP.

Before I go in to tc rules, would this scenario suffice what you are 
trying to do?

Also, this will scale up to allow an additional 3rd connection with two 
IPs by adding a 3rd IP to each server and extending the port forwarding 
and routing tables.  ExtC1 would port forward to IntA3 and ExtC2 would 
port forward to IntB3, thus giving each internal server three external 
IPs that they could be accessed by.



Grant. . . .
