From: Younes Manton <younes.m@gmail.com>
Subject: Established UDP connection seems to have the wrong timeout.
Date: Thu, 11 Sep 2014 12:21:22 -0400
Message-ID: <CAMVNhxSUy32rqZ-RpMHvxHFBU9sLnCRvuYGYpcJETPC16f-5kA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=SRKfp9rHylDR8+k8mv6PXimnqikNGri3WKFgYILbdhQ=;
        b=SRdOL3mM4HwXS5ydEztXq/k8++dga0cRWRcQwAS+U2zUfe2poh4VUE9iHIKY5VmZLB
         KfSDtOzw1Uhtiqpqi9Mbs6rppuIoxZCHtXEPo0XKG43R+NlaA//j3f+wFEIcDn/JO74a
         hYBPVuVb31lrhKe/hlsPE1uqziWNaUR4VdERAvoWcLiThgV03q5Nrk0DfSsKWt6F3Ln9
         W2GwhnNJ8Vnd6CXXySCtCu96KCyEsolCvGaJgQwi83NnxxBP9/HNokt8OyvKDslLOK77
         GhQ5V/ZZHQYDxEtx2X6TvUqkZvaogU49kZJGt4I1mc8Qq4r1HLrW3G94cae/pHF7h2Eh
         RLrA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,

I have a NATted client behind a router that sends a single UDP
keepalive packet to a server. The server responds with a single
packet. According to the output of /proc/net/ip_conntrack however the
mapping that is created is not in the ASSURED state and is therefore
only kept alive for 30s. Is this expected? I was expecting the
connection to be ASSURED and to have a 180s timeout. Router is running
2.6.22.19, which is old, but I'm stuck on it. I took a look at the
source for that version and the latest kernel and it looks essentially
the same to me and seems to suggest that if both a send and a response
is seen then that's enough to make the connection ASSURED, so I
thought to ask here.

Background:

I have an Android phone and am using the built in SIP client behind a
Netgear router running Tomato. Router's UDP assured timeout is set to
180s, unreplied is 30s. The SIP client is trying to be smart and find
the longest keepalive that works; it has an algorithm that starts at
10s and is supposed to work up to 120s over time/depending on battery
level/possibly some other voodoo, but it sometimes gets into a state
where it goes over 120s and even over 180s. By the time it gets to
keepalives >180s I hit the above problem where the router is only
keeping the hole open for 30s.
