From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Selective proxy ARP
Date: Wed, 13 Jul 2016 09:26:43 +0100
Message-ID: <05BECA7A-8DCC-4CEF-A6EA-E136C03FF480@alex.org.uk>
References: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk> <CADGd2DpDLuqSoZX1Hta1oVhGrOMUbrGaoT+WP0zrpMn=YBV1eQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1468398380; bh=XTjyxj1bKQnqm/mum33J8dQW41hemgSKr5OKGblJPdQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=ttFO+NQV+eQQEl5chmoy26lJ/GhfFbg014PKcPfVD9LPpm+H2R6Z2arO/zy5x96qF
	 OIqe6nE8GBwMZeEaqFIWTg+sZnpxvwaD6lJd2Ylo3FXHzrAN2ov6wH5fucpf5dfEoX
	 gESqO5KUQuZBW/swh9CCXa09kM3rOzNeto8FWhgA=
In-Reply-To: <CADGd2DpDLuqSoZX1Hta1oVhGrOMUbrGaoT+WP0zrpMn=YBV1eQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Lauro <johnalauro@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, Mail List - Netfilter <netfilter@vger.kernel.org>


On 13 Jul 2016, at 01:31, John Lauro <johnalauro@gmail.com> wrote:

> Assuming you want the whole /24...
> 
> for h in `seq 1 254` ; do arp -i eth0 -Ds 192.0.200.$h eth0 pub ; done

Actually just the two addresses, but that looks good for IPv4. Thanks.

> (Well, replace the two eth0 with bond0 in your case, although I would probably tie the vms to another nic or loopback interface and route instead of bridge even if you had to appear as layer 2 to the DC)
> 
> I know, this is the proxy arp that you wanted to avoid, but not sure why you think some sort of masquerade arp would be better than routing / proxy arp?

I can't influence the routing (that's on the DC side).

If I use proxy arp and have another interface of 10.10.10.1/24 (for example) proxy arp will ARP for anything in that range (as I understand it). I only want to proxy arp for specific IPs.

> You would need some sort of ebtables rule to ensure you didn't leak any arp out the virtual machine mac addresses if you do this on l2 instead of l3. Keep to l3 for the vms behind the host and it's a non issue.

The L2 segment is only inside my VM (bond0 is not on br0) so that should be ok.

-- 
Alex Bligh




