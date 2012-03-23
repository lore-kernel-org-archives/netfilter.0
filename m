From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Bridge IPv6 traffic between 2 interfaces
Date: Fri, 23 Mar 2012 07:31:28 -0400
Message-ID: <CACuyg25Fm7oD20W4Ss2RGgnDvy6gb=iS5vBpxPHM5FJfCOmAPw@mail.gmail.com>
References: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4636@GSX300A.mxchg.m.corp>
	<CACuyg24rGyYX9bWO21Fbo2HMHtBwwLJQEehq1j1AoNKoew5_3A@mail.gmail.com>
	<CACuyg24PnPZVrffq+VSvT=oA0RM-TjMD3MUV2Zj5zAw9GtVnmA@mail.gmail.com>
	<BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4873@GSX300A.mxchg.m.corp>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=IsIuteNnv/v9dGcskTgKiIG5+ht2BzaddIz0+UnV6s4=;
        b=T/5bSIwAjTCzPtrxG0GvcB+4HSM4rN4ObnOQJgoXxvAEqAc41JT/Bt3x6srRZzbPQ4
         pyOdCs6Yt+k+v64d3KN5ftUXREcsNhZhSy7vWhM5gpp3fipzhkD/L2yjfujbRxR7P706
         qiUmBkhW8jsACr0WFzy/Xoq6Oja9PYZQOt0OH4qzG1fYwADhrmVRKHE5pDqvU+GmkEeq
         p4YLL0uWFCqeU/kMvUz25IFQFFbK7JAAMZX+whZBP8C59hQXMe8pSV+8RR6kwFnIExcu
         Y0RwtrYXtUAI7wDZRQ9v2j1L++MDbtAAYDrBbBqCquUagf/qpzuwNwIXUv1ofNqAGtzE
         tAQg==
In-Reply-To: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4873@GSX300A.mxchg.m.corp>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Huebner, Thomas" <thomas.huebner@cassidian.com>
Cc: netfilter@vger.kernel.org

Hi,

According to what you wrote I imagine that the control over the bridge
you alread have.
The filter made =E2=80=8B=E2=80=8Bwith ebtables only affects the traffi=
c crossing the
bridge (your filter in BROUTING).

=46or IPv4 traffic you must configure the firewall as if it were a
simple firewall/router - if you have'nt done the bridge filters.
- Make sure the routing is active in /proc/sys/net/ipv4/ip_forward (set=
ting 1).
- Check the routing table on both sides (networks). If each network
knows the routing path to another?
- Check the filters in the FORWARD chain.
- If you refer to the output as internet access, then confirm your NAT
rules (SNAT or MASQUERADE).

One way to quickly verify if the problem is with your firewall rules
(in memory - only for tests):
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -I POSTROUTING -j MASQUERADE
iptables -I FORWARD -j ACCEPT

By this way you will NAT and will accept anything that goes through
the firewall. Of course you should not leave it, but it is a way to
quickly verify if the problem is with your rules.

Start without NAT.

You can use tcpdump to help you too:
- using a shell session
tcpdump -i <if_in> icmp -n

- using a another shell session
tcpdump -i <if_out> icmp -n

So you can see what goes in and out of each interface.
If it is too polluted, you can concatenate the host address in pcap fil=
ter:
tcpdump-i icmp and host <if> <target>

I hope this helps



Em 23 de mar=C3=A7o de 2012 02:58, Huebner, Thomas
<thomas.huebner@cassidian.com> escreveu:
> Hi,
>
> thanks for you'r quick response. I needed some time to fix and extend=
 the kernel with ebt_broute. I'm using openembedded and all that bitbak=
e stuff needs time...
> Finaly i've integrated ebtables and the necessary kernel modules.
>
> I assume that the preceding setup looks some thing like this (?):
>
> # brctl addbr br0
> # brctl addif br0 usb0
> # brctl addif br0 usb1
> # ifconfig br0 0.0.0.0 up
>
> followed by:
> # ebtables -t broute -A BROUTING -p ipv4 -j DROP
>
> After that a can no longer ping (ipv4) the box from outside.
>
>
> Am I missing something, May be some sysctl's?
>
> Regards,
>
> Thomas
>
