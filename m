From: Daniel Lakeland <dlakelan@street-artists.org>
Subject: manipulating the ttl
Date: Sat, 25 Jan 2020 17:02:09 -0800
Message-ID: <9c18d561-2033-baa9-718f-29275392acd5@street-artists.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=street-artists.org; h=to
        :from:subject:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=street-artists.org; bh=khwPLkk4kjg
        KPls2vxFIA2jqdjU=; b=JX1mh7zC1vyESZS4YRayZQxAbGVuKE+c/lE/9r+Uv8Y
        yLZ2IxO2LK17pK88Gn9Rf29Hx/sCd2xWWm5g8hoG6oFxE/iEesfEV/XLZiWY+Xc+
        xgks8t2AwkiskZvuAK6WVVMAPRmfMGU5FX/R5+SKK5va2f66fqONaBi0A2aF3jQw
        =
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@vger.kernel.org>

As far as I can tell in nftables there's no way to manipulate the TTL 
field in packets, along the lines of iptables -A foo -j TTL --ttl-set 2 
or the like

This becomes a problem for handling certain multicast scenarios. Is this 
on the horizon?



