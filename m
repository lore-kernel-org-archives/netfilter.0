From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Selective proxy ARP
Date: Wed, 13 Jul 2016 09:30:09 +0100
Message-ID: <E35C21C2-B34E-4D2A-9E3A-EAE88F9FEC18@alex.org.uk>
References: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk> <20160713052614.GB27436@unicorn.suse.cz>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1468398586; bh=ZievG3KqXfm3gCmdnSp32MYNKHWyAhte7pmEgwQ1Luo=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=HTDuiT/XfQZ8+YV+PDQ32HMu0fEdjWX6wtE3asyvSUxp+Nr5lgXRhdz7tyF9YA2za
	 G9VhoSEGrD/+bC8jAL4TCHv2zePMJOPLq3b5M02G3VBfWMBJpxql4FyfdUpyV4oqCn
	 yv7wqAmxlOWgsoKcI3e+k3XvuufjZAUhrSzXvimw=
In-Reply-To: <20160713052614.GB27436@unicorn.suse.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Alex Bligh <alex@alex.org.uk>, Mail List - Netfilter <netfilter@vger.kernel.org>


On 13 Jul 2016, at 06:26, Michal Kubecek <mkubecek@suse.cz> wrote:

> How about doing it the old manual way?
> 
>  ip neigh add proxy 192.0.200.101 dev bond0
>  ip neigh add proxy 192.0.200.??? dev bond0

That actually looks fantastically useful (yes, the dupe was copy and paste
in anonymisation). Thanks.

I'm presuming this method also translates to ipv6?

-- 
Alex Bligh




