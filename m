From: Bhanu CV <vbhanu.mailinglists@gmail.com>
Subject: How does iptables classify change skb priority
Date: Fri, 28 Jan 2011 10:34:25 -0800
Message-ID: <AANLkTinF_tgHjbmdiTJrwAb-pJ09u1JKyHstCBUygcHZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=evkVfhVYuIypzDnSIg41FoI7yx7Fyfy1eOxJtbHjxhU=;
        b=uWxG2tu/aYv0fooq6tvXbief+kySp/BFa1dCv3fG05pe6AIr/4IAWTrJDcEfsLNg8b
         ySKvV2hjt+IkPyA7i6LoEFzAnPMoLhYjnZgcQCf9ZOVScU8TZvHVp59cVl9EQSvXdVLH
         WGhX97XEjAs3zLqEMUXSdrSbJZQqtyl2ZzrYA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to change the skb priority of the packets going out to a
particular destination. Then I use vlan set_egress_map to change the
vlan priority of the packet. This works as I want it to, the confusing
part is I do not know why it works!

I use the following two commands:

change the skb->priority (?) for the packets that I am interested in to 3:
iptables -t mangle -A POSTROUTING -d 192.168.10.75 -j CLASSIFY --set-class 0:3

change the vlan priority of the packet leaving over the vlan
vconfig set_egress_map eth4.2 3 3

This does send a packet on the wire with MAC layer priority of 3,
which is what I want. What I am trying to understand is the action
that iptables is taking. I do not have any class under the root qdisc
on eth4. The root qdisc has handle 0:

It would be great if someone could explain how iptables is classifying
the packet in a way which changes the skb->priority of the packet.

Thanks in advance,
Bhanu
