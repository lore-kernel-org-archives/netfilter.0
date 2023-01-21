From: Stewart Nelson <voip@aokgo.com>
Subject: drop first SYN packet with nftables
Date: Sat, 21 Jan 2023 11:31:01 +0700
Message-ID: <07c91998-e6eb-6a2d-b5aa-c0d8392eaf9a@aokgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aokgo.com; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1674275465; x=1674361865; bh=O/qWFusd/J
        6ZsF3qF/E31ceauSxTMVYtHne8E0yeNtk=; b=YaMnGnlnSK6TuHbzorr/aHyFr8
        hbsauQOZL+fGmWGp7OntExmlXmyvlSdOUMobyx1zqlZ9EqHQf132bDWO3hyObmvw
        wuKLV9HHsZhZ6CIwJDVz8C+d6fznZQlSjekTJCbsoqtMHlnyvB65Y5EQY+48H4Id
        77KU0LVl0Wq9CAXaGjlxbDPyeW+j8QCKOUf21xsYKLYEcOUQv5dQ8bRc1ls1YRHL
        6TCidROLah4Vxny191ZLG8JjuEeXlJtaxWV5FEFlGWyRD6uxyqL0Kjb61b3ny5vd
        dQdZzu1nRgypHE997JZfre3gGfBNaHY8j2GqFFnmFYE/8kYhX01TnQX4zwpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674275465; x=1674361865; bh=O/qWFusd/J6ZsF3qF/E31ceauSxT
        MVYtHne8E0yeNtk=; b=TxOPmXu033uarYi4mdQ/MCzrh/7YEtRkRr61Rfhr0Tz1
        5Z6dR7P0PxelpSlm9WmEQ7IZOseR6h37SfCGhN/JORIDAmM6j5cuPnQsGKWdmuN0
        HYhBbZshmceR7cSRoYL06idMCiM68TRGSHl6VhnuQMAVaAE/IRRhSBgD6RqvUT3Y
        qAN0OjzhjotFqKvopBhskt1jKIWlBAjgGLN823y5ykIgSx5O8+p972MTgN7vpTtg
        /9D53yk08o4M/iMLsLlKzNYVwbJ34uopCKdh+aJMAtaL1KZaKULvgWjhGEjTY+9Z
        Iix4ItYPaR8FariUjwY/qSSYv46N0PuIB2XPqg1kMg==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

How can I drop the first SYN packet received by my server (or the first 
SYN/ACK packet sent by the server)?

I have a test VPS set up to capture and analyze malicious traffic 
directed to non-standard TCP ports, for example attacks on sshd running 
on a high port. Using BGP, an IPv4 /23 is routed to the VPS. With the 
nftables rules below, connection attempts to any port 20000-60000 are 
redirected to sshd.

flush ruleset
table ip nat {
   chain prerouting {
     type nat hook prerouting priority -100;
     tcp dport 20000-60000 counter redirect to 22
   }
   chain postrouting {
     type nat hook postrouting priority 100;
   }
}
table filter {
   chain input {
     type filter hook input priority 0; policy accept;
   }
   chain output {
     type filter hook output priority 0; policy accept;
   }
}

This works and results in ~20,000,000 address/port combinations that 
will connect to sshd.

The problem is that I'm only interested in attacks that retransmit an 
unanswered SYN (the vast majority probe with only one SYN, as scanning 
all ports on all IPv4 addresses is quite expensive). I've tried various 
methods, based on conntrack state, packet count and even expiration, all 
to no avail. I suspect that they are somehow interacting with the redirect.

For example, adding this to the output chain:

tcp sport 22 ct expiration > 55 counter drop

causes all SYN packets to be dropped. Using 'conntrack -E', you can see 
the expiration timer going down with each subsequent SYN, but when it 
gets below 55, the packets keep getting dropped.

Environment: Debian bullseye, kernel 5.10.0, nftables v0.9.8, conntrack 
v1.4.6.

What am I doing wrong? TIA for any suggestions.

