From: Brad Pousland <bpousland@izuma.net>
Subject: setting meta priority to select link vlan qos 802.1q priority via
 egress map
Date: Tue, 12 Apr 2016 12:13:26 -0500
Message-ID: <CAGBdaZm-3nTMOp=zTF_=h3=epRDDAA13UCwZxnGg5jg8MV1yGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izuma-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:date:message-id:subject:from:to;
        bh=Tr5CbJ4c8LJfQV7Uu5ohKh7RnW8zBNJVtcJvrbp7538=;
        b=JAoZfyeQjwIqquph6ZKj8sNivRNXvfODcy0NPHS4YlO5nAzXNDUGpPu5eDBpG+dRgZ
         thscbmmMZaGumKdvuSfRcFc+HWOtLQi/8f+spo5TrR0Q86dPpBSq3qtzBpk/WPc86vfb
         ljAYFWusL++l0BcgbwwDD96WcwyDwL2xH9VXm+qbZ9v18pLkygaJk0+DX/Yj4gVf3BZH
         GlSpLdaihbHlTBfFCw9RwI23Aub2n1kCeqYMzBm8Vs6HAJMlvGqnqk8gTOjGfiWGoh7U
         FN+y05q6+23/mp7L+ecxaX0U158Qe4/+7w1xOFFT4AzjrRhyntPLwlDAqgUuGfR9VV9Z
         NKwQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to control the vlan qos priority of a link by using an
egress qos map on the vlan link and setting the packet priority using
an nftables rule.

I have a vlan link defined with an egress map from 3 packet priorities
to 3 vlan qos priorities as follows:

30: eth0.2@enx00e07cc8db5b: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500
qdisc noqueue state UP mode DEFAULT group default
    link/ether 00:e0:7c:c8:db:5b brd ff:ff:ff:ff:ff:ff promiscuity 0
    vlan protocol 802.1Q id 2 <REORDER_HDR>
      egress-qos-map { 0:3 1:2 2:6 } addrgenmode eui64

As a test I am using a simple rule to set the packet priority of any
packet from the vlan address:

table ip mangle {
     chain postrouting {
          type filter hook postrouting priority 0; policy accept;
          ip saddr 192.168.1.62 meta priority set 0200: counter
packets 0 bytes 0
     }
}

I then send packets from eth0.2 and inspect the packets from the
physical parent device. The QOS field is always set to 3 as if the
priority was never modified on the outgoing packet by the rule, even
though the rule counter shows the rule was invoked.

Does anyone know if the "meta priority set" can be used for this
purpose?  I  could give up and use tc for vlan priority control but
that seems overkill since I don't have complex traffic shaping
requirements.

Thanks,
Brad
