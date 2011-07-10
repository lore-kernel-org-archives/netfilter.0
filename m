From: Andrew Beverley <andy@andybev.com>
Subject: Re: SYN, ACK, ACK PSH packets getting dropped (?)
Date: Sun, 10 Jul 2011 22:22:42 +0100
Message-ID: <1310332962.2603.12.camel@andybev>
References: <CAOdLEarz-mG6wKMnirJi07xJfW=5A3AZUAV+cwKdbs99K=+p-w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1310333222;
	bh=kMdXHWe8fTb8cmyAf2otn5FmJrqITaOlbfaRleWDd3U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=VaX0ijOrCe1xepPUxqCBBNwWnElY2kUJ2ue4iDF5GA5U2sNjQxyc9vVrXMT7QzEmS
	 5Flp/pAZwTzUvC+hlW3mQ198oSwApuFSxAMNZHcE6Om7hyN0aN7fwU1dUfwBqa26Nb
	 d5FrRxzAKGaWSHylJ3lOGpv5XDtAmAIbOmPYDeM4=
In-Reply-To: <CAOdLEarz-mG6wKMnirJi07xJfW=5A3AZUAV+cwKdbs99K=+p-w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Gandhi <samgandhi9@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-07-08 at 14:42 -0700, Sam Gandhi wrote:
> Hello,
> 
> I am trying to configure small industrial device that has one ethernet
> interface ("internal") and another WLAN interface.
> 
> I have attached below shell function I am using configure the iptables
> rule below. I have include a rule   $IPT -A OUTPUT  -j LOG
> --log-prefix "OU " at the bottom to log any packets that fall through
> the OUTPUT chain and log them. And I see following output, should be
> worried about this?

I suspect that they are packets related to NFS, in which case the answer
is yes, once you start dropping them.

>  How do I go about fixing this?  If anyone wants
> please do provide any suggestion on improving this iptable rule
> further. Basically what I want to do is  accept DNS, NTP, COPS traffic
> over wlan0 interface and also allow NFS booting device over eth0.

NFS is a complicated protocol, and I personally have never been able to
get it properly filtered by iptables. So, unless you are paranoid about
your users on the internal network, I would just accept all INPUT
packets on eth0, and concentrate your filtering on the WLAN interface
(presumably the public facing side?)

You might also want to check this out to help with NFS:

http://www.cyberciti.biz/faq/centos-fedora-rhel-iptables-open-nfs-server-ports/

Andy


