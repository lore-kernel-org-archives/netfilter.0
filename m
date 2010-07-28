From: Payam Chychi <pchychi@gmail.com>
Subject: Re: How Expensive?
Date: Tue, 27 Jul 2010 18:17:36 -0700
Message-ID: <B163F0EB-13C5-4804-95D2-31224AFC296C@gmail.com>
References: <4C4F7893.9020900@abpni.co.uk>
Mime-Version: 1.0 (iPhone Mail 8A293)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:references:in-reply-to
         :mime-version:content-transfer-encoding:content-type:message-id:cc
         :x-mailer:from:subject:date:to;
        bh=T1ztubDjDNXkgjHPN7T1eZF6S+erlOTFrFSPe8zbCFI=;
        b=jFQab8Va+m0wisVr93UVMpCXi0KxNmCzjQSXuYBrGeZdJqPO5QKBUjucYdM3uyE+ZJ
         vzlMeuBjKzkDsQvbkM8HHyCw91iqLIe+C9HsXsadDwdPyO93uuMDn9ey0TgJANCK+/L8
         4tZVWTq1eO7U2ckUm4dp4gr7IuwE4A+hT41D0=
In-Reply-To: <4C4F7893.9020900@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

it's much less and actually recommended than running all rules in default/less chains as each pkt must traverse the entire chain to be processed

Regards,
--
Payam Tarverdyan Chychi
Network Engineer

Sent from my iPhone

On 2010-07-27, at 5:23 PM, Jonathan Tripathy <jonnyt@abpni.co.uk> wrote:

> Hi Everyone,
> 
> I wish to use iptables on a host that will be hosting a large number of VMs for customers. IPtables will do some basic "managed firewalling" for them.
> 
> My question is, how expensive are having lots of custom chains? My idea is to create one child chain per VM, with the idea to cut down the amount of rules evaluated (i.e. a parent chain would only jump to a child chain if the dest IP matches) - does this sound like a good idea?
> 
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
