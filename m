From: Jared <list-virt@legroom.net>
Subject: Re: enabling firewalling of bridged interfaces
Date: Sun, 22 Jul 2012 17:38:19 -0500
Message-ID: <500C80DB.60105@legroom.net>
References: <500C6F6B.7090908@legroom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=legroom.net;
	s=legroom; t=1342996697;
	bh=PoOoodqNNrie9Ep0Wg5W67SttTDFGI3FCWUHPvl3lME=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=eV2OFD8ypdSJ6FftcVO1z/vQjLSKSy+X2fX9KE0V4qhogkbL8h8waRmwoTbFOeNT5
	 N+DHJrmuAc4a4eBU3Rf8WS4RAWJpdYeAyiWtT962HvFgO11fkFGNpDqVcJDEfEYaZG
	 9Mz2U44BHRvhhc7GCcx/kdc6FvAAR7IXHbwFAW6g=
In-Reply-To: <500C6F6B.7090908@legroom.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 07/22/2012 04:23 PM, Jared wrote:
> What do I need to do to enable iptables support for bridged interfaces?  I'm
> setting up a Gentoo/KVM VM host, and iptables will handle all traffic
> to/from the host system, but not any of the guests.  I seem to be missing
> some key kernel config option for this (specifically, whatever provides
> net.bridge.bridge-nf-call-iptables), but can't figure out what (more details
> below).  Is there a specific list of options I should enable, or perhaps a
> reference guide for this somewhere?

Well, nevermind.  Rebooting fixed the problem.  I was certain I had already
configured all of the necessary bridging settings before my last reboot, so
I didn't bother trying that before sending this e-mail.  After wasting
another hour and still having no luck, though, I figured what the hell...
and sure enough it worked.

So, I'm good now.  Sorry for the noise.  :-)

-- 
Jared
