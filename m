From: Ed W <lists@wildgooses.com>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Fri, 12 Aug 2011 12:12:23 +0100
Message-ID: <4E450A97.8070303@wildgooses.com>
References: <4E44F1DC.3090605@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E44F1DC.3090605@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Zeidler" <jonatan_zeidler@gmx.de>
Cc: netfilter@vger.kernel.org

On 12/08/2011 10:26, J. Zeidler wrote:
> English:
> 
> Hello,
> 
> I use a SSH-tunnel with Putty on Ubuntu 11.04. I want to achieve, that
> the network traffic over a specific port is redirected over the tunnel.
> I need this because of a strict firewall, which i can not configure. the
> tunnel runs on localhost:9999. i can use this as proxy with firefox, so
> the tunnel works. i tried this without success:

Try OpenVPN (or your favourite VPN package, possibly SSH with the
tun/tap whatever basic vpn mode?).  This is likely easier to setup and
tunnels all traffic out.  OpenVPN can also run over http connect with a
bit of configuration, so can slip out of fairly locked down firewalls...

Good luck

Ed W
