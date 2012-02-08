From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: kernel helper modules parameters
Date: Wed, 08 Feb 2012 15:16:03 +0000
Message-ID: <4F3291B3.1030107@googlemail.com>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com> <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr> <4F32846D.2060408@googlemail.com> <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=9I5ehCNfS0RI8gxq34QtOOTE/s7ovRGeJ0T0P0e7XP0=;
        b=GEsGPhSZenqWlhqFQCCihYOWQ7euXDVugQrN/LTY5xQsM4vphkD4JjBjFuV+vef1sX
         1HCTY86eocny8MRXMDcIQp6GGZNsbU/vCpr+jBENWGov3IMkcPTQrFEKM5xcTNBTNf5p
         1YGG2c/IlATUgDIrbvgpPNbzvfzfuUWXIejbs=
In-Reply-To: <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> "ENOENT has many meanings, and iptables prints just one of them,
> which is potentially misleading."
>   
Thanks, this will be corrected I take it?

> The reason you have to specify -p tcp is so that CT can take a
> reference to the particular helper instance (which is identified
> by name, L3 family, _and_ L4 family) and/or load a module that
> does provide such instances, respectively.
>   
Is there a need for the L4 inclusion (seems that it causes the initial 
error message)?

Also, there are helpers (the sip one comes to mind) that work both with 
tcp and udp protocols and are potentially great candidates to be used 
with the two-dimensional ipsets (hash:ip,port). As it stands though, I 
have to create two iptables statements *and* use one-dimensional ipset 
to load and use that particular helper. Wouldn't it be easier if the L4 
restriction is dropped/amended (if it is indeed the source of that 
error) so that protocols could be omitted when using two-dimensional sets?

> While we do know whata L4 protocol a packet is once it is received
> from the network, there is no chance to load the required module
> on the fly due to interrupt context constraint, so hypothetically
> allowing "(-p all) -j CT" would be unreliable, packets would not
> "get helped".
>
> As such, specify the L4 beforehand is a requirement.
>   
I thought the helper module is loaded once the iptables statement is 
created, isn't that the case? Also, if the helper itself allows for "-p 
all" (or "-p tcp" or "-p udp" at the very least) what then? The "L4 
protocol" restriction won't be needed, would it?

To me it seems rather unnecessary to have to specify a protocol where I 
could have ipset take care of that, otherwise I am left with the 
alternative of using one-dimensional sets only (I haven't yet tested the 
iface-type sets, so I strongly suspect I may have a bumpy ride there as 
well).

> Precisely. "-p all" just is not the same as "-p tcp". I guess
> one /could/ add a PF_UNSPEC instance to nf_conntrack_ftp.c,
> thereby allowing to use -j CT without any -p (or nonsensical values
> for -p) and ignore all packets that are not TCP.
>
> But that would cause some practical overhead as a packet's verdict
> would not be known until the helper code is executed. (Currently
> the check can be done outside the helper because the L4 is
> known in advance.)
>   
What I still can't get my head around yet is why the hesitation for not 
using a helper module, which was already specified (and I suspect loaded 
in memory) in the iptables statement - is there a concern that more than 
one module may be used for a particular packet? If that is so, then I 
could easily prepare a clash with using an ftp helper module selecting 
the same ip:protocol:port triplet for, say, ftp helper module as well as 
sip. What happens then?

On a side note, looking at Eric's "helper-recommandation.pdf" (I guess, 
I should have spell-checked the name of that file as well), as far as I 
understand it, there are two different methods of 
loading/creating/setting up helper modules:

1. Using the "FORWARD" chain in filter as well as specifying "RELATED" 
and helper name matches;
2. Using the PREROUTING/OUTPUT chain in raw by specifying the CT target 
with a helper name match (this is what I used in my examples up to now).

Are the two methods above interchangeable (i.e. use one or the other, 
but not both) or should I configure both (in which case I haven't tried 
my ipset trick using the first scenario!)? In that file there is no 
indication whether I should use one or the other (or both!).

If I have to use the first method above as well, why is the "FORWARD" 
chain used (at least in the examples given in that article)? If I want 
to set up a helper on outgoing packets then using the OUTPUT chain in 
filter seems to be the best solution.

I also take it either of the above methods is the preferred option 
instead of using modprobe (and force the loading of that helper module). 
Am I correct in thinking that?
