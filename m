From: Al Grant <bigal.nz@gmail.com>
Subject: Re: ban traffic per country
Date: Sun, 5 Oct 2014 15:56:35 +1300
Message-ID: <CAODtcdeBDUXHcjSXCV1t3SKFGNP-eifPOhn6mynvzCShxstLLA@mail.gmail.com>
References: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
	<542D8CF4.8060505@familie-kuntze.de>
	<CAODtcdfiOBFeSgX6kE+waWrvh4Gk+BhxTOrdbhLEcwG3EaDe1A@mail.gmail.com>
	<542D909B.6030507@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=VuYHt9/4EYfUU5lrLoCPCvKBDWHgLfugjIVPluvzaW4=;
        b=ZAayUjb28NsfHuAqIPD1vJXfY/AHz6u3M/TwGeyuuDbhoZLb4M8z/4VdWn9iKQv3lf
         xLTEJ8L+DIJJ8hpiH+sC2l38+CFbC1vjCgzWTot4KjzGvqcXf+GOmPoLb4tFo5Jx26ZY
         3dyCsZH7BZVgMTDBnXKe7OJrT3LjaAj9KrxUu5jxx4rrRPA7so1u/2QWPa9On/iFBOSX
         g64y4AXiqo+Vi9hsVgvyt3rrbcDjFH03+7fqgBwSRMD2lL7m0IeJzxoBmgqUKXAJoXcH
         Lp4liAagNgWemQHcqqZphShKvjd0Cf53sGRlpNIHNHZVgzH6nNkTNg8XP1RwZHLo+6ru
         csEg==
In-Reply-To: <542D909B.6030507@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Noel Kuntze <noel@familie-kuntze.de>, netfilter <netfilter@vger.kernel.org>

 Hi Noel,

So I have started to read manpages on ipset. Its left me with a few que=
stions.

Could you break the command down into pieces?

I get "ipset create new-Zealand" but why store it as a hash?

What datatypes doesn't net include for example?

The explanation in the manual for the rest " inet hashsize 1024
maxelem 65535" I didn't understand either.

It would be nice to understand what I am doing rather than blindly
copying your commands - where's the learning in that!

The iptables rule I am ok with.

=46inally you talk about ipset.conf ? I have installed ipset - but a
"find / -name ipset.conf" didn't find anything so Im not sure that
file exists anywhere on my system (RedHat).

What should I be adding to ipset.conf when I find it.

Thanks in advance,

-Al




On Fri, Oct 3, 2014 at 6:51 AM, Noel Kuntze <noel@familie-kuntze.de> wr=
ote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello Al,
>
> Please keep it on the list.
> An ipset is basicly external storage in kernel space. It can contain =
a couple of layer
> three and four information, like IP addresses or ports. You can match=
 on said
> characteristica with the "set" iptables match module.
> You need to load the ipset before you load the rules, otherwise you c=
an't
> load them.
> Example rules and ipset:
>
> Rule: -A INPUT -m set ! --match-set new-zealand src -j DROP
>
> ipset:
> create new-zealand hash:net family inet hashsize 1024 maxelem 65535
> add new-zealand 10.0.0.0/8
> add new-zealand 172.16.0.0/12
>
> The rule matches on all traffic, that does not come from an IP that i=
s contained in
> any of the networks contained in the set "new-zealand".
> I don't know what distribution you use, so I can't tell you where it'=
s supposed to go
> on your host. On Arch Linux, you have /etc/ipset.conf.
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> Am 02.10.2014 um 19:45 schrieb Al Grant:
>> Thanks for the fast reply Noel.
>>
>> Im not particularly good with iptables or ipset. Would you mind
>> providing a little more detail?
>>
>> Thanks in advance,
>>
>> -Al
>>
>>
>> On Fri, Oct 3, 2014 at 6:35 AM, Noel Kuntze <noel@familie-kuntze.de>=
 wrote:
>>>
>> Hello Al,
>>
>> Yes, that is possible. Get the list of subnets that is assigned to t=
he ISPs in
>> New Zealand and put it into an ipset. Then match on said ipset with =
the "set"
>> match module.
>>
>> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
>> Noel Kuntze
>>
>> GPG Key ID: 0x63EC6658
>> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>>
>> Am 02.10.2014 um 19:27 schrieb Al Grant:
>> >>> Hi All,
>> >>>
>> >>> I have a Amazon instance running asterisk. I think it also has f=
ail2ban running.
>> >>>
>> >>> I want to lock it down a little as I have opened up some ports f=
or
>> >>> asterisk to run.
>> >>>
>> >>> In essence no traffic should connect to it except from my countr=
y .nz
>> >>>
>> >>> Is there a way to do this? I see a few websites list some very l=
ong
>> >>> lists of iptables per country.
>> >>>
>> >>> Cheers
>> >>>
>> >>> -Al
>> >>>
>> >>>
>>
>>>
>>
>>
>>
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQIcBAEBCAAGBQJULZCbAAoJEDg5KY9j7GZYL/YP+wVI3lCcUyPKmcQ2qWeRjdjb
> t85yNJ+TTkQpbb4auPrEW+uaQraA9KeVu2DEyx3y0xATl2opZW8VOO8I3yQshQdD
> eXUGVgGTjgB49EHickyQiVMwqlwexNJXJTUDFKrUctuclVBGKRbuuNwJRpRaT2sV
> XTxPWB0ESPGiN/2yVHI5hz8ZNUhNYdJsxo3pz3EsUVQXkxvT9GSIpy1W8boPTx7i
> Rsvg8CyehF7BkjVhp8CbqBnCb4+pV/sUBn6Z7HGdCUuTG6II5akMk058pEYXMr4r
> ZwbMaTMraaVTDei69CmQpwpETtMwIWokcnd8yzoZexAFCWJ03ICFCCXS+hEVDtxD
> fvO72gUNgXFl0olMA8MKBqm0jtMnQF+3hLitVJjSUt/jESsujQhjit9zZXplXayi
> 8A29SdgnpaDwm+LUwod86hjCJDEbPXoVuVOz7bCa+K4kBCsqXnBn1JfwJdAGV+lM
> OAhG+VZqMzTrGW+yCefM+DFZNi3oxEAmBCl7aMxSymA2n5x85/dnE7c4fO+GF0re
> MvuJA1g0mET1PxIlGcZHvI8gtOgSzxbWmnLCogeFqQu1pHd9MEBesBMswl0HFS1R
> piuCQzklRPaRfFrZPaMf7o+svN77QOVFQ6RPh1F/dDIGqzKrEytThJ0oyl1GarEG
> bdSlMjwlH87HxoNaNMMX
> =3DrP2h
> -----END PGP SIGNATURE-----
>



--=20
"Beat it punk!"
- Clint Eastwood
