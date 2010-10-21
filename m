From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect mirrored traffic to userspace app.
Date: Thu, 21 Oct 2010 10:02:10 -0500
Message-ID: <4CC055F2.7040909@riverviewtech.net>
References: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/20/10 16:58, Mateus Caruccio wrote:
> Thanks to this damn GUI world, probably this ascii-art is ruined.

Nope.  Using text mode email and a fixed width font (my default) it came 
through just fine.  ;-)

> All traffic is UDP port 2077 only. I can not change any config on 
> PROD_SRV.

Ok...  UDP will take care of the protocol handshake issue that you have 
with TCP.  That means that your dev server can truly receive the request 
and not have borked connections.

> Our DEVEL_SRV should receive exactly the same packet PROD_SRV 
> receives, but with destination address modified so it can reach our 
> userspace application.

On the surface I agree.  Just under the surface I wonder if you really 
need to alter the destination IP or not.  (More in a bit.)

> I've tried to "DNAT" it, but without success:

Rather than DNAT, why not try simple routing.  (More in a bit.)

> From DEVEL_SRV point of view, it receives a legitime request.

I assume that you are looking at the traffic (via TCPDump or something 
like it) and deciding that it's legitimate b/c you haven't gotten 
traffic to make it in to the service yet.

> I've setup a DROP rule so responses do not interfer on client's 
> requests.

I'd wonder if you really want to DROP the traffic or redirect the 
replies so that you could test (analyze) that as well.  (More in a bit.)

> If I'm not clear, please fell free to ask anything.

Na, I think I understand what you are trying to do.  -  Set up something 
so that you can test dev code under (possibly a portion of) live traffic 
load.

For giggles I'd try having the dev server and prod server be in 
different subnets.  That will allow you to bind the prod server's IP to 
a different nic (dummy or something like it) and enable routing.  That 
way when the traffic comes in to the eth0 interface on the dev box, it 
would be routed to the proper nic where your software is bound to the 
real IP.  There by doing away with any hacks needed to get the traffic 
in to your service.

As a bonus, you should have a better emulation of the service between 
the prod and dev servers, there by making it a better test and allowing 
service config migration between the two boxen.

Just something that I'd try.

As far as the DROP rule, I'd rather set the default gateway on the dev 
box so that it would go out a different nic (physical or virtual) such 
that your service could send reply packets that could then be analyzed 
elsewhere.

> Thanks for helping,

n/p

Good luck.

Please provide follow up and let us know what worked for you.



Grant. . . .
