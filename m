From: "d.gubin" <d.gubin@mashtab.org>
Subject: nftables and traffic control utility to QoS
Date: Mon, 27 Apr 2020 12:04:33 +0300
Message-ID: <a66c2c02-5966-3f1a-e902-3d12d167b5d2@mashtab.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mashtab.org; h=
        content-language:content-transfer-encoding:content-type
        :content-type:mime-version:user-agent:date:date:message-id
        :subject:subject:from:from:to; s=dkim; t=1587978273; x=
        1588842274; bh=ixhLGkZXBdYTb0OBuE6ZNzjcuLjHVRmzQjeJ0NqOwXk=; b=W
        gK0n5iZCjX7lxeE1+0VtKRTEQZtj5FXhRIzg0qppoQY4bpPTamhAfwZSB56As5mV
        QMRU1YtmaRts/xyNsfOJ26QIhkmPKqbNwuo/k6q0+sDkq8zuvxNAcszElL6aZZ2f
        t8nG2w+oneHlULIXtWYoZ2/WntFZHvvbVRQhQaU41c=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear Sirs!

I need to setup QoS on Debian GNU/Linux.
I am going to use nftables to modify DSCP field in IPv4 Header and tc to 
shape traffic.

Where is packets come in first: in nftables or tc (iproute2) ?

Thanks a lot for yours answers!

-- 
Best Regards
www.mashtab.org

