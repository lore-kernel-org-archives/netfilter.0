From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Wed, 18 Sep 2013 08:58:41 +0100
Message-ID: <1BE5F0A9-E67C-4870-AC63-F30FAAFEB227@alex.org.uk>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il> <87li2w9scf.fsf@vostro.rath.org> <43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk> <5238E484.80802@plouf.fr.eu.org> <87k3ifymlk.fsf@vostro.rath.org>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87k3ifymlk.fsf@vostro.rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikolaus Rath <Nikolaus@rath.org>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org


On 18 Sep 2013, at 01:55, Nikolaus Rath wrote:

> Why not? For example, the VPN node also acts as my mailserver. So
> whenever I encounter firewalls that e.g. block everything but port 443
> and 80, I have to establish a tunnel to be able to connect to port 25,
> and then change the mail server name in my MUA to the internal name on
> the VPN. Then, if I'm at a different location where I do not need the
> VPN, I have to change it back to the public hostname.
> 
> That is rather annoying, and I could avoid it if I somehow get
> the smtp connections to use the VPN gateway as well.

One possibility would be to add another interface, so you are using
separate destination IP addresses for the end of the VPN tunnel
and 'everything else'. Remember the 'everything else' IP address
does not need to be public, as you'll only be reaching it by
the VPN tunnel.

Another is to use policy routing and only direct the VPN traffic
down the /32 route. This is pretty much what you were suggesting
re the marking etc. However, I would caution that this will mean
(e.g.) ICMP goes the 'wrong' way for at least one session. This
will make debugging hard, may affect pMTU discovery etc. etc.,
all of which will be bad news for reliable connections.

-- 
Alex Bligh




