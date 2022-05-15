From: "Alov, Igor" <alov.igor@gmail.com>
Subject: it is possible to use link group or vrf to make a netdev hook?
Date: Sun, 15 May 2022 15:38:06 +0300
Message-ID: <50b53772-45f6-8bfd-fbeb-aefc7332803f@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=JBvsoaxCIKFgB7h32mj/7nC1grFTU06ZfOu/ZfxLHMc=;
        b=TlnPbH+/c4lhShA+r2dXbTrQIOuW3/Q7vOlumZtfgIGf5jMqvOJI6YG8qcuWPJKid1
         dBHKGmZtkvpWU9SpbFgmsPla9SkPf+TxIYHqUrcdLVr0P7YmMxULI0W78/wQXK6D0F5a
         aNW2XflnCnQ/3AW70GtUZpvIUrQK5KGnizKDFnK4pcaprV18Jtuvw6kjaAbT9BXD1B9V
         kPi32rKtVAo7R2E9B3UvPCEJS1gl+ocwZESdsQnVkPr7H47YA4yE7SOVhetHXa06EjNO
         wASFqjzEwgmqSPeX/ljh2hw50ClkSi7bdP9dnlVXF4k2wTewl3IZ4/B40v8q1miN7imN
         awwA==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Howdy Folks!

I'm currently on switching to nftables framework, but I'm stalled a 
little bit, my question is about table netdev and hook for ingress devices.

is there are possible ways  to specify devices that are join to link 
groups ( /etc/iproute2/group)  like (type filter hook ingress devices [ 
group "bgpext" ] priority -400; policy accept;)?

# ip -br link show *group bgpext*
vmbr140018       UP             00:d8:79:fe:c7:ae 
<BROADCAST,MULTICAST,UP,LOWER_UP>
vmbr140444       UP             00:d8:79:fe:c7:ab 
<BROADCAST,MULTICAST,UP,LOWER_UP>

or there are exist possible ways  to specify devices that are join to 
specific vrf  like (type filter hook ingress devices [ vrf "bgp" ] 
priority -400; policy accept;)? I know I can specify device "bgp", but 
this hook  will not work, until I specify exact ether devices.

# ip -br link show *vrf bgp*
vmbr5000            UP             86:ec:4d:d2:61:32 
<BROADCAST,MULTICAST,UP,LOWER_UP>
vmbr140018       UP             00:d8:79:fe:c7:ae 
<BROADCAST,MULTICAST,UP,LOWER_UP>
vmbr140444       UP             00:d8:79:fe:c7:ab 
<BROADCAST,MULTICAST,UP,LOWER_UP>

Yes, i know that I can manually add variables like that {dev1, 
dev2....devn}, but I would more flex configuration template.


-- 
With Best Regards
Alov, igor

