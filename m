From: Valentijn Sessink <valentyn@blub.net>
Subject: short circuit evaluations?
Date: Mon, 21 Feb 2011 00:04:13 +0100
Message-ID: <4D619DED.6090405@blub.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello list,

Does iptables do short circuit evaluation?

Let me try to explain. I now have:
iptables -A chain -m recent --name evil \
       --seconds 900 --hitcount 15 -j block
iptables -A block -m recent --name block --set

If iptables does short circuit evaluation and it does this reliably 
(i.e. by design/documented/will not change without warning), then I can 
replace this with:

iptables -A chain -m recent --name evil \
       --seconds 900 --hitcount 15 \
       -m recent --name block --set

(Which is much harder to read, so much safer. HHOK ;)

Best regards,

Valentijn
