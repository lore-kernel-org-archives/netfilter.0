From: Hooman <mailinglister.hooman@gmail.com>
Subject: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Mon, 15 Jun 2020 23:38:04 -0400
Message-ID: <e8de3662-249c-598b-cd0d-e97ccc500449@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=MaFf3qfVdxDhwS8g1fGskU3QTkvtlhYJwQHS/CkdF2g=;
        b=gCPcgbjZBnAfXJxE8RT4dNr2DVZFaDWueZbfMWUVqVtMOd1+t6bhKlf/lxkY4SdJVr
         oEgZcBSMF0uJ+jkrJdHpdQQuxrMCyflPzYvGVxIy0d/td97KucDZzXU6RilSZJMmncU9
         LSIxTM/HxYUHXBJGYBt9V6PX+ZC3CD/CmG2Fin2+GqY5gpAN099U14Wek+w696W4cfQR
         yWJT/44Qq/tHTSEMWKbvvFv8DP+iz2UhlSvMl/R1GnEPVJ55sa9frnWPULrgAVb1RTDV
         n1j26Bq/7aSHJk0weQlE8H3xIRb2UfqftSoJv/KuVIcDwXUrU8gDB4FktFcCzBE4+XMt
         OoKg==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am using WiFi hotspot feature of Ubuntu 18.04 to create a hotspot for
my devices. I need to prevent different devices on the network from
contacting each other.

More specifically, I have two phones on the network, I would like them
not to be able to send any packets to each other. Right now if phone 1
is using IP address 10.42.0.172 and phone 2 is using 10.42.0.59, I can
use phone 1 to ping 10.42.0.59.

I would like to disable connections between different hosts on the
network created by the hotspot.

I tried using iptables to drop local traffic. However, it seems like the
iptables don't have any effect on these packets.

I do see local packets on wireshark though. I'm wondering if local
packets are forwarded directly without hitting the iptable rules.

Is it possible to use iptables or ebtables to filter these packets? Is
there any other solution to this?

Thank you
