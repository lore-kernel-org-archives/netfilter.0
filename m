From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: P2P networks
Date: Fri, 26 Aug 2005 16:54:12 +0200
Message-ID: <31829.1940996007$1125068179@news.gmane.org>
References: <430F2C39.4000003@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430F2C39.4000003@eccotours.dyndns.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Brent Clark' <bclark@eccotours.dyndns.org>, 'iptables' <netfilter@lists.netfilter.org>

Hi,

> If says I can drop "some P2P" like kazaa and ares, is there a list of p2p
> networks that can be dropped.

  Try iptables -m ipp2p --help

IPP2P v0.7.2 options:
 --ipp2p        Grab all known p2p packets
 --ipp2p-data   Identify all known p2p download commands (obsolete)

 --edk          [TCP&UDP]       All known eDonkey/eMule/Overnet packets
 --dc           [TCP]           All known Direct Connect packets
 --kazaa        [TCP&UDP]       All known KaZaA packets
 --gnu          [TCP&UDP]       All known Gnutella packets
 --bit          [TCP&UDP]       All known BitTorrent packets
 --apple        [TCP]           All known AppleJuice packets (beta - just a
few tests until now)
 --winmx        [TCP]           All known WinMX (beta - need feedback)
 --soul         [TCP]           All known SoulSeek (beta - need feedback!)
 --ares         [TCP]           All known Ares - use with DROP only (beta -
need feedback!)

 --edk-data     [TCP]           eDonkey/eMule/Overnet download commands
(obsolete)
 --dc-data      [TCP]           Direct Connect download command (obsolete)
 --kazaa-data   [TCP]           KaZaA download command (obsolete)
 --gnu-data     [TCP]           Gnutella download command (obsolete)

  Regards,

- Ruben



