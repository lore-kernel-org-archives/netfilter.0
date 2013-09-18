From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Wed, 18 Sep 2013 21:11:11 +0100
Message-ID: <E91E34E7-300C-42D0-A80E-53D62E6991DF@alex.org.uk>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il> <87li2w9scf.fsf@vostro.rath.org> <43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk> <5238E484.80802@plouf.fr.eu.org> <87k3ifymlk.fsf@vostro.rath.org> <1BE5F0A9-E67C-4870-AC63-F30FAAFEB227@alex.org.uk> <87txhic9nr.fsf@rath.org>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87txhic9nr.fsf@rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikolaus Rath <Nikolaus@rath.org>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org


On 18 Sep 2013, at 18:38, Nikolaus Rath wrote:

>>> Why not? For example, the VPN node also acts as my mailserver. So
>>> whenever I encounter firewalls that e.g. block everything but port 443
>>> and 80, I have to establish a tunnel to be able to connect to port 25,
>>> and then change the mail server name in my MUA to the internal name on
>>> the VPN. Then, if I'm at a different location where I do not need the
>>> VPN, I have to change it back to the public hostname.
>>> 
>>> That is rather annoying, and I could avoid it if I somehow get
>>> the smtp connections to use the VPN gateway as well.
>> 
>> One possibility would be to add another interface, so you are using
>> separate destination IP addresses for the end of the VPN tunnel
>> and 'everything else'. Remember the 'everything else' IP address
>> does not need to be public, as you'll only be reaching it by
>> the VPN tunnel.
> 
> Hmm. I don't get it. Could you explain in more detail?

Assume your tunnel endpoint is 192.200.0.1 - i.e. a public IP.
Your challenge is that you want the packets constituting the
tunnel itself to go out one interface (direct to 192.200.0.1
over the internet). But you want your packets to 192.200.0.1:25
to go over the VPN. Correct?

So, assume you are not using 10.100.100.0/24. Add an interface
(I believe a loopback interface will do) with IP
address 10.100.100.1/24 on your VPN endpoint box. Ensure SMTP
etc. is listening on that interface too.

On your vpn client, do not use 192.200.0.1:25 (which by your own
admission will only work if you connect over the VPN). Rather
use 10.100.100.1:25. Use a default route over the VPN, but
route 192.200.0.1/32 to the nexthop the previous (native) default,
i.e. to the upstream router.

As 10.100.100.1 has no specific route in the client, it will be
routed through the VPN using the default route and will have the
source IP address of the VPN interface on the client. As this
will be directly connected, return traffic will also go via the
VPN.

Obviously for anything not connecting via the VPN, it can still
connect to 192.200.0.1/25. You've just added an extra IP
(which requires no routing and can be in RFC1918 space - here
10.100.100.1) to make life easier for clients that do connect
using the VPN.

Job done, no iptables required.

-- 
Alex Bligh




