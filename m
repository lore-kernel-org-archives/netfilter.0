From: Olivier Nicole <olivier2553@gmail.com>
Subject: Re: Confusion about filtering traffic in a bridge scenario
Date: Wed, 11 Apr 2012 22:36:29 +0700
Message-ID: <CA+g+BvgspbpSvoOT7OyNjyQFf24NCZLwTnZrKbc7OGxmgATGow@mail.gmail.com>
References: <4F859C03.1080803@lebertbro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=d3ceo5K8LauZQ8xB1Wh90o4jKJOFes4XI3xQLi249bs=;
        b=XFteS80HB34s5KDeVvAyyY52BOq15betVrtBa58snwKfYDsXjGA4qTUvQZXuW8tArA
         16xuBXFnelWUv66SW+nmIwg7OjQ5bSXWlO9ja7Ng5urpGLZaeTXRrFZ2f9LSJW8eSeZT
         hmPY+K63sqCiyYzHzOpk5vBt2pSRe7MMISdwJ7HsEb/Rn1rvyM4FH1aitZ44taJbPtoN
         j4cg75GGfLT2K8GwaXWn1kybG4yTSfOXdnWy0szqm7aIUA2dRv8u4B7WbOtl6KS5YUsJ
         jumhRYJ2ZkWSW12NeeaguPMC6RMcSsM+ImWxQNp/e8sEAP95nEoQZJYIAgAv4cabGEPw
         c9wg==
In-Reply-To: <4F859C03.1080803@lebertbro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marc <ccc@lebertbro.com>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, Apr 11, 2012 at 9:58 PM, Marc <ccc@lebertbro.com> wrote:
> Hello,
>
> I was/am trying to setup packet filtering on a virtualisation host an=
d
> couldnt get it to work and was hoping for some pointers.
>
> Heres the setup:
>
> Said host has:
> eth0 - the physical interface, no address assigned
> br0 - the bridge interface, has IP 10.0.0.1 and gateway and default
> route assigned to it
> veth0 - the virtual interface for one of the VMs, has IP 192.168.0.1
>
> both eth0 and veth0 are added to the bridge, the networking setup is
> functional, however I seem to be unable to filter traffic to the VM w=
ith
> iptables. Heres what Ive tried:
>
> iptables -A FORWARD -m physdev --physdev-in eth0 --physdev-out veth0 =
=A0-p
> tcp --dport 22
>
> However, this only results in a /var/log/messages entry:
>
> kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
> POSTROUTING chains for non-bridged traffic is not supported anymore.

As this is bridged traffic, if the in interface is eth0, the out
interface can only be veth0, omit the -physdev-out that makes problem?

Olivier

> Since this _IS_ in fact bridged traffic, I dont see why I would get t=
his
> error?
>
> Maybe Im looking at it the completely wrong way and physdev isnt even
> the way to go here anymore, I dont know. Any kind of help is greatly
> appreciated.
>
> Oh, I figured I should add the following information:
>
> Kernel is Linux 2.6.32-11, running Debian stable (6.0.4)
>
> /etc/sysctl.conf contains these:
>
> net.ipv4.ip_forward=3D1
> net.ipv4.conf.all.rp_filter=3D1
> net.ipv4.icmp_echo_ignore_broadcasts=3D1
> net.ipv6.conf.all.proxy_ndp=3D1
> net.bridge.bridge-nf-call-arptables =3D 1
> net.bridge.bridge-nf-call-ip6tables =3D 1
> net.bridge.bridge-nf-call-iptables =3D 1
>
> iptables -I FORWARD -j REJECT -p tcp -i veth0 --dport 22
> didnt stop ssh from working either
>
> Regards, Marc
>
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
