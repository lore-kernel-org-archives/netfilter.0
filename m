From: alucard@kanux.com
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 15:20:44 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3440.200.44.170.105.1084303244.squirrel@200.44.170.105>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>    
    <200405102115.14089.Antony@Soft-Solutions.co.uk>    
    <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>    
    <1084227992.14224.5.camel@localhost>    
    <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>   
    <1084288178.15768.10.camel@localhost>
    <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
    <40A0FEC7.7020201@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40A0FEC7.7020201@pbl.ca>
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

Aleksandar Milivojevic wrote:
> I wasn't following this discussion too closely.  However after reading
> what John wrote, I'd guess that your first box is also generating ICMP
> redirect packets back to the router.  Reasoning why I believe that it is
> generating them is that the packet has arrived on the same physical
> interface where it is supposed to be routed out.  This is exactly the
> situation where routers (by default) generate ICMP redirects.  So even
> if you get your box to start routing, you might need to turn off
> generation of ICMP redirects on first Linux box (send_recirects, or
> something like that).
>

Yes, that could be happening because i'm trying to use the same card to
receive and to forward to the same subnet

> I guess that router is actually at your end (not ISP end), and it is one
> of those small cheap boxes where you connect ADSL or cable, so it has
> public IP address on one end, and is doing NAT for the internal network
> (and your Linux box is assigned to do firewalling).

mmm not at all, it's a cisco router for one of the t1's for the company I
work for. There are no other IP addresses available to forward it from the
cisco router -because they are all taken in other stuff-, so I have to
figure that out. If there's a way to do it with a second card, i'll do it
but, it has to be on the same subnet because the second webserver it's
being used by some employees and we need it to be seen from the outside
and there must be a way to do it whith netfilter. Since i have never used
any cisco routers, and the guy in charge of that is not very competent at
all, I started to use netfilter for this. I know that you could do it in
the cisco router directly but that's not my field and I am not allowed to
do it either



> If this is the case, you can solve it a simple way by putting second NIC
> in your first Linux box and assign it different network.
> So you would end up with something like this:
>
>                    +-------------+
>                    |     ISP     |
>                    +-------------+
>                           |
>                           |
>                           | ISP assigned public IP
>                    +-------------+
>                    |   router    |
>                    +-------------+
>                           | 192.168.1.1
>                           |
>                           | 192.168.1.2
>                    +-------------+
>                    |  Linux box  |
>                    +-------------+
>                           | 10.73.219.156
>                           |
>                           | 10.73.219.77
>                    +-------------+
>                    | 2nd Web srv |
>                    +-------------+
>

Here's my current setup:

                    +-------------+
                    |Cisco Router |
                    +-------------+
                           |
                           |
                           | IP Address -NAT-
                    +-------------+
                    |  Linux box  |
                    +-------------+
                           | 10.73.219.156 -Nat'ed' Address-
                           |
                           | 10.73.219.77 -2nd WebServer-
                    +-------------+
                    | 2nd Web srv |
                    +-------------+


> To enhance security, you might start making plans to move 2nd Web server
> into the DMZ (change of IP address) as some future project, but you
> don't have to do it right away.

That would be great and that's what I though at first but, let's put it
this way, this company has a lot of burocracy -and I hate it- to go thru
before changing something like this.

>
> Anyhow, you've got the idea, you only need to adjust it for your
> environment.
>
> --

I really apreciate your help a lot...
Juan

