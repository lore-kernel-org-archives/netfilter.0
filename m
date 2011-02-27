From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: turning off iptables processing for bridged packets
Date: Sun, 27 Feb 2011 09:30:08 -0600
Message-ID: <20110227153008.GN4855@cardinal>
References: <DD1D3360D73274A4C51A9FAB@Ximines.local>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DD1D3360D73274A4C51A9FAB@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Feb 27, 2011 at 03:04:32PM +0000, Alex Bligh wrote:
> By default netfilter appears to apply iptables rules (specifically 
> the FORWARD chain) to bridged packets. Is there a way to turn this 
> off (i.e. only apply the FORWARD chain to routed packets, not 
> bridged ones)? I seem to remember there is, but I can't for the 
> life of me find the configuration setting.

I'm not sure if there is a runtime sysctl, but at compile time your 
option is CONFIG_BRIDGE_NETFILTER.

If you don't want to compile a new kernel, you could put rules 
passing bridge-only traffic at the top of FORWARD:
    -A FORWARD -i br0 -o br0 -j ACCEPT
for example.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
