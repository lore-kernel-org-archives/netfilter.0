From: Ludovico Cavedon <ludovico.cavedon@gmail.com>
Subject: Re: Need POSTROUTING traversed twice or at least later
Date: Sat, 31 Oct 2009 16:34:32 -0700
Message-ID: <4AECC988.4090607@gmail.com>
References: <4AECBC71.3050909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=DEkWgkLn3Gh5zR/5o6bU3PtNffSTWzeOAckDlceNc/8=;
        b=mJ4wVQKDZHfowpZTL4qnd2NBw5X1mq4JOhpq3S6tUWcxfxm8sUP6zfU3tuxrZQEA80
         DSIrnq6X80U7puQjWrEkmGZTmgxumi5u3dA1AU+R3EgjSVs/ShL0zhZU3tbPXHcpHqfw
         yoIty1CYXg3PNV1zojd9qq3u+kzxNgR/1I0eM=
In-Reply-To: <4AECBC71.3050909@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Ok,
I found an answer here:
http://marc.info/?l=linux-net&m=121250207920447&w=2

Ludovico Cavedon wrote:
> I am not even sure:
> -why does the packet goes thought ip netfilter when is traversing the
> bridge? I would expect it to be forwarded at link level from vif246.0 to
> brveth0. Than I would expect it to come out from eth0 and go thought
> netfilter.
> 
> Is there avoid to avoid the first evaluation of POSTROUTING, or at least
> have it evaluated also after forwarding from veth0 to eth0?

echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

fixes my problem.

Still, I am not sure why evaluating nat POSTROUTING is evaluated only
once...

Thanks,
Ludovico
