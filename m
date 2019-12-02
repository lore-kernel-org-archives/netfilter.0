From: Jan-Philipp Litza <jpl+direct@plutex.de>
Subject: nftables: No prefixes in anonymous sets?
Date: Mon, 2 Dec 2019 10:10:31 +0100
Message-ID: <7dd662ab-9d95-dbe9-3cf8-5db33ccb4b1a@plutex.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi everyone,

surely not only for me, sets were one of the main reasons to switch from
iptables to nftables. However, I was very disappointed that anonymous IP
address sets don't support prefixes (ranges):

/etc/nftables.conf:5:20-29: Error: Set member cannot be prefix, missing
interval flag on declaration
        ip saddr { 8.8.8.8/32, 1.1.1.1/32 }  drop
                   ^^^^^^^^^^

Poking around in the source code, I found the relevant line [1] that
explicitly checks for anonymous sets. Apparently it was added in [2] to
give the user a better error message that some "BUG".

But couldn't you also simply (or maybe not so simply) "upgrade" the
anonymous set to an interval-capable set when you encounter a prefix?
Or, if this is totally impossible, maybe add a syntax to explicitly give
anonymous sets the interval flag? Or are anonymous sets inside the
kernel itself somehow incapable of containing prefixes?

Also, why isn't this message triggerd by something like "tcp dport {
22-23, 80, 443 }"? Isn't this a range in an anonymous set as well?

Best regards,
Jan-Philipp Litza

PS: Not on the list, so please CC me directly.

[1]: https://git.netfilter.org/nftables/tree/src/evaluate.c#n1298
[2]:
https://git.netfilter.org/nftables/commit/src/evaluate.c?id=3f84f4ad0568f22106f283a3077a85957e83fe57
-- 
Jan-Philipp Litza
PLUTEX GmbH
Hermann-Ritter-Str. 108
28197 Bremen

Hotline: 0800 100 400 800
Telefon: 0800 100 400 821
Telefax: 0800 100 400 888
E-Mail: support@plutex.de
Internet: http://www.plutex.de

USt-IdNr.: DE 815030856
Handelsregister: Amtsgericht Bremen, HRB 25144
Geschäftsführer: Torben Belz, Hendrik Lilienthal
