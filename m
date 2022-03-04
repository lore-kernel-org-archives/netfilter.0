From: Marc SCHAEFER <schaefer@alphanet.ch>
Subject: Re: IP SNAT in a bridge
Date: Fri, 4 Mar 2022 15:25:14 +0100
Message-ID: <20220304142514.GA17205@alphanet.ch>
References: <20220303204545.GA6798@alphanet.ch>
 <20220304081050.GA2392@alphanet.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1646403914; bh=vLuAgkPFu2wnLCDsRFk4iXxdfltM2Gub/sNUWOZgz10=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=ohCZ2RYz8tA3xsForvF6ZGScv/1WpzBZz870UOFYNZnUgcVqPZMfKvcg+sNr/3B2Z
         /71W+99CvMkBUJCzz7jj7IKWAVysFJytShKwGxP+oEsumDRYh4GbOeS0eYMxGSNw2M
         WuN1XwsYTIoihskNK+snVwCfrpjXnU5MKyW3qq97is232HAB+thgZMA2imlQUf02BO
         n9OG7M9z9TSU9KIkttm+/BiVr9hpeOloJIKoLdPt1+LdEzN+w/Y7ATk4Y4pT1Yz+G8
         jc19me0GBHsXCRBgvWiRIj5rsuP/l1F+3GiZM/0Sm0shAiRQh6e0cENCgwHZCnVRP9
         o/KBt+Nd9ddaQ==
Content-Disposition: inline
In-Reply-To: <20220304081050.GA2392@alphanet.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Mar 04, 2022 at 09:10:50AM +0100, Marc SCHAEFER wrote:
> I found out that if the br_netfilter module is loaded, it works without
> the BROUTE.  I will investigate if there is a way to do it less globally.

Apparently through ip link set dev BRIDGE type bridge nf_call_iptables 1

However, ebtables BROUTE seems incompatible with basic iptables (nft
only).
