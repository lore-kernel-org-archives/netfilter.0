From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Transparently redirecting http traffic to local proxy in bridge mode
Date: Wed, 2 Oct 2013 13:13:20 +0300
Message-ID: <CAAo+KFn80uaqFmYvt1J8n4rPF9hLNZY2TNGLUG=W6YA7MVuNUQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=B1z2KJgPgFCPhoEwyy/YuJINt1+4HRzTXMGHxhE77Do=;
        b=SRY5G3KqYhQJ+andnlyqY1Ttf5XNfVAihRKE1xGZTNZQw1mmu+vaPrUj03m71ulgFE
         Zt7Sw45F5wYaKbynI8S6Z2Qm0SV6A7EZBuxdhb1u4QhB7C75/ySOqP7JZGaYJyW8tniv
         7B3M70OmnwAAGonWEb5/wBmptUGOXbQd8QDJul2scbG48FwZ6XQ8ooRTHg2XeSbPYCIg
         yL9Vs+4UnoeBFku6kPYNXxHj/NJsrkx0yMXO6YMuC90OmiFaBJZM5F6ZfAQ/ayfcdUjW
         f7b0+mCJI3v7ATYup08AL+VygMpF30jDXWgNAzFCWR9b3S3DNynwuxdYxJTRzQ8m9Wyn
         Z8OQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Router - LinuxBridge - Backbone -- 10.0.0.0/8 , 10.20.0.0/16 test net
              |
              |
              |(eth1)
              --------> Management Interface 10.101.101.10



# brctl show br0
bridge name     bridge id               STP enabled     interfaces
br0             0000.00900b2a6f44       no              eth16
                                                        eth17

br0       Link encap:Ethernet  HWaddr 00:90:0B:2A:6F:44
--
eth1      Link encap:Ethernet  HWaddr 00:90:0B:2C:80:A2
          inet addr:10.101.101.10  Bcast:10.101.101.255  Mask:255.255.255.0
--
eth16     Link encap:Ethernet  HWaddr 00:90:0B:2A:6F:44
--
eth17     Link encap:Ethernet  HWaddr 00:90:0B:2A:6F:45


br0 is formed with eth16 and eth17. eth16, eth17 and br0 has ifconfig
"0.0.0.0 up". That is no IP set.

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.101.101.1    0.0.0.0         UG    0      0        0 eth1
10.101.101.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1


There are lots of clients within subnets other then 10.101.101.0
management subnet behind backbone. My test net is 10.20.0.0/16

I am trying to transparently cache http traffic.

# iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT
--to-destination 10.101.101.10:3128


Alternatively,

# ebtables -t broute -A BROUTING -p IPv4 --ip-protocol 6 --ip-source
10.20.0.0/16 --ip-destination-port 80 -j redirect --redirect-target
ACCEPT
# iptables -t nat -A PREROUTING -i br0 -p tcp -s 10.20.0.0/16 --dport
80 -j REDIRECT --to-port 3127



I see packet counters increasing in iptables stats. However squid can
not reply back to the clients. Internet stops for clients.


Is it possible to transparently redirect traffic as such? What do you
suggest to make it work?

Best Regards,



--
Oguz YILMAZ
