From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Stopping ip_conntrack_max from resetting
Date: Tue, 25 Mar 2008 02:59:12 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803250258490.9368@fbirervta.pbzchgretzou.qr>
References: <496A9F867C284A47A25BF0FB1A1EF819126005CFB9@exchange-mb-01.office.pelmorex.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <496A9F867C284A47A25BF0FB1A1EF819126005CFB9@exchange-mb-01.office.pelmorex.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Richard Andrews <randrews@pelmorex.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Monday 2008-03-24 15:09, Richard Andrews wrote:
> Hello,
>
> We have a system running iptables, of which due to the incoming
> traffic we've had to increase ip_conntrack_max via sysctl. 
> However, when restarting the service during any maintenance the
> value we pass during sysctl.conf is reset to the default 65536. 
> Which then we are forced to run "sysctl -p" to reload our custom
> value.  Is there a way to stop the iptables service from rewriting
> ip_conntrack_max when issued a restart/reload?

That seems to be a bug of your distribution, because on mine,
sysctl.conf is read and applied on boot.
