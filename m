From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 16:00:08 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808141557590.29462@fbirervta.pbzchgretzou.qr>
References: <19894-78618@sneakemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19894-78618@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Isard <y8ju2p902@sneakemail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-08-14 14:51, Stephen Isard wrote:

> I'm wondering whether there are iptables rules that will permit
> cups snmp printer discovery to operate without creating a serious
> security risk.

CUPS does not actually use SNMP, does it? The way I have seen its
output are regular UDP transmissions from and to port 631, without
any replies (much like most NBT packets).

	-d 192.168.0.255 -p udp --dport 631
