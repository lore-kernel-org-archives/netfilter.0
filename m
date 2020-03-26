From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | flow table] check whether it works?
Date: Thu, 26 Mar 2020 10:41:54 +0000
Message-ID: <11318388-ba1c-c130-88eb-2f9c15f70c34@gmx.net>
References: <41317d5f-a0b4-da4e-356b-45cf7677cf15@gmx.net>
 <a549d215-7aa6-bc66-d004-a3b504bf2e17@gmx.net>
 <20200326102250.ccefwkbojzesmz24@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585219326;
        bh=phSChlH95OrcZib8R1mIepYg9LLBEbgntzDezPvAFsk=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=gZo6VlwAB118rhCZTVXXt3MiuEWbUxKjNTz452hdJmSKxdBbElsh0Gv/7TWdjnVyD
         9oap/d5/ZbBvdjzzbgZzrBZkQ3zapCBJW977drQa8/j6vGFpVq1pOj8RCUWPqO8O/V
         R8JUVcSchR40SbUl0oOGuyA7T508fhD8YhXm+Soo=
In-Reply-To: <20200326102250.ccefwkbojzesmz24@salvia>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 26/03/2020 10:22, Pablo Neira Ayuso wrote:
> On Thu, Mar 26, 2020 at 07:17:12AM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> On 22/03/2020 14:18, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>> How it is possible to check whether flowtable offloading actually work=
s?
>>>
>>> Can the populated flowtables somehow be dumped / observed / monitored?
>>>
>>> If not mistaken the conntrack table would exhibit the [OFFLOAD] label
>>> but observing the conntack table it does not show such label.
>>>
>>> Reading https://lwn.net/Articles/738214/:
>>>
>>>> Patch 5/5 Switches and NICs come with built-in flow table, I've been
>>>>  =C2=A0=C2=A0 observing out of tree patches in OpenWRT/LEDE to integr=
ate this into
>>>>  =C2=A0=C2=A0 Netfilter for a little while. This patch adds the ndo h=
ooks to
>>>>  =C2=A0=C2=A0 populate hardware flow table.
>>> This node running OpenWrt with Marvell Armada 385 88F6820 (that
>>> supposedly features Accelerated Data Path) with integrated NIC plus an
>>> onboard Marvell 88E6176 switch, latter driven by DSA, I am wondering
>>> whether flowtables offloading is even expected to work in such setup?
>>>
>> There is no way to see/check whether flowtable offloading actually
>> works, or how to debug it?
> As of Linux kernel 5.5, there are two ways:
>
> * Check if [OFFLOAD] flag is shown, e.g.
>
> # conntrack -L
> tcp      6 src=3D192.168.10.2 dst=3D10.0.1.2 sport=3D47046 dport=3D5201 =
src=3D10.0.1.2 dst=3D10.0.1.1 sport=3D5201 dport=3D47046 [OFFLOAD] mark=3D=
0 secctx=3Dnull use=3D2
> tcp      6 src=3D192.168.10.2 dst=3D10.0.1.2 sport=3D47044 dport=3D5201 =
src=3D10.0.1.2 dst=3D10.0.1.1 sport=3D5201 dport=3D47044 [OFFLOAD] mark=3D=
0 secctx=3Dnull use=3D2
> conntrack v1.4.5 (conntrack-tools): 2 flow entries have been shown.
>
> (you need current conntrack-tools git snapshot, this will be available
> starting conntrack-tools >=3D 1.4.6).
>
> * You can add a
>
> table ip filter {
>      flowtable f {
>          hook ingress priority filter
>          devices =3D { eth0, eth1 }
>      }
>
>      chain forward {
>          type filter hook forward priority filter; policy accept;
>          ip protocol tcp flow add @f counter log prefix "offload: " acce=
pt
>          counter
>      }
> }
>
> You can either turn on logging after the 'flow add @f' statement for
> matching packets that correspond to flows that are being offloaded.
>
> If the flow is offloaded, the counter catch-all rule at the end of
> forward should not be updated, as the packets will not follow the
> classic forwarding path [1].
>
> I'm also preparing a patchset to allow to turn on counters optionally,
> so users observe that flows that have the [OFFLOAD] tag get their
> counters updated.
>
> [1] https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt

Thank you for the feedback/input.

The problem is that features, depended on certain kernel versions, are
not necessarily being backported to other LTS kernel branches and thus
not making way to downstream distros (unless maintainers make the effort
to cherry-pick and uplift commits from upstream), in this case OpenWrt.
Latter is currently deploying kernel 4.14 in the most recent stable
branch, 4.19 in the Master (development) branch and slowly transitioning
there to 5.4. Thus it will be ages (months to years) until certain
features (e.g. from 5.5) make it there.

Self cross compiling kernel / userland for SoC devices (e.g. CPE / SOHO
routers) is not easy (involving u-boot, device tree and stuff) and not
common/suitable for (most) every user.
