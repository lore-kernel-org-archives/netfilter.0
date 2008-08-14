From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 16:23:48 -0400 (EDT)
Message-ID: <18385-66657@sneakemail.com>
References: <19894-78618@sneakemail.com> <alpine.LNX.1.10.0808141557590.29462@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808141557590.29462@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, 14 Aug 2008, Jan Engelhardt jengelh-at-medozas.de |netfilter| wrote:

> CUPS does not actually use SNMP, does it? The way I have seen its
> output are regular UDP transmissions from and to port 631, without
> any replies (much like most NBT packets).
>
> 	-d 192.168.0.255 -p udp --dport 631

It does that too, but yes, recent (I'm not sure since when) cups also 
uses snmp.  The port 631 transmissions are for finding other computers 
that share their printers.  Snmp is used for finding standalone printers 
with their own ip addresses on your local network.  See 
http://www.cups.org/documentation.php/network.html#SNMP
