From: Sharevon <sharevon@gmail.com>
Subject: What's the default NAT type by using MASQUERADE target.
Date: Fri, 18 Dec 2009 14:28:22 +0800
Message-ID: <a4ece3070912172228j734a9a74yeb7f6f99640192d1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=StuFWfMeBoUG0XGoto0ye0C/e+aNT/hKvoZ2az4zI2c=;
        b=cKS5YLlk5q6nibx4luouI43Ku3E5XRVsX/xQ3Dfo8s7qhpWlGEbWBqQ5BsK7kavFoB
         pxLqC/edJ3GZqgc2/l+/m9Hx4JeIzPYC/SLtv/99xbvEUJMiRMwczguNikWAuBPVD1d2
         0MGNmmMmekRfq4fgNGD7pxcwXmSvwLG0KX3gM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Look at this topology.

                          192.168.1.1    10.0.0.1             10.0.0.2
       172.0.0.1
      ------------                -------------------
          --------------                      ------------
      |   PC 1 |----------------| NAT (linux)
|---------------------------|   router  |----------------------|  PC 2
|
      ------------                -------------------
          --------------                      ------------
  192.168.1.100
                                      172.0.0.100

Configure "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE" on
NAT(linux) with two different version kernel.

On PC1, ping 172.0.0.100 -t 3, PC2 can be reached with both kernel version.

ping 172.0.0.100 -t 2, I got 2 different results with 2 different
kernel version on NAT(linux).

I got ttl-expired icmp response from router with old version, but got
no response at all with upgrade kernel version.
No matter with which kernel version, router sends ttl-expired icmp
response from 10.0.0.2 to 10.0.0.1. It's forwarded to the internal
network by old version kernel, but considered as the traffic to the
local process by the upgraded version kernel.
Notice that ping 172.0.0.100 -t 3 works well in both cases.

It seems like the old version performed as a Cone NAT, well the
upgraded one performed as a symmetric NAT. So, what's the default NAT
type if I set rule as "iptables -t nat -A POSTROUTING -o eth0 -j
MASQUERADE", full cone NAT, port restricted cone NAT, restricted cone
NAT, or symmetric NAT? Can this be configurable? If it's configurable,
how to do that?

Thanks.

Sean.
