From: hannah commodore <teargas@gmail.com>
Subject: Re: Confusion about filtering traffic in a bridge scenario
Date: Fri, 13 Apr 2012 16:06:17 +1000
Message-ID: <CAHaYD9jLFw0Xfc3ytM9FLVPe4c_SzKAnaHdy8de1_AD85Sxx7g@mail.gmail.com>
References: <4F859C03.1080803@lebertbro.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=TbMZmxTanPrlsVMGTySedx/4dIdngjJhshNhckrOuZc=;
        b=KX+gH+Ip/PtaT3whsc2vjObstSVDYJTCHp6WyUGktdiuqORz9ZaFxRCniQAQwxYhSK
         ru0fw9ZV6lxMDDhb5ljIDYX02d5pZl89nnPmWLsA/1Ljj3apjREJepp6C4hlXtyNgPKu
         Yqj0cMYXcDEbwvFdkiaKxGJOiQkmuHVRao/XrjlP0ro/Ua4L6xQu76qh7j6HhCJ6WO9H
         LnHvlcow8WqsrmIPVbD0kj2xpZ5HYepbsD50OlQHApaC98bGrZd9S+aeLweQ1wmBO+xh
         Ahhba62qKIiyF3b02FlfZ8QDkyV73RVkIb3BG1j2r/n6XA4wU1aYmzAeTVfMX0IyjQWi
         zRew==
In-Reply-To: <4F859C03.1080803@lebertbro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, Marc <ccc@lebertbro.com>

On Thu, Apr 12, 2012 at 00:58, Marc <ccc@lebertbro.com> wrote:
> I was/am trying to setup packet filtering on a virtualisation host and
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
> functional, however I seem to be unable to filter traffic to the VM with
> iptables

do you use /etc/network/interfaces to create the bridge interface?

I've noticed in Debian that sysctl.conf is applied before the
if-up.d/bridge script has a chance to load the bridge module. as a
result, the sysctl for net.bridge remain the default.
i needed to add a post-up to my config to overcome this

what is the current setting of net.bridge.bridge-nf-call-iptables?

does re-applying sysctl.conf allow iptables to then pick up bridged
traffic (sysctl -p)?
