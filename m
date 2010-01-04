From: ml ml <mliebherr99@googlemail.com>
Subject: nf_conntrack_pptp with multiple clients
Date: Mon, 4 Jan 2010 16:31:54 +0100
Message-ID: <bae225f1001040731pd85f180ye7be8c8e1165301d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=4Ip+SyTwBPzcOZ6WQVHypx1q0qN1/OEZKjzMTMfdHus=;
        b=sYHehjJxcwD2/kL1LbYfmHfaLMx6OPmp9P68FPvutHya/XYdhd9EI6k2D++5P2WKJi
         tuodnO7tF7Ne6H1EEkHigwyIe0YAYX36AIpiljk8vJgi3rIoKCXbET1JzJtHOY/8UIgd
         grwjXWIW342M/ulgXq0Jbw6Bew13hLffGbvB0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello List,

i have two firewall (both doing nat) and multiple pptp clients like this:

Windows PPTP Server <---LinuxFW1---> <----LinuxFW2----> Windows PPTP
Client1 and Windows PPTP Client1

However, with my normal setup i cant get the PPTP VPN working. It
hangs on User/Password verification.
If i POSTROUTE GRE/1723 to my PPTP clients then it works.

I think thats where the nf_conntrack_pptp comes in handy...however i
cant get it working. It also hangs on User/Password verification.

Is there some howto or paper?

lsmod | grep nf
nf_conntrack_pptp      10756  0
nf_nat_proto_gre        6916  0
nf_conntrack_proto_gre     9472  1 nf_conntrack_pptp
nf_nat                 23192  3 nf_nat_proto_gre,ipt_MASQUERADE,iptable_nat
nf_conntrack_ipv4      19352  3 iptable_nat,nf_nat
nf_conntrack           71440  6
nf_conntrack_pptp,nf_conntrack_proto_gre,ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4


Do i need some special iptables rules?

I am running a default Debian 2.6.26-2-amd64 Kernel with iptables v1.4.2.

Cheers,
Mario
