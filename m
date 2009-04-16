From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: How to block DHCPv4/v6, ARP, RADVD with ebtables/iptables on bridge?
Date: Thu, 16 Apr 2009 09:57:57 +0000 (UTC)
Message-ID: <slrngue095.o48.petr.pisar@album.ics.muni.cz>
References: <20090414205007.GA5663@Linus-Debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 2009-04-14, Linus L=FCssing <linus.luessing@web.de> wrote:
>
> So now I'm having more trouble to find the right rules to block
> DHCPv6 and radvd over bat0. Thanks for the help in advance.
>
DHCPv6 uses UDP/547 on server and UDP/546 on client with link scope
unicast or mutlicast addresses.

Router Advertisment utilizes ICMP6, Router solicitation type to
link scope multicast ff02::02 by client and Router advertisment type to
link scope multicast ff01::01 by server. Source addresses are link scop=
e
unicast addresses in both directions.

-- Petr

