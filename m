From: Al Grant <bigal.nz@gmail.com>
Subject: Re: ban traffic per country
Date: Sat, 4 Oct 2014 12:59:12 +1300
Message-ID: <CAODtcdfM_v2k8V9jim9PuZYzKLCfvn2Gz1pjTCZzRTqsN1DkCA@mail.gmail.com>
References: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
	<542D8CF4.8060505@familie-kuntze.de>
	<CAODtcdfiOBFeSgX6kE+waWrvh4Gk+BhxTOrdbhLEcwG3EaDe1A@mail.gmail.com>
	<542D909B.6030507@familie-kuntze.de>
	<CACuyg24jYJiACrawuVK7ok6ga3xfZCS41zA_v1HkZp_0=mfiBg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=X5AEcAC6LXjkehdIIBBno1KbGAgGsF2ziIyIEZdtRx4=;
        b=iZO5fEVjYFSAg962s7Bf0RDQx9PlmP+BZGgFccKMn3xOlYmejWWCr3TVqQyMPrEGGv
         w67awMUsf6HSdBcQRK+keGeKsayupl6wHko5ZW9mPWWM2YVhLK30EGmh/MZjIRej0aWv
         KGGYtK89kts9npZv+ekA7secjaqn656dxNaygkq5L9v47zBcBE2wOmaF2DA5zUdpznnR
         GNoPXg14ByPAXNoQPUN80XTDUeIEgmDZ2phtuXD4pThAFmF+pL5v0LhGKW2POObq1THb
         nUCGcgqwL7C3iQBfHA7O8kyS0o/QgSatZ63bPUV8egpirmylgq949UxQSfiY8N62VXhm
         vZew==
In-Reply-To: <CACuyg24jYJiACrawuVK7ok6ga3xfZCS41zA_v1HkZp_0=mfiBg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: Noel Kuntze <noel@familie-kuntze.de>, netfilter <netfilter@vger.kernel.org>

I am running Pbx In a Flash (PIAF) which is on Red Hat BTW.

On Fri, Oct 3, 2014 at 9:42 AM, Humberto Juc=C3=A1 <betolj@gmail.com> w=
rote:
> Hi,
>
> Take a look here:
> http://blog.jeshurun.ca/technology/block-countries-ubuntu-iptables-xt=
ables-geoip
>
> 2014-10-02 13:51 GMT-04:00 Noel Kuntze <noel@familie-kuntze.de>:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
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
>>> Thanks for the fast reply Noel.
>>>
>>> Im not particularly good with iptables or ipset. Would you mind
>>> providing a little more detail?
>>>
>>> Thanks in advance,
>>>
>>> -Al
>>>
>>>
>>> On Fri, Oct 3, 2014 at 6:35 AM, Noel Kuntze <noel@familie-kuntze.de=
> wrote:
>>>>
>>> Hello Al,
>>>
>>> Yes, that is possible. Get the list of subnets that is assigned to =
the ISPs in
>>> New Zealand and put it into an ipset. Then match on said ipset with=
 the "set"
>>> match module.
>>>
>>> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
>>> Noel Kuntze
>>>
>>> GPG Key ID: 0x63EC6658
>>> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>>>
>>> Am 02.10.2014 um 19:27 schrieb Al Grant:
>>> >>> Hi All,
>>> >>>
>>> >>> I have a Amazon instance running asterisk. I think it also has =
fail2ban running.
>>> >>>
>>> >>> I want to lock it down a little as I have opened up some ports =
for
>>> >>> asterisk to run.
>>> >>>
>>> >>> In essence no traffic should connect to it except from my count=
ry .nz
>>> >>>
>>> >>> Is there a way to do this? I see a few websites list some very =
long
>>> >>> lists of iptables per country.
>>> >>>
>>> >>> Cheers
>>> >>>
>>> >>> -Al
>>> >>>
>>> >>>
>>>
>>>>
>>>
>>>
>>>
>>
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v2
>>
>> iQIcBAEBCAAGBQJULZCbAAoJEDg5KY9j7GZYL/YP+wVI3lCcUyPKmcQ2qWeRjdjb
>> t85yNJ+TTkQpbb4auPrEW+uaQraA9KeVu2DEyx3y0xATl2opZW8VOO8I3yQshQdD
>> eXUGVgGTjgB49EHickyQiVMwqlwexNJXJTUDFKrUctuclVBGKRbuuNwJRpRaT2sV
>> XTxPWB0ESPGiN/2yVHI5hz8ZNUhNYdJsxo3pz3EsUVQXkxvT9GSIpy1W8boPTx7i
>> Rsvg8CyehF7BkjVhp8CbqBnCb4+pV/sUBn6Z7HGdCUuTG6II5akMk058pEYXMr4r
>> ZwbMaTMraaVTDei69CmQpwpETtMwIWokcnd8yzoZexAFCWJ03ICFCCXS+hEVDtxD
>> fvO72gUNgXFl0olMA8MKBqm0jtMnQF+3hLitVJjSUt/jESsujQhjit9zZXplXayi
>> 8A29SdgnpaDwm+LUwod86hjCJDEbPXoVuVOz7bCa+K4kBCsqXnBn1JfwJdAGV+lM
>> OAhG+VZqMzTrGW+yCefM+DFZNi3oxEAmBCl7aMxSymA2n5x85/dnE7c4fO+GF0re
>> MvuJA1g0mET1PxIlGcZHvI8gtOgSzxbWmnLCogeFqQu1pHd9MEBesBMswl0HFS1R
>> piuCQzklRPaRfFrZPaMf7o+svN77QOVFQ6RPh1F/dDIGqzKrEytThJ0oyl1GarEG
>> bdSlMjwlH87HxoNaNMMX
>> =3DrP2h
>> -----END PGP SIGNATURE-----
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
"Beat it punk!"
- Clint Eastwood
