From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Wed, 22 Apr 2020 12:34:26 -0400
Message-ID: <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
 <87blnkqg1j.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=pNFuPEwjlHejEcgYh/bhqsjcjWURZJJg0QxhJDFMQ9c=;
        b=kcypWiAlv/g6uTL/cgRaYk1KC3JNIq7P4pjnX+pEbyteZQjU4iSb2q1h22qNSgAy2G
         k5n3S0pkgHQyou3I6bbWhv1+GNgz3GHYUffweGpyMkuAoQlRJ1G/aUnkjisN8aVcfz4g
         vblN7iLw10Kkf7bfFr1IOo/yCUN/yuIc7mbD+SdlEcVtCn1A+u5g8fn4dQKVAXgZj4WK
         ayLii78wxJb8K5I0/n2aLIMMp44FpCi51N2bmFSoqMgxuNgyfUS2dip85qnnecR09j92
         1pqYyY43rLFiTuD1J/1B7/+1cmLFwDJbV2yODVqaK32iIgfMnnX7biBwRkA9SNcB6VXs
         GMRQ==
In-Reply-To: <87blnkqg1j.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> You can simply put "list ruleset" at the bottom of the foo.nft file.
> However in my experience this routinely gives outright wrong rulesets
> (as at nftables 0.9.1), so I don't trust it.

That's a pretty good tip, thanks!... And you're absolutely right, it
gives some weird output. See below the diff of 'nft -c -f foo.nft'
with a 'list ruleset' at the bottom and the actual output of 'nft list
ruleset' once foot.nft is applied to the kernel:

[root@bouboule ~]# diff -u /tmp/toto1.txt /tmp/toto2.txt
--- /tmp/toto1.txt      2020-04-22 11:55:55.718378603 -0400
+++ /tmp/toto2.txt      2020-04-22 11:56:01.888551779 -0400
@@ -1,12 +1,12 @@
 table ip filter {
        chain input {
                type filter hook input priority filter; policy drop;
-               ct state 0x6 accept
+               ct state established,related accept
                ct state invalid drop
                iif "lo" accept
-               meta l4proto icmp icmp type echo-request accept
comment "You can restrict this if you want"
-               meta l4proto tcp tcp dport 22 accept comment "You can
restrict this if you want"
-               meta l4proto tcp tcp dport 179 accept comment "For BGP"
+               icmp type echo-request accept comment "You can
restrict this if you want"
+               tcp dport 22 accept comment "You can restrict this if you want"
+               tcp dport 179 accept comment "For BGP"
        }

        chain output {
@@ -15,7 +15,7 @@

        chain forward {
                type filter hook forward priority filter; policy drop;
-               ct state 0x6 counter packets 0 bytes 0 accept
+               ct state established,related counter packets 0 bytes 0 accept
                ct state invalid drop
        }
 }

Of note is the fact that the 'ct state' line does not contain both
states. As well, the addition of 'meta l4proto' adds a lot of
unecessary verbiage. But still, good to know that this is somewhat
doable as it never dawned on me to put 'list ruleset' at the end of
foo.nft.

> A possible short-term workaround would be to spin up a netns, load the
> new ruleset in *there*, then dump it and tear the ns down again...

This is actually a very cool idea! I never realized that nftables
rulesets are bound to a specific namespace, but now it makes perfect
sense. The only "drawback" (I guess) is that I cannot use 'iif' for
any other interface than 'lo' in the temp namespace; I'll need to use
'iifname' instead since the referenced interfaces won't exist in the
temp namespace. But it's not a deal breaker.

I think I will go with this workaround until (if) nftables supports
this functionality natively.

Thanks!
-Martin
