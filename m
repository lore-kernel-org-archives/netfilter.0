From: Brskt <contact@brskt.be>
Subject: Re: List chain during attack high CPU usage
Date: Thu, 03 Aug 2023 11:49:59 +0000
Message-ID: <em36be3a75-afb4-4570-a9eb-bcdcdf9648af@68036a95.com>
Reply-To: Brskt <contact@brskt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brskt-be.20221208.gappssmtp.com; s=20221208; t=1691063400; x=1691668200;
        h=content-transfer-encoding:mime-version:user-agent:reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLEbqKc8W3ZW/iDf5XlqyMqNNjxTswnRFGEGW4Wauhw=;
        b=Ft40Gc+s+IAdewvvWxb9FqsZSwSjV3K5vwJAjtiAUdpVFYzADrjttyHPKMpjFuxRpY
         E2SbFn87wzBWRjqrwoxWkdXCGZ9fubAZ8XQctQL6HFJ0KNx7k9DUcWKPtbl0ac167UwK
         wcv4IPKKzacwShvqZFIm0ygCL3zrjZ7bl+c+6uuZr7BsaqEwwD/Jgg//HsKIvollYiLI
         A+vC7ipHdrOZbEz2JuKz5F2yIvuyW/itoqO6M7G9Wcr3Cf8VAUBEI5jE0tgikcCDfllt
         tET0XU0mThp+HXa/4LbvippnDTSgMub7FjBof9hX6C6qYvrhMvJxMnoCZf0bCXvRt/IJ
         vPNQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

Is there any updates on this ?

https://marc.info/?l=3Dnetfilter&m=3D166256224929259&w=3D2

I don't understand why using "nft list chain netdev firewall filter"=20
take time and CPU usage even if a set have a high numbers of elements=20
since we don't show the elements in the set.

There is the filter command in the chain "nft add rule netdev firewall=20
filter update @ratelimit_test { ip saddr . ip daddr . th dport } counter=20
drop" which use the set but, we don't see how many elements and/or which=20
elements are in the set.

Listing a chain should not try to load the elements in the set(s) that=20
are used in a filter like iptables with ipset does not.
It also do the same even if "counter" is not used.
