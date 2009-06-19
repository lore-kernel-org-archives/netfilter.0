From: Brent Clark <brentgclarklist@gmail.com>
Subject: 1.17 xtables woes
Date: Fri, 19 Jun 2009 10:33:43 +0200
Message-ID: <4A3B4D67.6030800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Hiya

Anyone have problems with the new 1.17 xtables.

Compiled perfectly fine, but if I use ipp2p module, I get

root@zion:/lib/xtables# iptables -A INPUT -m ipp2p --bit -j REJECT
iptables: No chain/target/match by that name.

Heres the odd thing :

root@zion:/lib/xtables# iptables -m ipp2p --help
snippet

ipp2p v0.10 match options:
  --edk    [tcp,udp]  All known eDonkey/eMule/Overnet packets
  --dc     [tcp]      All known Direct Connect packets
  --kazaa  [tcp,udp]  All known KaZaA packets
  --gnu    [tcp,udp]  All known Gnutella packets
  --bit    [tcp,udp]  All known BitTorrent packets
  --apple  [tcp]      All known AppleJuice packets
  --winmx  [tcp]      All known WinMX
  --soul   [tcp]      All known SoulSeek
  --ares   [tcp]      All known Ares

EXPERIMENTAL protocols:
  --mute   [tcp]      All known Mute packets
  --waste  [tcp]      All known Waste packets
  --xdcc   [tcp]      All known XDCC packets (only xdcc login)

Im bit at a loss right now.

I ran depmod -a, and im running iptables 1.4.4.

Regards
Brent Clark
