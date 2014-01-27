From: Ray Soucy <rps@maine.edu>
Subject: Re: Public IP to Private IP
Date: Mon, 27 Jan 2014 15:48:16 -0500
Message-ID: <CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Mayo <scotgmayo@gmail.com>
Cc: netfilter list <netfilter@vger.kernel.org>

The term you're looking for is "NAT reflection" or "hairpin NAT".

If you're not running split DNS, then trying to reach a system via its
"outside" IP from an internal system will present a problem because
the source IP of the request is seen as on-link by the server, so the
server responds directly from an unexpected source IP and the
requesting host drops the request.

You can get around this issue by NATing the return traffic when its to
and from the internal network.

Assuming that your inside interface is eth1, and your inside IP
network is 192.168.0.0/23:

iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 -j
MASQUERADE

Split DNS, however, is a better approach, if you can do it (using
views in BIND).




On Mon, Jan 27, 2014 at 2:22 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
> I am having some troubles getting my public IPs routed to my private IPs.
>
> Here is an example.
> Private IP of the main server with my IPTables:  192.168.0.1
> Public IP of the main server:  1.1.1.1
> I also have 1.1.1.2 and 1.1.1.3 as public IPs attached to the public nic.
> Domain name example.org is pointed to 1.1.1.2
>
> I am trying to get the following public IPs to Private IPs:
> 1.1.1.2 -> 192.168.0.2
> 1.1.1.3 -> 192.168.0.3
>
> If I am outside my network and go to example.org, it seems to work fine.
> If I am inside my network and go to 192.168.0.2 then it works fine.
> If I go to example.org from inside my network then it goes back to
> 192.168.0.1 instead of 192.168.0.2
>
> Maybe this does not have to do with IPTables even since it works with
> an IP, but I thought I would ask here.  I do not have an internal DNS
> server.
>
> Here are the rules that I have:
>
> IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
> --to-destination 192.168.0.2
> IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -j SNAT --to-destination 1.1.1.2
>
> Any suggestions would be appreciated.
> Thanks.
>
> --
> Scott Mayo
> Mayo's Pioneer Seeds   PH: 573-568-3235   CE: 573-614-2138
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Ray Patrick Soucy
Network Engineer
University of Maine System

T: 207-561-3526
F: 207-561-3531

MaineREN, Maine's Research and Education Network
www.maineren.net
