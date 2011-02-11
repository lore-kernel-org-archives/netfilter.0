From: Ryan Whelan <rcwhelan@gmail.com>
Subject: OUTPUT SNAT
Date: Fri, 11 Feb 2011 10:13:34 -0500
Message-ID: <AANLkTimBv5i=wHBW=_QCUkbkW32UA5bH1T2Le=2Hd_Ez@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=TW8h7XDbMzWiQg5BWYm7AMiLips6krT9oM54UXz8buI=;
        b=MIHTawO8b/MOqZWm/XZRqAM2aI5/Q/itBZS6xYTm2Cf8NnPwm1gMM1BaEEX4UszDUA
         DGNnvnWuxnknlLq3lcLJAGlvMF33oQSXSkawED1SEZJxafsrIpsfBQwvO5Xm6A7U7lzr
         Gf1UdZtNEpe67n+eIR4hoC0weHpfpZxjqvfTI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a linux router with a WAN/VPN interface (tun0) and a LAN/Bridge
(br0).  The SVI address on the bridge is 172.21.0.1 / 28.  The Linux
machine doesn't do any masquerading so all the traffic from machines
connected to the br0 interface contains its original address.  All
traffic from the Linux router itself, sent over the VPN has a source
address of the tun0, of course.  Is it possible to to SNAT all traffic
sent over the VPN to have a source ip of the bridge SVI?

Something like: `iptables -t nat -A OUTPUT -o tun0 -j SNAT --to 172.21.0.1`

`iptables -t nat -A POSTROUTING -o tun0 -j SNAT --to 172.21.0.1`
works, but it will also masquerade all traffic forwarded from the
bridge (br0) interface.

Is this possible with netfilter? or even possible with linux?
