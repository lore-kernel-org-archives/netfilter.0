From: Al Grant <bigal.nz@gmail.com>
Subject: Re: ban traffic per country
Date: Thu, 9 Oct 2014 20:54:52 +1300
Message-ID: <CAODtcded7n9p+15hCb9vQFc8G3DU9zLEeFOAM3Wp=bB4pMnujg@mail.gmail.com>
References: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
	<542D8CF4.8060505@familie-kuntze.de>
	<CAODtcdfiOBFeSgX6kE+waWrvh4Gk+BhxTOrdbhLEcwG3EaDe1A@mail.gmail.com>
	<542D909B.6030507@familie-kuntze.de>
	<CAODtcdeBDUXHcjSXCV1t3SKFGNP-eifPOhn6mynvzCShxstLLA@mail.gmail.com>
	<54312995.1000305@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=b8pEViaCmrdVGJboGXW4sl/ftcpWXiUPPYBcLoD0DlI=;
        b=n3TsDq3/PrMyrzixkNRsOIAaHMUvKXoYY1pOzmK5XJ1V9hPJ7qTzeO+lqoK4GkVYZ9
         TRcYRMg39xi29z0DfBmFAoDInJDMGNjei6bup/+GqJWiNSWID2p3YzA1knXotsizpBeJ
         GE2iXs7DehXerOZKmhlPln2XnmZm9domaf+AhLDZzTiWZwXKdq+S/0JxHHzgDEd37qF7
         EZEiqL0zUHrWQiAtMY+8UD5Zxclp+BjCH0w9fFHJ4vcWXekxQ5dc0O7kXk7mDg3Su1ZY
         0V+PFmkdBgpyDqRx6VguCtmpKjuRLlS4FttCmA91VD6VC7RUkB7lxOVdPzMdVvqhdwg0
         XwYg==
In-Reply-To: <54312995.1000305@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Noel Kuntze <noel@familie-kuntze.de>, netfilter <netfilter@vger.kernel.org>

Thank Noel.

I got around to doing some more reading about ipset and added your rule=
s.

Looking at counters and having done some testing they are not getting
applied. I say this based on the counters (ie)

https://dpaste.de/9QG0#L21

Should the rules be at the top?

Thanks again

-Al


On Mon, Oct 6, 2014 at 12:20 AM, Noel Kuntze <noel@familie-kuntze.de> w=
rote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello Al,
>
> I'm going to break it down for you.
>
> The reason for storing it as a hash is, that that hash:net is the onl=
y storage type that only requires a subnet.
> Every other type requires either more arguments (hash:net,net, hash:n=
et,port) or doesn't support the :net data type.
>
> You need family inet, because you're working IPv4 addresses. If you w=
ant to work with ipv6 addresses, you need to use
> family inet6.
>
> hashsize and maxelem aren't really needed, as I just gave you the def=
ault values for those.
>
> If your distro doesn't come with a default ipset.conf file, you shoul=
d create one.
> The file "ipset.conf" just contains the ipset structure with the memb=
ers.
> If you created an ipset using the "ipset" tool, you can store it usin=
g "ipset -f <pathToTheSaveFile> save".
> To load the ipset before you load the iptables rules, you also need c=
reate a service with the correct dependencies.
>
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> Am 05.10.2014 um 04:56 schrieb Al Grant:
>>  Hi Noel,
>>
>> So I have started to read manpages on ipset. Its left me with a few =
questions.
>>
>> Could you break the command down into pieces?
>>
>> I get "ipset create new-Zealand" but why store it as a hash?
>>
>> What datatypes doesn't net include for example?
>>
>> The explanation in the manual for the rest " inet hashsize 1024
>> maxelem 65535" I didn't understand either.
>>
>> It would be nice to understand what I am doing rather than blindly
>> copying your commands - where's the learning in that!
>>
>> The iptables rule I am ok with.
>>
>> Finally you talk about ipset.conf ? I have installed ipset - but a
>> "find / -name ipset.conf" didn't find anything so Im not sure that
>> file exists anywhere on my system (RedHat).
>>
>> What should I be adding to ipset.conf when I find it.
>>
>> Thanks in advance,
>>
>> -Al
>>
>>
>>
>>
>> On Fri, Oct 3, 2014 at 6:51 AM, Noel Kuntze <noel@familie-kuntze.de>=
 wrote:
>>>
>> Hello Al,
>>
>> Please keep it on the list.
>> An ipset is basicly external storage in kernel space. It can contain=
 a couple of layer
