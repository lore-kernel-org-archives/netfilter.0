From: Martin T <m4rtntns@gmail.com>
Subject: understanding "bridge check" hop in packet flow in Linux kernel
Date: Tue, 22 Apr 2014 14:38:49 +0300
Message-ID: <CAJx5YvFNV2zd2_yRSZM_PPUKeTqtGdPrFO7L4gBjdsZj0dP0sQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=NZgIuc6zr7ysoY9Im0slk0nNWl5gE8z3sREg3dg6YWo=;
        b=TFTFJmalQN4BltZLsgRr1pjrQlhSE+fPxw00kYLRkhZ8qMB6IfxnQb0kNxozsoIXYn
         Lz7mBF2C0NwIxPEqSgBE83phuEChDSyWbHkVgFY3gBf4e8HxrizLOwR9K1nTzXx60EHr
         5GPR65wDKUFJyhz3B/hegF6ALvABpTwfkVoFjRrYTkulIL9cqRLyzDgDsNktZK5tf/TR
         9gK7aGK5TPPOXUWGsWA42N03d3A8adhXZYT9MdA5hmhuAs3CuJ+NLfT4YJM67ElB3JCq
         z7vZSvO9hR6Nja1gdukO3FxwHS/qnTGqbmPWGHKDKID/CuagSF3AKZZAPqcI8SR7l7Yk
         F8zA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

according to "Packet flow in Netfilter and General Networking"
drawing(http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg)
one of the first hops in packet flow right after the traffic control
and queuing is bridge check. What exactly happens in bridge check?



regards,
Martin
