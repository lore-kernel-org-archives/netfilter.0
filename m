From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 23:38:47 +0100
Message-ID: <4C9933F7.4050802@googlemail.com>
References: <4C9696E5.4030803@googlemail.com>	<alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>	<4C973A6A.9010809@googlemail.com>	<alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>	<4C9756AB.5040304@googlemail.com>	<4C97D6D6.9040805@shorewall.net>	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>	<4C988214.6050600@googlemail.com>	<4C9911CE.6090209@googlemail.com>	<AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=FQey0zSXBcK3iSF0ypE1DIURvDHlFn7C1upwFf/BUnQ=;
        b=Q7CmCxnCiyI/1x+AHS30SZQYCgMkTtUkMDeLywEMKGad2qguWuMBbhJoX1TnDjF9dS
         J4IaM+wbkEw9EMvkH/O1VYl6iCkGcEr/y5sIMDpYK9HQw21GjM9ASvEBh6B39pWdEntK
         dGajHvJaKVXgQJaH/H523dTHhCD+VArBX81bM=
In-Reply-To: <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Paris <eparis@parisplace.org>
Cc: netfilter@vger.kernel.org


> My current patch looks like so:
>
> cat /proc/net/nfs_conntrack
>
> ipv4     2 udp      17 8 src=10.11.231.82 dst=10.11.255.156
> sport=34095 dport=53 src=10.11.255.156 dst=10.11.231.82 sport=53
> dport=34095 mark=0 secmark=system_u:object_r:unlabeled_t:s0 use=2
>   
Bravo! It even says 'unlabeled' (wrong spelling you see, though I know 
that is not your fault, relax - I won't blame you for that). I assume 
that meaningless secmark number was 0, is that correct?

> It appears that we send this information up some netlink socket in
> nf_conntrack_netlink.c.  I'm not sure what is consuming this data so
> I'm not sure how to test.  Anyone have any pointers?  I'm also worried
> what such a change will do to users of this interface....
>   
My guess would be that whoever needed it would have been using the 
kernel functions to do anything meaningful with it, unless, of course, a 
simple check for does it/does it not have SELinux context defined (i.e. 
secmark<>0).

