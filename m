From: zrm <zrm@trustiosity.com>
Subject: Re: dnat port range to single port, udp, between two local machines
 on a LAN
Date: Tue, 31 Jan 2017 21:11:10 -0500
Message-ID: <389884c5-65eb-aab3-15ad-dcc0f6249aef@trustiosity.com>
References: <CAM9he-WxJmUh53geOrRDAXuGCHQ7AxQ=0i7PgvVWxtNPryA_bg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1485915060; bh=hkIf0DsdNiMrgGeleG8ErmdgVOSwecansWKUwd9BxaA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=lY2Lj9ANE2sheDvrJBYJAVjmsq/Uuglm7hnkf8mb8lIdWs29qst/tQysIAmBPRpTZ
         zNjBhfy0fd79aWDu4Dgb1K39icC9Rkat48Vv1VSny3vsW8jOSw+5gbsNmEmUrrAwEr
         PEJ9A8ffrREwR49kcRadGCstiIayCcaT1YMJPDTU=
In-Reply-To: <CAM9he-WxJmUh53geOrRDAXuGCHQ7AxQ=0i7PgvVWxtNPryA_bg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Brian Bostwick <bostwick.brian@gmail.com>, netfilter@vger.kernel.org

On 01/31/2017 11:28 AM, Brian Bostwick wrote:
> Hi, I am running DD WRT and trying to use iptables to change the
> destination port based on a port range used by the source connection.
> I am not very well versed with this tool, but have had success doing
> similar things, but not using a port range and over TCP.
>
> I am using two rules, after scourging the internet for help. The
> answer I found says that I can do DNAT in the PREROUTING, but I have
> to have an SNAT rule in the POSTROUTING back to the source IP.
>
> Here are my two rules:
>
> iptables -t nat -A PREROUTING -p udp --dport 45000:65000 -j DNAT
> --to-destination 192.168.1.131:5000
>
> iptables -t nat -A POSTROUTING -p udp -d 192.168.1.131 --dport
> 45000:65000 -j SNAT --to-source 192.168.1.122
>
> I don't think the second one makes sense, because I believe I would
> need to specify the exact destination port (original source port),
> which I do not have because it is a rule based off a range.
>
> In Wireshark, I see no change:
>
> 142243 1078.651017 192.168.1.122 192.168.1.131 UDP 144 9296 =E2=86=92 559=
00 Len=3D102
>
> I hopes this makes sense. Basically, I would like to change the
> destination port going from A to B, where the originating packet will
> be on a port range and UDP. Is this possible between two local
> machines behind the same router?
>
> Thanks!

It sounds like what you are trying to do is many:one hairpin NAT between=20
two machines on the same subnet, which is Very Ugly. To actually do it=20
on the router, you would need something like this (not tested):

iptables -t nat -A PREROUTING -d 192.168.1.1 --dport 45000:65000 -j DNAT=20
--to-destination 192.168.1.131:5000
iptables -t nat -A POSTROUTING -d 192.168.1.131 --dport 5000 -j SNAT=20
--to=3Dsource 192.168.1.1

Then when 192.168.1.122 wants to communicate with 192.168.1.131, it has=20
to use the address 192.168.1.1 (the address of the router) instead. If=20
it uses the address of the actual destination, its operating system=20
knows that address is on the same subnet and sends the packets directly=20
to the MAC of the destination instead of to the router.

If "192.168.1.131" is a Linux device it would be better to just add this=20
rule to that device directly:

iptables -t nat -A INPUT -p udp --dport 45000-65000 -j REDIRECT=20
--to-ports 5000

Other operating systems probably have something equivalent.
