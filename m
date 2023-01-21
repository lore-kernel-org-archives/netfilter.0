From: Stewart Nelson <sn@aokgo.com>
Subject: drop first SYN packet with nftables
Date: Sat, 21 Jan 2023 11:25:18 +0700
Message-ID: <af77a393-3897-c0b4-c0b8-6d6bbb370239@aokgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aokgo.com; h=cc
        :content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1674275122; x=1674361522; bh=O/qWFusd/J
        6ZsF3qF/E31ceauSxTMVYtHne8E0yeNtk=; b=hcp9ANRj1gZI7uRdfd4o/MehFD
        IvW7Is+whmfARvKWbRluFMVEmEG2gKyJPtvLRNBgy5eJUBVvN5hNoeIUwihbiFWR
        foSWxOqmnx2BUZM1FLzi6b/IZfZw60kJnYyhpBkPaPumSK2qsLC24CbFp0V2rACk
        61qhhrtEiqtkz5mzZ6UObvOZsCIVc2q4mot8yy0ytcGoYMY9O+aPcF3gj0hDFPTO
        Qluhz4U4KlSGTLsE+LUHkieUseWwn6WCqZKNHIh6V9X12Em1YOMC69dHTfUKTQbi
        5tp7fXgD9mJ+cLZa/aOj9em0PtmSHbJIGZsoNSFHDAdiHnFNQ4uV8rUxhM+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674275122; x=1674361522; bh=O/qWFusd/J6ZsF3qF/E31ceauSxT
        MVYtHne8E0yeNtk=; b=q+MR48VzvzMCfbA6d5ShMDKSiyO38LIK7z2ft9oQ9o03
        obGBDRs4UadtKjan4K89vBEB4Z1C9guc23UpTNeK5inefQ+tqD37SdFc88EJCeOa
        Tyy2b+KO3JEximginHYK7c+Ll2ZRWzw/JO5fjERJpSNV4mPqSGajANRb+hLa4U7R
        uK44DuH8SwKuQI7DFtOC4Vc3b2frO/DTs5S1thDmIRht4A1YOC0AiyKZobh49akF
        9hIsscNqA7FglDJRrTYv45wGMiWdPbOoXYMzzgO0Vwfc06ocjh1414YM6Wtp8oAS
        aiDhw6kT8OkEvF87VyRFg55uDEtNNOndu1E3HJ9X6Q==
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

