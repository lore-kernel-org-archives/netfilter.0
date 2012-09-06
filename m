From: Marco Padovan <evcz@evcz.tk>
Subject: Re: Using Netfilter with high bandwidth
Date: Thu, 06 Sep 2012 21:16:46 +0200
Message-ID: <5048F69E.2090504@evcz.tk>
References: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=RJv8F774WVxJlCvP1Sa9T99ULb8qZisUgeADQA0s3LM=;
        b=MO50IgLql0kai50Au4CawZBsXG/HsT685Cfp5e4Q4HQbJjvY9Ld0nCxmPcBF5b37Ey
         cDjgfCjvNZqHxchGYn+phNHHS1uMHPjnSHf1f+HE7QVGzUnIEs5Twdyy6Ez+Yz7lrZiy
         X1DgxBeId8j0D6GI3FySOuZGaTWiGtl3qOLbo=
In-Reply-To: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

Solutions like these:

http://shader.kaist.edu/packetshader/

are surfacing lately... and those can't be compared with CPU processing ;)

Il 31/08/2012 21:38, Julien Vehent ha scritto:
> Hi All,
>
> At work, we're building a new office, and we are considering building
> our own edge firewalls instead of giving bucket loads of money to the
> big guys. We're a Linux shop, so it makes sense to build those new
> firewall/vpn boxes using Linux. But we are concerned about
> performances and complexity. I make a simple diagram of what we want
> below. We would have a point to point WAN connection between the two
> networks, and then an uplink on each side.
>
> So I figured I would ask the Netfilter heavy users:
>  * How much traffic can we expect to route to a decently configured
> Firewall ? Can we target 10GBPS with good NICs/CPUs and proper kernel
> tuning, or is that completely out of range ?
>  * If I recall correctly, some ISPs are using Linux/Netfilter boxes on
> their network. Do we know the limits of such systems ?
>  * Can we consider conntrack and conntrack synchronization between
> master and slave ?
>  * What type of network cards will handle 1GBPS and 10GBPS
> (eventually) ? Any recommendation on the hardware ?
>  * We are considering starting with a base ubuntu setup and then
> tuning the kernel/system to fit our needs. Some distros are more
> network oriented than others, is there anything that would stand out
> for our setup ?
>
> Any pointer to tuning/recommendations is more than welcome. If you
> have experience with such a setup but don't want to share publicly,
> feel free to contact me directly.
>
>
>                          ........... ...... ..........
>                       ...      I N T E R N E T       ...
>             +--------+..                               .+---------+
>        500 MBPS          .............................            |500
> MBPS
>        UPLINK                                                     |UPLINK
>             |                                                     |
>        +----+-----------+             1 GBPS WAN       
> +---------+------+
>        |               
> +------------------------------->                |
>        | LAN FIREWALL   |---+                           | DATACENTER
> FW  |---+
>        +---^+-----------+   |                          
> +---^+-----------+   |
>            || +-------------+                               ||
> +-------------+
>            ||                                               ||
>            ||                                               ||
>            ||1 GBPS LAN                                     ||1 GBPS LAN
>            ||                                               ||
>            ||                                               ||
>          ..+v....                                           |v......
>        ..         ..                                       ..        ..
>       ..   L A N   ..                                     .. Datacenter.
>        .............                                       ...........
>
>
> Thanks a lot everyone :)
>
> Julien
>

