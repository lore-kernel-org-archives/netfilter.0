From: =?GB2312?B?p7On0afep+Wn46fWp9+n3KfgIKehp9+n1afip9an2w==?= 
	<samusenko@msm.ru>
Subject: Re: Trying to add RTP proxy extension
Date: Tue, 23 Jun 2009 17:55:28 +0400
Message-ID: <4A40DED0.9040305@msm.ru>
References: <145d4e1a0906230403td01d6d8s2541d99ca07e9c6@mail.gmail.com>	 <4A40C7DE.4090309@msm.ru>	 <145d4e1a0906230527w42aec1b1mcbb0362195f36b54@mail.gmail.com>	 <4A40CE94.8010805@msm.ru> <145d4e1a0906230605kf51b6d3kc73bfe46932b8526@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0906230605kf51b6d3kc73bfe46932b8526@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: javier.galvez@entel.upc.edu
Cc: netfilter@vger.kernel.org

=2E/configure place in iptables source directory. He make Makefile. The=
n
=2E/runme fail on download or other.
I newby in SIP, therefore not whole understand you problem.

Javier G=A8=A2lvez Guerrero wrote:
> 2009/6/23 =A7=B3=A7=D1=A7=DE=A7=E5=A7=E3=A7=D6=A7=DF=A7=DC=A7=E0 =A7=A1=
=A7=DF=A7=D5=A7=E2=A7=D6=A7=DB <samusenko@msm.ru>:
>  =20
>> What you made with font? =3D)
>>
>>    =20
>
> I think I just quoted you. Seems that you received a smaller version
> of my reply xD.
>
>  =20
>> You need run ./configure or something like to get Makefile. But ./ru=
nme not
>> true way, i think =3D)
>>
>>    =20
>
> I could run a configure file if it existed in the patch-o-matic
> directory but that's not the case. I can't see the way to have the RT=
P
> proxy extension installed; no installation script or file nor I can
> get p-o-m working or guessing how to do it with Xtables.
>
>  =20
>> http://www.iptel.org/sipalg and netfilter.org of course.
>>
>>    =20
>
> In Netfilter's site I found nothing related to this extension. I had
> already visited the first link, but there's only introducing how to
> install the modules (as I have kernel 2.6.18 they are built-in
> modules, son modprobing them suffices). What I would like to know is
> what really does this extension. I mean, does it mangle SDP files
> changing m=3D, o=3D, c=3D headers or SIP files with Via, From, To hea=
ders?
> With the information included on this site I can only guess that,
> whatever it does, it just does specifying some basic NAT rules. Maybe
> these NAT rules are tracked by the SIP extension so the SDP/SIP
> messages are mangled accordingly?
>
> As soon as I knew what these extensions do I will be able to know if
> these are enough or I need RTP proxy.
>
> I need to perform a VoIP (SIP/RTP) client handover between two WiFi
> networks, so, as soon as I have the new interface attached and
> configured to the new network (different from the old one), I issue a
> reINVITE SIP message and I would like to know if I can manage this
> reINVITE message in order to continue the VoIP session through the ne=
w
> network. That's it.
>
>
> Any suggestion?
>
> Thanks for your time and effort. It is much appreciated.
> Javi
>
>
>  =20
>> Javier G=A8=A2lvez Guerrero wrote:
>>
>> Hi,
>>
>> 2009/6/23 =A7=B3=A7=D1=A7=DE=A7=E5=A7=E3=A7=D6=A7=DF=A7=DC=A7=E0 =A7=
=A1=A7=DF=A7=D5=A7=E2=A7=D6=A7=DB <samusenko@msm.ru>:
>>
>>
>> Hi.
>> For ./runme need Makefile in iptables directory. But anyone pom not =
working.
>> Better way to use kernel source.
>>
>>
>>
>> Could you please elaborate a little more on this? What do you mean?
>> What do I need to do?
>>
>>
>>
>> Why you not use nf_conntrack_sip / nf_nat_sip?
>> I am not understand why need xt_RTPPROXY.
>>
>>
>>
>> I'm not using nf_conntrack_sip / nf_nat_sip because I don't know the=
m
>> =3D). I'll take a look at them. Anyway, do you know where can I get =
some
>> info/tutorial about these extensions?
>>
>>
>> Thanks a lot,
>> Javi
>>
>>
>> Javier G=A8=A2lvez Guerrero wrote:
>>
>>
>> Hi all,
>>
>> I'm trying to add the Netfilter RTP proxy extension provided here:
>> http://www.2p.cz/en/netfilter_rtp_proxy. As install notes say, it mu=
st
>> be done with p-o-m, but I have a problem when running ./runme: the
>> iptables source directory is not accepted. I've seen many questions =
on
>> the web regarding this issue but I got no solution at all.
>>
>> However, AFAIK, p-o-m is 'deprecated' and Xtables-addons should be
>> used instead of it. Anyway, I don't know how to 'port' the
>> installation from p-o-m to xtables-addons as the files included in t=
he
>> RTP proxy extension package seem to be organized for p-o-m.
>>
>> I'm using Debian Lenny 2.6.18 with iptables 1.4.2 and I'm trying to
>> install Netfilter RTP proxy extension 0.4. Can anybody help me to ge=
t
>> it installed?
>>
>> BTW, is there any other iptables-based solution to mangle
>> SIP/NAT/SDP/RTP sessions issues in multimedia streaming applications
>> such as VoIP?
>>
>>
>> Hope you can help me. Thanks a lot for your time.
>>
>>
>> Regards,
>> Javi
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>    =20
>
>  =20
