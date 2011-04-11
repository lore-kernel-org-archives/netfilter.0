From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables - external IP address on internal interface?
Date: Mon, 11 Apr 2011 16:53:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104111653340.26159@obet.zrqbmnf.qr>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Rogers <Tony.Rogers@erudine.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-04-11 16:04, Tony Rogers wrote:

>
>I have a question for the iptables experts out there.
>
>I previously asked this question on this forum here.
>
>But no satisfactory answer was given.
>
>I have an iptables firewall, where *eth0* is the *internal interface*,
>and _eth1 is the external interface_. eth1 is connected directly to the
>internet, and this box is also a NAT router.
>
>I am seeing traffic sourced from external IP addresses on eth0 (internal
>interface) - how can this be? (see logs below)

A misconfigured host.
