Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1A210FE
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 22:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706740622; cv=none; b=XYVEJusrUQOsdbYpVo2chNrC7qxBYy0nqFFeCDPvMC/ykaFxIOhoqDq7STn/6OjD8PPdN27vSpbNB9ANd5BIVnXf40UGKbrxL3uAbJjjXBFsbpOP9rlGMhWdBEwBbahNwnxeDA9m1bJKl++xa2bMNtNPpJKgu0pXcEHIakPHtCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706740622; c=relaxed/simple;
	bh=pMcA+oTTX3qjpDfr+ZJUhyyzNpYPL7CTM/RFYpbr2ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY4XqmI3HLM91/CU/kwSzli/H+iyyk+AqPF3qEJZejM8yN+SikpVesIKbePXggsDMzaDNW3DYbpoQ25RtpRbytABRre5XQhOupIE364QChWuYIGtxBNXwq63WGcNZctZ8kp0P8NbjfVtX2PzU5UFHXXXqEW7eDTUp4U1LjMiH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=35768 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rVJCO-00HKhH-Tp; Wed, 31 Jan 2024 23:36:54 +0100
Date: Wed, 31 Jan 2024 23:36:51 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbrLg8luc8tbZALr@calendula>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
X-Spam-Score: -1.9 (-)

On Wed, Jan 31, 2024 at 08:23:54PM +0000, Slavko wrote:
> Dňa 31. januára 2024 13:02:57 UTC používateľ Kerin Millar <kfm@plushkava.net> napísal:
> 
[...]
> I check manpage now, 1.0.6 (as is in debian bookworm) and from its
> ADDRESS FAMILY section is nor clean (at least for me) the order of
> inet and ip/ip6 tables processing. It is even not clearly stated here,
> that packet will be processed in both, the inet and the ip/ip6.

There is a command to display the datapath hook pipeline per device:

# nft list hooks device eth0
family ip {
        hook ingress {
                 0000000000 chain netdev x y [nf_tables]
        }
        hook input {
                 0000000000 chain inet x y [nf_tables]
        }
        hook forward {
                -0000000225 selinux_ip_forward
        }
        hook output {
                -0000000225 selinux_ip_output
        }
        hook postrouting {
                +0000000225 selinux_ip_postroute
        }
}
family ip6 {
        hook ingress {
                 0000000000 chain netdev x y [nf_tables]
        }
        hook input {
                 0000000000 chain inet x y [nf_tables]
        }
        hook forward {
                -0000000225 selinux_ip_forward
        }
        hook output {
                -0000000225 selinux_ip_output
        }
        hook postrouting {
                +0000000225 selinux_ip_postroute
        }
}
family bridge {
        hook ingress {
                 0000000000 chain netdev x y [nf_tables]
        }
}

[ The quick example above is rather silly, because it was taken from a
  VM with selinux hooks, one single inet/chain at input and one hook at
  netdev. ]

But it shows a view per family, for an IPv6 packet...

- going for local process follows ingress hook, entering nf_tables
  chain netdev x y, then in case it is local traffic it enters chain
  inet x y [nf_tables].

- being forwarded goes through ingress, then forward selinux hook at
  priority -225, then postrouting selinux hook again.

- leaving from local process follows output and postrouting selinux
  hooks.

- entering the bridge layer, it gets evaluated by the ingress hook
  too.

It is a flat representation, so you still have to understand how
routing determines what hook the packet visits.

There is a terse refering in the manpage:

LISTING
           list { secmarks | synproxys | flow tables | meters | hooks } [family]
           list { secmarks | synproxys | flow tables | meters | hooks } table [family] table
           list ct { timeout | expectation | helper | helpers } table [family] table

       Inspect configured objects. list hooks shows the full hook
       pipeline, including those registered by kernel modules,
       such as nf_conntrack.

which is a really shame :)

Someone up for contributing an improvement for the manpage, including
a better example than above and the explaination?
