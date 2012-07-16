From: Marco Padovan <evcz@evcz.tk>
Subject: Re: recent question
Date: Mon, 16 Jul 2012 15:25:45 +0200
Message-ID: <50041659.6090601@evcz.tk>
References: <20120716151223.e5eb4406717f6e0186d7ca7f@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=anzu/RIYOvhUIPZ87nG0MSaej3bZSBxDlwYgeeqsoh4=;
        b=W3pr+po0XYLPt41qEIPVWXTNqkE0u3aqy6D8AOPZlPqx/VBo6sn+niQmaHCSlp/1bo
         spA1MYrM9cWlfwr3G8nd5KYBeIgQyAbv9OY34p/GaDEMjeoybHzX72GBwmNYxgi0Hrzi
         NY5ibpjGs7RMDxQY4UnKmiwb+Uk5WESuyifnA=
In-Reply-To: <20120716151223.e5eb4406717f6e0186d7ca7f@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

on centos

rmmod xt_recent
modprobe xt_recent ip_list_tot=5000

will increase it to 5000 ;)

(to run rmmod you need to remove the rules using recent before proceeding)

Il 16/07/2012 15:12, richard lucassen ha scritto:
> Hello list,
>
> Here are two "recent" rules:
>
> /usr/sbin/iptables -A INPUT -p tcp --dport 25 -m recent \
>   --update --seconds 60 --hitcount 5 --name smtp -j LOG_REJECT
>
> /usr/sbin/iptables -A INPUT -p tcp --dport 25 -m recent --set \
>   --name smtp -j ACCEPT
>
> When telnetting for the first time to port 25, the source ip appears in
>
> /proc/net/xt_recent/smtp
>
> So far, so good. But there are 100 entries according to the manpage:
>
> $ wc -l /proc/net/xt_recent/smtp
> 100
>
> Correct. OTOH, I'm sure that within seconds the 100 entries will be
> exceeded, according to the number of connections set up to the smtp
> server:
>
> # tcpdump -ni eth0 \
>   'dst host 10.1.193.3 and tcp port 25 and tcp[13] == 2'
> (outputs a few per second)
>
> And according to /proc/net/ip_conntrack there are more than 100 entries
> to 25/tcp.
>
> Where are the entries 101 and higher in /proc/net/xt_recent/smtp?
> Are they ignored? Or is the oldest automagically purged?
>
> And when is an entry purged when the --reap is not used? Or does it
> behave like a round robin FIFO?
>
> R.
>