>> three and four information, like IP addresses or ports. You can matc=
h on said
>> characteristica with the "set" iptables match module.
>> You need to load the ipset before you load the rules, otherwise you =
can't
>> load them.
>> Example rules and ipset:
>>
>> Rule: -A INPUT -m set ! --match-set new-zealand src -j DROP
>>
>> ipset:
>> create new-zealand hash:net family inet hashsize 1024 maxelem 65535
>> add new-zealand 10.0.0.0/8
>> add new-zealand 172.16.0.0/12
>>
>> The rule matches on all traffic, that does not come from an IP that =
is contained in
>> any of the networks contained in the set "new-zealand".
>> I don't know what distribution you use, so I can't tell you where it=
's supposed to go
>> on your host. On Arch Linux, you have /etc/ipset.conf.
>>
>> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
>> Noel Kuntze
>>
>> GPG Key ID: 0x63EC6658
>> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>>
>> Am 02.10.2014 um 19:45 schrieb Al Grant:
>> >>> Thanks for the fast reply Noel.
>> >>>
>> >>> Im not particularly good with iptables or ipset. Would you mind
>> >>> providing a little more detail?
>> >>>
>> >>> Thanks in advance,
>> >>>
>> >>> -Al
>> >>>
>> >>>
>> >>> On Fri, Oct 3, 2014 at 6:35 AM, Noel Kuntze <noel@familie-kuntze=
=2Ede> wrote:
>> >>>>
>> >>> Hello Al,
>> >>>
>> >>> Yes, that is possible. Get the list of subnets that is assigned =
to the ISPs in
>> >>> New Zealand and put it into an ipset. Then match on said ipset w=
ith the "set"
>> >>> match module.
>> >>>
>> >>> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
>> >>> Noel Kuntze
>> >>>
>> >>> GPG Key ID: 0x63EC6658
>> >>> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>> >>>
>> >>> Am 02.10.2014 um 19:27 schrieb Al Grant:
>> >>>>>> Hi All,
>> >>>>>>
>> >>>>>> I have a Amazon instance running asterisk. I think it also ha=
s fail2ban running.
>> >>>>>>
>> >>>>>> I want to lock it down a little as I have opened up some port=
s for
>> >>>>>> asterisk to run.
>> >>>>>>
>> >>>>>> In essence no traffic should connect to it except from my cou=
ntry .nz
>> >>>>>>
>> >>>>>> Is there a way to do this? I see a few websites list some ver=
y long
>> >>>>>> lists of iptables per country.
>> >>>>>>
>> >>>>>> Cheers
>> >>>>>>
>> >>>>>> -Al
>> >>>>>>
>> >>>>>>
>> >>>
>> >>>>
>> >>>
>> >>>
>> >>>
>>
>>
>>>
>>
>>
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQIcBAEBCAAGBQJUMSmVAAoJEDg5KY9j7GZYIbMQAJvh8r/K5FQwRDmQocmR/+em
> r0pfykS5ti76+sj1yX1Rei5q1jBWmvkVRFwxNQP9ShPr9C/f9Kj0ivS9S/vgCXDT
> b/Tg+ykCYnutf5n2bM4oX3dby0+Pn0Q33yZws6QKT/YQIiOnvgitVIKhMpHuZCvm
> +GawpF/6iEz8uZ4z9Ib2Z9PABLrvHfpMC4Dt+EhOGqwCb3ZAYaCFAiB0rrTSWPVq
> daBRmpgMasKXUNo2fZSXkt9tGYifLHRpBagqiIkMBcMvh2TlQJK3jyIVrjd8DRWh
> DHVV+C7tID6OhayFivjz1jOoaynini/spJ7WIMbMI3udIN3XMxZt9ZtmrjOctKQI
> ge4C0mDcdUDvc9opbenzOO7k6ZcXC+wdYpQ5FAC9onxgajpOKsDiPcBzf6Xgrnc6
> 61aQcdc/py2aBol6zvYMOssa1a0gL8AqwGGkI6RRsLkD45sz7f7B2dPfSYqmTzEo
> CMOwusRFefHBNDIRDuMRLA5lYAyu8j48GxoGtppj0XF+Adcr58vcUU9dF7eSQsqS
> fhIzkk4DJaLq7LH4x9RQ05SP6ke2LRCMFPbh/zvBUQ+fLoJ5gTZveypZxN6mE3MR
> f7d2NQgBuxieZPCwr4yY2yGc+j+DURSooJv1+/Gb6zrxSbEWsAVQfoF5+vyT7rtX
> 1tpgxsf7get0hciX23Di
> =3DYyjO
> -----END PGP SIGNATURE-----
>
>



--=20
"Beat it punk!"
- Clint Eastwood
