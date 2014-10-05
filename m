From: Al Grant <bigal.nz@gmail.com>
Subject: Re: ban traffic per country
Date: Sun, 5 Oct 2014 17:59:59 +1300
Message-ID: <CAODtcddE7RkERF16HunH=x7De9iYM+VDsVrmJSCjfd_y7YY7dQ@mail.gmail.com>
References: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
	<542D8CF4.8060505@familie-kuntze.de>
	<CAODtcdfiOBFeSgX6kE+waWrvh4Gk+BhxTOrdbhLEcwG3EaDe1A@mail.gmail.com>
	<542D909B.6030507@familie-kuntze.de>
	<CAODtcdew5+wZEJL5FC1fd6sKSGM0cYM6BT3shyqyY3vX50E57A@mail.gmail.com>
	<DBF13FF8A23E422A94749672B865AB73@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=007sGaHS/n7rp7Xkhq7KkZZIfqhoKcrudqrAMFAKyqQ=;
        b=ojPw/qaVG9lZnyQ26C+7nVK28KQvN6PyCDRIRIwamny3sng+IXW8OpZ+1usKMbRTcQ
         o3tsBAVRFfNwFa6arvnUTiQJplucMgcSKUVz8/V6s+gnzW+wpuf/LKwz92Kh/NZEiHuK
         35BZpVUYfJDTx1pqaEhaqbAVABD1IO2Dbgu5AzYhNLXOU87kVhWPra/3OW8xDdR3Nzkp
         zOovGCyt/kVZzWarP1jltpoiv69i4LLmiYHx7YjpOwhqjqgQhgu1rNMI3EMr0eA94AXL
         Frfo7DYH9PCHTIFDsmCXNQ3vXqRonT82YCyo9P7ashdQSgRutSHDdkNtf71JB7fCq3Mo
         Jmaw==
In-Reply-To: <DBF13FF8A23E422A94749672B865AB73@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Payam Chychi <pchychi@gmail.com>, netfilter <netfilter@vger.kernel.org>

 "Every expert began as an amateur" - Jeffery Fry

No offence taken.

I have goggled it, read the man pages, which didn't explain why for
example those addresses must, or should be stored as hashes - and some
of the other parameters I saw there.

man pages are helpful - but sometime brief and while they explain the
what, not always explain the why.

In terms of my end game which could be best described as enforcement
of whitelist on my amazon asterisk server, I have also played with
fail2ban, astsec and a few other packages.

I have also actually tried Noels suggestion.

All in all (admittedly some of it falls outside ipset) I have invested
several hours experimenting with this problem/solution.

I hope this explains my situation and attempts to educate myself so far=
=2E

Regards

-Al


On Sun, Oct 5, 2014 at 5:47 PM, Payam Chychi <pchychi@gmail.com> wrote:
> Al,
>
> No disrespect but have you taken more than 5min to google what you ar=
e
> asking for? Also, ipset does have documentation which is easily locat=
able
>
>
>
> --
> Payam Chychi
> Network Engineer / Security Specialist
>
> On Saturday, October 4, 2014 at 8:19 PM, Al Grant wrote:
>
> PS: The Amazon server is NAT'd so I presume I need to add the local
> (LAN) subnet to be allowed too?
>
>
>
> On Fri, Oct 3, 2014 at 6:51 AM, Noel Kuntze <noel@familie-kuntze.de> =
wrote:
>
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello Al,
>
> Please keep it on the list.
> An ipset is basicly external storage in kernel space. It can contain =
a
> couple of layer
> three and four information, like IP addresses or ports. You can match=
 on
> said
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
s
> contained in
> any of the networks contained in the set "new-zealand".
> I don't know what distribution you use, so I can't tell you where it'=
s
> supposed to go
> on your host. On Arch Linux, you have /etc/ipset.conf.
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> Am 02.10.2014 um 19:45 schrieb Al Grant:
>
> Thanks for the fast reply Noel.
>
> Im not particularly good with iptables or ipset. Would you mind
> providing a little more detail?
>
> Thanks in advance,
>
> -Al
>
>
> On Fri, Oct 3, 2014 at 6:35 AM, Noel Kuntze <noel@familie-kuntze.de> =
wrote:
>
> Hello Al,
>
> Yes, that is possible. Get the list of subnets that is assigned to th=
e ISPs
> in
> New Zealand and put it into an ipset. Then match on said ipset with t=
he
> "set"
> match module.
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> Am 02.10.2014 um 19:27 schrieb Al Grant:
>
> Hi All,
>
> I have a Amazon instance running asterisk. I think it also has fail2b=
an
> running.
>
> I want to lock it down a little as I have opened up some ports for
> asterisk to run.
>
> In essence no traffic should connect to it except from my country .nz
>
> Is there a way to do this? I see a few websites list some very long
> lists of iptables per country.
>
> Cheers
>
> -Al
>
>
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
>
>
>
> --
> "Beat it punk!"
> - Clint Eastwood
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>



--=20
"Beat it punk!"
- Clint Eastwood
