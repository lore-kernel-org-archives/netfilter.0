From: R C <cjvijf@gmail.com>
Subject: nftables equivalent for iptable rules.
Date: Wed, 28 Apr 2021 15:12:14 -0600
Message-ID: <2ddec11e-b22f-39ef-c8c0-fc08438aa26a@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=xukfCSTIvfj9L/JTY4Alt4tySdIM5czsRH7g9em4PCg=;
        b=PzdQyrFtaDJBCEKXigk0tNs1PcBhZphdB+jU4qrfgI5AXKTfPMIM4sphAQR2sdC4As
         CQMxY4S0ps3bSUSnJ4mKHNCPJkgv2eYjth+bx29KqYQ/B+11Ow1LFN98PvxdBf0uMSnt
         Fih+njVwCLVuYPNWABzS3TA/981wRu2DjH1y7dmzhXcn5m8qP/VYlOVnYpsvj3wpsldV
         s3uQXCxd+8sdsoguDPU5I/dlMhzvMwoV0CwUR1qvcpOGWj/L9HN8LJsxATPsVDNFvif8
         NyPiWf08gzBFoGRKDJT0Mja5hKHSlhm5oLUY5NpTtiPm+LEa6KesRl4tJIuPbJh86KN3
         q7Gw==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello,


I have a machine I am running RHEL 8 on. there are two interfaces and I 
want to forward all traffic between those interfaces (for the src and 
dst in the subnet a wireless device is on).

One interface is connected to a switch, WAN side. The other ethernet 
port has an access point, connected wired.

I did turn on ipforwarding, and thought I needed only two firewall rules.


sysctl -w net.ipv4.ip_forward=1
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o eno1 -i 
enp0s20u4u1 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o enp0s20u4u1 -i 
eno1 -j ACCEPT


However,  when I try to do a DNS lookup, it looks like it is being 
blocked/stopped by the firewall, because when I stop the firewall, it 
just seems to work. With the firewall up and running, however I can ping 
an ip address.


for example; if I do "ping www.google.com"  I get a "ping 
www.google.com: Name or service not known"  If I use  an IP address 
(from www.google.com), it just works.

from what I understand is that iptables lets traffic through that way, 
but bftables does not.  One solution suggested was to  change the 
firewalld backend to iptables, which works, but since at some point I'd 
need to have it work with the nftables back end, I might as well look 
into that now.


So; how do I  set up the firewal effectvely with the same result as  
with iptables?


thanks,


Ron

