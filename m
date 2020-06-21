From: Alex Buie <alex.buie@datto.com>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Sat, 20 Jun 2020 22:31:07 -0400
Message-ID: <CANGix0A5Wq-GmbfgfGVpd4vo9PczshSMPw7jVkKyQWprgiSrWw@mail.gmail.com>
References: <e8de3662-249c-598b-cd0d-e97ccc500449@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datto.com;
        s=mimecast20190208; t=1592706681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=unTnhCKrRRC1r8O3S7veVs+GBTEDD1LHCq1a1RpSBfo=;
        b=QIADuZr7pZ4eL4MoOKYYSwtu7bHWqvemSO3M7VbKChSKJCqhhCgkGDjaJVhfzQKXOpTpfw
        j2VBnrGeXHCDXbHBXsgVY66qmrKkk6hbcr2y2B+hnB48JF4J4WPwu5asMU4MN/uFnL7mZP
        eyo2pfYBm4tfgwi3S6LmKkuXQvcwcrI=
In-Reply-To: <e8de3662-249c-598b-cd0d-e97ccc500449@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

You -might- need to fiddle with the nf-call-iptables sysctls for those
firewall rules to work. I haven't personally tried this for a wifi
adapter in infrastructure mode (only wired bridges) but it might
help/apply to your setup.

See https://wiki.libvirt.org/page/Net.bridge.bridge-nf-call_and_sysctl.conf
for some info.


R's,

Alex

On Mon, Jun 15, 2020, 11:38 PM Hooman <mailinglister.hooman@gmail.com> wrot=
e:
>
> Hi,
>
> I am using WiFi hotspot feature of Ubuntu 18.04 to create a hotspot for
> my devices. I need to prevent different devices on the network from
> contacting each other.
>
> More specifically, I have two phones on the network, I would like them
> not to be able to send any packets to each other. Right now if phone 1
> is using IP address 10.42.0.172 and phone 2 is using 10.42.0.59, I can
> use phone 1 to ping 10.42.0.59.
>
> I would like to disable connections between different hosts on the
> network created by the hotspot.
>
> I tried using iptables to drop local traffic. However, it seems like the
> iptables don't have any effect on these packets.
>
> I do see local packets on wireshark though. I'm wondering if local
> packets are forwarded directly without hitting the iptable rules.
>
> Is it possible to use iptables or ebtables to filter these packets? Is
> there any other solution to this?
>
> Thank you
>

