From: Maxim Koshelev <chuchelo@gmail.com>
Subject: SNAT and multiple ISP problem
Date: Sun, 26 Apr 2009 17:45:20 +0400
Message-ID: <40e8da40904260645x601a22a4obb942a30e3428d31@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=J4gysNU7RLTJIV29F2BkbQVR7G4dSOJT5xoiQ85St0c=;
        b=aUUniuc1VkWuaY9eznHMIYTFXekjEiBFVr4tnvSlR8UBcEyBdCJ4yDHn6WXh9BNqHU
         +wjii9M6WNWZxL7sRD0EUwfCCaxhSUztQq2voW+KXhVDgujitm2F6HSEnUXNhuwuqAPX
         ar7FtYcIeGneT/bRoGEOwFyoswPPZaVKCQcxA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
I have a problem that I can't find working way to do some kind of load
balance beetween two internet channels using SNAT. I've tried various
schemes to do this but in all of them kernel makes wrong routing.
For example if I try to add such rules in nat:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $ETH0IP
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to $PPP0IP

kernel will do SNAT only according default route in table main. It is
ok. But if I try to change default routing selection (e.g. by adding
in 'mangle' table some marks and adding 'ip rules' with this marks)
kernel begins to route some packets nated to ppp0 into eth0 and
vice-versa! I can simple monitor this ugly behavior using tcpdump. It
brings to lost packets and connections drops ( because one of IP's is
192.168... but second one is real )

Is there any way to make right routing?
