From: Mallika Gautam <mallika.gautam@gmail.com>
Subject: Re: ipt ROUTE extension
Date: Fri, 16 Oct 2009 14:43:57 +0100
Message-ID: <9041a1390910160643j79c4513bx998d73691ce5d66f@mail.gmail.com>
References: <9041a1390910141008v26bb354idfcffb173ac87110@mail.gmail.com> 
	<4AD642C3.2070900@gmail.com> <9041a1390910150206x1a715060j4b017bc43669cf05@mail.gmail.com> 
	<4AD6ECEB.20505@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type;
        bh=AZPR6nkB0CBbMryTN2G6cNpKPZwm+1FgA4Qv8L4yIRk=;
        b=kgZHfhS1oCuRkLBwDw5D2ktYJzisWU8eh/v3EnnPEHCm+CxTTGcqZ293eAs50b5lu4
         pAu6MYaqvUGCRM2xFq9F4yngMmhYiwf+CFykeW8+LU1pyAMVD9/OIPZX0bS+fSst0lQL
         jxPb9bfgqN6/9wEi6cqig8Ei0Oxt78hH+wZuw=
In-Reply-To: <4AD6ECEB.20505@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saikiran Madugula <hummerbliss@gmail.com>
Cc: netfilter@vger.kernel.org

>
> http://www.gossamer-threads.com/lists/iptables/devel/68870.
>

Hi ,

Thanks for the link. I did find the ROUTE target but it was not
supported for 2.6.20. So, I am now trying to use MARK target instead.

Can you please also help me with the error that I am getting with ebtables.

ebtables -t nat -A OUTPUT -p arp --arp-ip-src 172.17.117.25

The above call is failing in ebt_arp_check
(linux-2.6.20/net/bridge/netfilter/ebt_arp.c
        if (datalen != EBT_ALIGN(sizeof(struct ebt_arp_info)))
                return -EINVAL;

I am not sure I know about this align stuff here. Could you please
point me to the problem. I am using ebtables v2.0.9-1 (June 2009) and
kernel 2.6.20.

Thanks again.
Regards
