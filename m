From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: Re: Iptables and Kernel
Date: Mon, 19 Apr 2004 10:11:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4083EC19.6010901@netfids.com>
References: <407A27B2.4000101@rd.arkonnetworks.com> <36070.9628942006$1081802745@news.gmane.org> <408356CA.4030604@rd.arkonnetworks.com> <200404190848.14662.Alistair@nerdnet.ca> <4083E8FC.8070008@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4083E8FC.8070008@rd.arkonnetworks.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Cc: netfilter@lists.netfilter.org



Norman Zhang escribi=F3:

>>>> I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- th=
ey
>>>> work for me -- but I'm referring to a home lan ond only one netmeeti=
ng
>>>> seesioon from the LAN  -- we haven't tried multiple sessions from=20
>>>> inside
>>>> the lan ... either to the same netmeeting sessioon or to different=20
>>>> ones.
>>>
>>>
>>> Sorry it is me again. I tried to compile pomng using
>>>
>>> # KERNEL_DIR=3D/usr/src/linux ./runme pending
>>> # KERNEL_DIR=3D/usr/src/linux ./runme base
>>> # KERNEL_DIR=3D/usr/src/linux ./runme extend
>>>
>>> but couldn't find h323-conntrack-nat patch being offered. I did see
>>> owner-socketlookup mention something about H.323. May I ask how do I
>>> applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? =
I
>>> can see the subfolder h323-conntrack-nat under pomng.
>>
>>
>>     Okay -- I'm a twit --- I'd assumed since my loadup script was=20
>> completed without errors that things had worked all the way through=20
>> ... looking again it seems that the h323 stuff only applies against=20
>> 2.4.x kernels -- Joseph K.
>> hasn't ported it -- likely because its slightly hackish .. And Lord=20
>> KNOWS why
>> netmeeting is working through my firewall ... other than the fact of=20
>> a good old ESTABLISHED RELATED rule ... I do know that it only works=20
>> outbound, if someone wants to call into the LAN they have to call on=20
>> a specific port and I have that port forwarded to the destination host.
>
>
> I'm now using kernel 2.4.26. Now when I run
>
> # KERNEL_DIR=3D/usr/src/linux ./runme extra
>
> I do see h323-conntrack-nat patch. When I do a 'make xconfig' for the=20
> kernel source, under Networking/Netfilter... I can't find the H.323=20
> option. But other options like ECN, ..., etc. are available. Is this=20
> correct?
>
> Regards,
> Norman
>
>
>

Hi have the same problem, but with 2.4.25

Regards,
Geffrey



