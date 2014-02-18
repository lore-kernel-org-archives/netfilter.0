From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 20:57:05 +0100
Message-ID: <CAOA3yKL0AaWeg2OEoyjHRZh1padj47byxkrJaTM4vwp1iPL8VQ@mail.gmail.com>
References: <loom.20140218T183628-993@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=5699YQkl5c07M5vHo9RawS1FcPU2+2QB1ttXmccWQWg=;
        b=DVuNyH6bH5z0pSs8N+I4L4f5bgYNYtRniSP+zy2HkLXbiXgt0Me1UbJiaWE5/owAEm
         l7iOOESxNKWsOm96u0u0Wot0u1JjoIu36/egNqAhKLSXADKDTdGiQZnquMoY5hhcmPvq
         Xe1/umYhkApkRNOEqN2dojt44kBWGFEQ83Joy+tgKZKuUxMrGM106jP6gIg8CFXob4sB
         C/me5365r24UB+MNC+Ws5p/56D43LwoJjENDoqw8NJgbOzOno3r9CF+IwRPuIxgcsfj1
         RQoSPhiYlNlFZPmRZ/JWOJrskmxgphrGNO1MEScsJ2EfTK7y0D9zB+ZWW8w5rC6H9UYJ
         AJyQ==
In-Reply-To: <loom.20140218T183628-993@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

It's worth pointing out that packets coming in from interface A with
the destination address equal to the local address of interface B will
be considered INPUT, not FORWARD. So, even if you have drop packets in
FORWARD, binding a service to a specific interface address, as a
security measure, does not actually make it reachable only via that
interface. You'd need to explicitly drop those packets in INPUT to
protect the service.

On Tue, Feb 18, 2014 at 6:53 PM, Mark Fox <mark.fox@gmail.com> wrote:
> I've been waffling over a permissive or restrictive FORWARD chain and have
> realized that my understanding of the implications is lacking. So I'll just
> ask: What are the implications of a permissive FORWARD chain?
>
> My situation is that I am deploying a virtualization/containerization host
> at a facility that has one big network for everything (servers, desktop
> workstations, etc.). There is no DMZ. As one would expect, the network is
> really chatty.
>
> Traffic has to be forwarded to/from the VM/container host to/from the VMs or
> containers, so a DROP policy on the FORWARD chain means carefully crafting
> rules to allow traffic to be forwarded to the VMs/containers. I have no
> issues with that, but it does mean that the future users of the VM/container
> host would have to craft their own rules when they add new VMs/containers.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
