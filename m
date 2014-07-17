From: Phil Oester <kernel@linuxace.com>
Subject: Re: why scapy packet no effected by ip tables
Date: Thu, 17 Jul 2014 08:23:50 -0700
Message-ID: <20140717152350.GA4553@home>
References: <CAPpnho=+jciiQzpa9gnihrJsBRnRkniQtfWHPcrr7s4-3KHSDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPpnho=+jciiQzpa9gnihrJsBRnRkniQtfWHPcrr7s4-3KHSDw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Abogholo A <abogholo@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 16, 2014 at 05:16:21PM +0430, Abogholo A wrote:
> i wrote this rule for change all udp destination ip address to 8.8.8.8
> when dport is 53:
> 
> iptables -t nat -A OUTPUT -p udp -m udp --dport 53 -j DNAT
> --to-destination 8.8.8.8
> 
> but when send this packet
> 
> sr1(IP(dst="4.2.2.4")/UDP()/DNS(rd=1,qd=DNSQR(qname="iranled.com")))
> 
> iptables no effected to them
> 
> why?

Scapy uses raw sockets, which don't go through iptables.

Phil
