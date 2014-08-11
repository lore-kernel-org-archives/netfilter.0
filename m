From: Albert K <alberk@gmail.com>
Subject: nftables with Classify target
Date: Mon, 11 Aug 2014 18:25:27 +0800
Message-ID: <CACjDgAO2_hVx=uRFSrrB5z+sykifWE8bc6i1uRy94NofgDpQ4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=J9YwZKqbcsYZgIKwej7rOriUMdSShSVH/nOs6FumX6o=;
        b=N9/JP735/CIBOt+3VdeaKaUJc427nwVUQKonIjInNzdGOfokrEvsX++KjAizPlnw1W
         m/omIiOqxp0fkB0yV5LDkgCp557t0l3MMXZ+re4oXXX2RN5ngJbEh24y9/f6Wmv22Du+
         YbcCvfk77GVt5by8BWEvGIl9e8CkNAp0DqpX7ZILWEPpx5EOvVTLTKc295XnSe2vHeKD
         3XWYV3FyTdGjGGOnkpEGr9+hZ6z+es7q3K/BPCVeCWXQIVy3P5YSg/Wss8V5vnT2YQEl
         u8euihPIHKvXPhPF1CspYlcO9cx/lhQk8NPGz/ngj98YfxWodZDSiZXIuuw7+Bl1PsCs
         vUCQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying out nftables and at a loss on how to achieve the following
iptables systax. I have eth0 and eth1 in bridge mode and classifying
traffic to a TC classid.   Any help would be appreciated.  Thank you.

iptables -t mangle -A POSTROUTING -p tcp -m multiport --sports
80,443,8080 -m physdev --physdev-out eth0 -j CLASSIFY --set-class 1:2

tc class add dev eth0 parent 1:1 classid 1:2 htb rate 7mbit ceil 7mbit prio 2
