From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding traffic from public IP to public IP.
Date: Wed, 28 Nov 2007 10:38:41 -0600
Message-ID: <474D9991.5000009@riverviewtech.net>
References: <AFB1C16E164D73439741623EBFEA771C4DB039@lex-exch1.lexionmedical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AFB1C16E164D73439741623EBFEA771C4DB039@lex-exch1.lexionmedical.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 10:09, Jason Hawthorne wrote:
> I need to temporarily forward all traffic from one public IP address 
> (a.b.c.d) to another public IP address (e.f.g.h). I have tried 
> setting up iptables with the following rule
> 
> -t nat -A PREROUTING -d a.b.c.d -j DNAT --to-destination e.f.g.h
> 
> but it doesn't seem to be working. As far as I can tell the traffic 
> is getting forwarded to the final ip (e.f.g.h) but when the return 
> traffic comes back it doesn't come back through the debian box, it 
> goes straight to the source and fails. Basically it skips the debian 
> box on its return like this
> 
> SOURCE ---> DEBIAN (iptables with nat) ---> DESTINATION ---> SOURCE

Ah, yes.  This is what I like to refer as a "TCP Triangle".  You see the 
problems with it.

> Is there a way to get this working with iptables?

Yes there is a way to get around this.  You need to SNAT the traffic as 
it's leaving DEBIAN on its way to DESTINATION so that it will follow the 
same path in reverse back to the original client.  Thus you end up with 
this:

SOURCE ---> DEBIAN ---> DESTINATION ---> DEBIAN ---> SOURCE

The main problem with this is that your DESTINATION system will not see 
the real source IP of the traffic.  If this is important, you may want 
to consider some sort of reverse proxy that will add a header with the 
original IP address in it (I think that is how this can work???) or you 
may want to look in to something like Linux Virtual Server's Direct 
Routing solution if the DESTINATION is on the same network as DEBIAN and 
can thus use the same return path.  (Refer to LVS DR approach for more 
details on how this actually works.)



Grant. . . .
