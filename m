From: Jonathan Knight <j.knight@kis.keele.ac.uk>
Subject: Re: iptables - Trying to understand "no longer support implicit source
 local NAT"
Date: Thu, 19 Mar 2009 20:04:05 +0000
Message-ID: <49C2A535.1040700@kis.keele.ac.uk>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Data Shock wrote:
> My
> linux box has a finicky program (let's call it the "Sender") on it that
> refuses to send to 127.0.0.1.  However, I have another program running
> on that same box that needs to receive the UDP traffic from the
> Sender.  We'll call that one the "Receiver".  These two programs must
> reside on the same device.
>   

Is it that it can't send to 127.0.0.1 or is it the loopback interface 
that's the problem?

If it's just the IP number then you could use a stub host on a 
non-routed network.  I.e.

ifconfig lo\:1 10.1.1.1 netmask 255.255.255.255 up

Now, if you can get your Receiver to listen to all the interfaces 
including the lo:1 interface and you can get your Sender to talk to 
10.1.1.1 then you don't need to use NAT at all.


Jon.

