From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: how to use meters?
Date: Sun, 18 Sep 2022 12:49:34 +0200
Message-ID: <871qs9neip.fsf@alfa.kjonca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1663498175; bh=XSKGwBg9q9vdKMw1oZMHC2l7z9DhDTYA/zJJi1l2vtQ=;
        h=From:To:Subject:Date:From;
        b=kZ58XpPKu5rxyAU0xP8ysaDqzwaYA8LeTqXgTQnUdnSOHHcsyL4toXE1ivQTBZBaN
         U8G5lLBMXhaM7uWwPQgWnPKFXmcB/sXkFsZyPxemRhM2ixPx0iDnX7/TvQva3txwc8
         qj3t4KV82B7zJp1G5c7Yh8NRSV0rr2HVgArY789s=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I try to understand "meters" and I have an impression I missed
something.
Use case:

--8<---------------cut here---------------start------------->8---
iptables -A wan-f-ssh -p tcp -m conntrack --ctstate ESTABLISHED -m tcp --tcp-flags FIN,ACK FIN,ACK -m recent --set --name ssh --rsource -j LOG --log-prefix "FW+SSH:FIN:"            
iptables -A wan-f-ssh -p tcp -m conntrack --ctstate ESTABLISHED -m tcp --tcp-flags FIN,ACK FIN,ACK -m recent --update --seconds 30 --hitcount 2 --name ssh --rsource -m recent --set --name ssh2  --rsource -j LOG --log-prefix "FW+SSH:FIN#2:"      
iptables -A wan-f-ssh -j ACCEPT                                                                                                                                                                                                                

[...]

iptables -A FORWARD -m recent --update --seconds 60 --name ssh2 --rsource -j DROP
iptables -A FORWARD -p tcp -m tcp --dport 22 -j wan-f-ssh
--8<---------------cut here---------------end--------------->8---

ie. if SSH connection ends, it added to observation (ssh set) then if
second end happens during 30 sec it is added to block (ssh2 set)
I would achieve similar behavior with nftables and I guess that I should
use meters but ... I do not know how.
In some internet sites I found some examples but I do not understand
"why that".
For example:
https://wiki.archlinux.org/title/Nftables#Dynamic_blackhole
--8<---------------cut here---------------start------------->8---
 ct state new tcp dport 443 \
                meter flood size 128000 { ip saddr timeout 10s limit rate over 10/second } \
                add @blackhole { ip saddr timeout 1m }
--8<---------------cut here---------------end--------------->8---

I understand " add @blackhole { ip saddr timeout 1m }" - adds address to
set for 1 min.
but what is
"meter flood size 128000 { ip saddr timeout 10s limit rate over 10/second }"

(I can guess but I cannot see proper doc of this)
Any hint?
KJ

-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
