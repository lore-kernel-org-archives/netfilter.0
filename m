Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674EE18FDDC
	for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960215; cv=none; b=YRTW4xW5cr8pJAsJkBz/p9uIsHfY0fNFsZgctYlmpnzFuAmExT4ddQnRPhHbFwCIXXZRhkd5lS4N1S3z2TXrPz9+weaW+LRnSc3e5aYZTchDM+tmyxkfMYbEpXnASwSJU6InDJXsNexodpKVLYp73/IYvD75cizCyXrlDwfeoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960215; c=relaxed/simple;
	bh=vYt6DddOY6n23khcdvSaKVn1tajcki2cMMK4x6Hnr4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnalbFdYjzx+2CeYA27/FIw0XlsZBpInqBNQJBpOW7ullOTDCnsvzhQWJB2ZlEkPs2EA4Wh33hzvhbZ57s/uEjpE6t1KaPcAlknPTKf7TgEeR/r9Yr0kqNQBGTlOe6KdmXuqQGzpCPNtRXEDpINmURmzVxp9IK3fdUj7jFpVFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tPhuZ-0001x0-Jy; Mon, 23 Dec 2024 13:51:51 +0100
Date: Mon, 23 Dec 2024 13:51:51 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables portmap map
Message-ID: <20241223125151.GA7005@breakpoint.cc>
References: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> in kubernetes there is a feature called HostPorts for Pods, that
> basically it is just implementing DNAT from the current host
> HostIP:Protocol:Port to one Container IP and Port
> 
> If I understand correctly the documentation and following this
> stackoverflow answer
> https://unix.stackexchange.com/questions/745265/nftables-dnat-with-source-address-restriction-and-just-one-map,
> I can implement this with just one map, that should be something like
> this for IPv4 and IPv6
> 
> > "ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service"
> > "ipv6_addr . inet_proto . inet_service : ipv6_addr . inet_service"
> 
> In my prototype I can create the maps correctly and add elements to it
> so I think that part is ok
> 
> > nft add map inet cni-kindnet hostport-map-v4 { type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service \; flags interval \; }
> 
> The problem comes when I try to set up the rule to use the map, this
> is the rule I'm using but it fails to be inserted, there is also no
> clear message on the output, it just fails silently with an exit code
> 1.
> 
> > nft add rule inet cni-kindnet prerouting dnat to ip daddr . ip protocol . th dport map @hostport-map-v4
> 
> I also tried without success
> 
>  > inet cni-kindnet prerouting dnat to ip daddr . meta l4proto . th
> dport map @hostport-map-v4
> 
> See execution with debug=all attached
> 
> My system info is
> 
> nft -V
> nftables v1.0.6 (Lester Gooch #5)
>   cli:          editline
>   json:         yes
>   minigmp:      no
>   libxtables:   yes

Strange, this version does work for me.

table inet cni-kindnet {
        map hostport-map-v4 {
                type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service
                flags interval
        }

        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                dnat ip to ip daddr . ip protocol . th dport map @hostport-map-v4
        }
}
