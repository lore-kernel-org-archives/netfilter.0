From: Martin Bednar <martin@serafean.cz>
Subject: Re: nftables vmap concatenations with interval
Date: Wed, 28 Sep 2016 14:51:50 +0200
Message-ID: <6538549.qvO97AaWzG@nemmerle>
References: <11357773.LdaEAIBM0O@nemmerle> <20160927191101.GA3195@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1475067114;
        bh=fZ49QzkFkjBfseHxEZLFq2GgmO6NfXPo94i8/rVzwdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=B29N6/0gSCx+AKqJFyh8SOMq3IXWNFEIpF/jC12/RV9509dc6AY56gwD47h9DtqjU
         ZasQOOxyPeauB7dcsjKkFxCooWBcNrum5jvjt5jlP5peiRgS2tedeRcKzGJ7G0FKci
         CVd1XE1W5nU9L3JhHR9a4hvwKqCaZdp8lHBmXc7uH8sEv4VQ3oCLvDn43oX5UY00NZ
         waEPUV07KNIkFqNGcycu1m0aK4KQY2LPwZR8AB1nHuVb+9uPbZjO07CqQYksMz2or3
         zPYcfd2uj8bSq+MXsmEXZaskWisRMEOzvAhqQ97pl3/say7NwKh8vCmAw9OK5F2LYW
         FiBO578UP+nWQ==
In-Reply-To: <20160927191101.GA3195@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Le Tuesday, September 27, 2016 9:11:01 PM CEST Pablo Neira Ayuso a =C3=A9cr=
it :
>=20
> nft add table inet filter
> nft add map inet filter mymap { type ipv4_addr . iface_index : verdict \;=
 }
> nft add element inet filter mymap { 172.18.0.0  . eth0 : accept }
> nft add rule inet filter forward ip saddr and 255.255.255.0 . iif vmap
> @mymap ^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> The idea here is to mask the address, then add to the set the result
> of this operation, thus, 172.18.0.0

Very cool trick... Thanks. this solves 90% of what I want :)
This however implies the same mask for all networks, right?
Is is somehow possible to have one vmap for networks with different masks?

Thanks.
