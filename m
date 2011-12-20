From: Andrew Beverley <andy@andybev.com>
Subject: Re: Is the current firewall model static?
Date: Tue, 20 Dec 2011 10:11:08 +0000
Message-ID: <1324375868.21032.1.camel@steve-pc>
References: <000301ccbef9$4a8dc180$dfa94480$@nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324375874;
	bh=faAQhRPkkV+09o75uWTke8VMQW3EJ35wV999dhInzwU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=NLzAZac+nLd+zLh9Vxn86RT9SmI47e+XlDVDea7yCxP+nOz0X3iFOfo5uhZPR7T4D
	 Dc/nvH/NIbPzg4YJbiSd68TEe/2ktFIl0wLibHQ+bsbCWOlQxLkjn6qJf/IOPKf3dH
	 K7TFMPe/4Wvq9FYOU9M7CrnTJxCnMx51Yg35gKRE=
In-Reply-To: <000301ccbef9$4a8dc180$dfa94480$@nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hansa <mythtv@logic-q.nl>
Cc: netfilter@vger.kernel.org

On Tue, 2011-12-20 at 10:25 +0100, Hansa wrote:
> Hi there,
> 
> Fedora is running a project called firewalld. Firewalld manages the firewall
> dynamically via D-BUS
> (http://fedoraproject.org/wiki/FirewallD/#Why_A_Firewall_Daemon). They say:
> "the current firewall model is static and **every** change requires a
> complete firewall restart. This includes also to unload the firewall
> netfilter kernel modules and to load the modules that are needed for the new
> configuration."
> 
> I would be very surprised if their claim is true. Because that would break
> statefull connections when changing the rules. I'm not familiar with the
> code so I can't comment on that. Hence my question. Is the current firewall
> model static?

I think that what they mean is that the current *Fedora* firewall model
is static. It looks like firewalld still uses iptables, but is slightly
more intelligent as to how it processes changes to rules and so on.

Andy


