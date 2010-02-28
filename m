From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 16:23:06 +0530
Message-ID: <cfeab66d1002280253k48c24a44i4226478a773e8305@mail.gmail.com>
References: <4B893433.7020401@gatworks.com>
	 <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>
	 <4B894581.10700@gatworks.com> <4B8A133F.8030606@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=JyrcDlGxiFuI1sESn4OxYKZ0IQq0qN5kLhWdDHlMjoI=;
        b=mYEYyHx7vhUWUDmrla3IYygcmgYt+QxUaiMNX0+OIWxTtuMJjjBJXPNcihi/UrGGp8
         8csPaxDflfATLSfs21G9gwfczgmvKoFPx6gQFYXXWuY5/5YJOE7FsIOAabohFzuLHfKT
         oJZlVxzpbU6/FtPt1cj+XYXQQ/iPMP49n2GN4=
In-Reply-To: <4B8A133F.8030606@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

>> On 02/27/2010 10:06 AM, ratheesh k wrote:
>>> Port is in Layer 4 of protocol stack .
>
> Very useless response ...
>

Very true .
No more top posting . I did it by mistake .sorry.

Thanks,
Ratheesh



On Sun, Feb 28, 2010 at 12:24 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 27.02.2010 17:17, netfilter-owner@vger.kernel.org wrote:
>> U'll have to let me know why "-p udp" is needed when the chain can o=
nly
>> have udp packets, and therefor can only process udp packets.
>>
>> I dont want to test over (( and over ) and over ) again when I know =
that
>> the packet is already KNOWN to be from eth1 and of protocol UDP.
>
> now if we add -p icmp -j PRE_UDP, =A0what should iptables do now?
>
> use 'ferm' if you are too lazy to write iptables rules:
> http://ferm.foo-projects.org/
>
>>
>> adding "-p UDP" to multiport does make iptables happy, but appears t=
o be
>> a useless test.
>>
>> On 02/27/2010 10:06 AM, ratheesh k wrote:
>>> Port is in Layer 4 of protocol stack .
>
> Very useless response ...
>
>
>>>
>>>
>>> On Sat, Feb 27, 2010 at 8:33 PM, U. George<netbeans@gatworks.com> =A0=
wrote:
>>>> In order to get to the chain, the protocol, as well as the interfa=
ce
>>>> must
>>>> match. PRE_UDP if already filtered for "-p udp" . So why does mult=
iport
>>>> require another check for -p udp? Does it really need to have that
>>>> option in
>>>> order for it to work?
>>>>
>>>>> + /sbin/iptables -t filter -N PRE_UDP
>>>>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>>>>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>>>>> 137,138,139,512,514,515,1433,1434 -j DROP
>>>>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite'=
, `-p
>>>>> sctp' or `-p dccp'
>>>>> Try `iptables -h' or 'iptables --help' for more information.
>
>
> TOP POSTING is <-- censored -->...
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
