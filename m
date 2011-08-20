From: "Carlos A. Carnero Delgado" <carloscarnero@gmail.com>
Subject: Re: Please help me with a doubt about options '-i' and '-o'
Date: Sat, 20 Aug 2011 13:01:55 -0400
Message-ID: <CAPjvz2mC8oHsC9tRKV_6yUxSuaMadtmJw7VTa9=TA96b-C1r2A@mail.gmail.com>
References: <6DEA16417ACA45DF9BB7F9BD28454269@poweredge1800>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=2WHyMKzfW3aiFtav0Kp5JlBN7k8nTwOJRFI1Q2tFHTg=;
        b=DTJ95Uo9Ao8/5eYYuf0azb4SeksMG/y6n/y2K+9vTtg/oxJG+/Gc3CYyuFMG54P9Di
         M+i89RR3FhLKuHYF4RF2q/uISamfR661gSdoFPN+ucf7SW1lJ8ntpm7CQFu3+sGBeNUs
         FOpto+HpqRk4DQKoZcaIx53vEOSzhxW8LIdCs=
In-Reply-To: <6DEA16417ACA45DF9BB7F9BD28454269@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, Aug 19, 2011 at 9:43 PM, Julio A. Romero <julioarr@fisica.uh.cu> wrote:
> When I do a ping from 192.168.2.200 to 192.168.1.1, this classifies as INPUT
> and the answer as OUTPUT, or not?

Yes.

> In this case, what interface (eth1 or eth2) could be referring with the
> options '-i' and '-o'?
>
> iptables -A INPUT -p icmp -m icmp --icmp-type echo-request -i eth? -s
> 192.168.2.200 -d 192.168.1.1 -j ACCEPT
>
> iptables -A OUTPUT -p icmp -m icmp --icmp-type echo-reply -o eth? -s
> 192.168.1.1 -d 192.168.2.200 -j ACCEPT

IIRC when selecting (matching) ICMP the further match options are
implicit. That means -- I think -- that you don't need the -m icmp.
Further, since by default Linux uses a weak host model, you are
correctly using the INPUT chain and not the FORWARD chain, so there
are some superfluous matches above. I'd rewrite those rules as

iptables -A INPUT -p icmp --icmp-type echo-request -i eth2 -s
192.168.2.200 -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -o eth2 -d
192.168.2.200 -j ACCEPT

When building iptables rulesets from scratch I always use the LOG
target, which sends to the syslog what's going on Netfilter at the
point of the rule. Excellent troubleshooting hook. Also, iptables -L
-v is your friend.

HTH,
Carlos.
