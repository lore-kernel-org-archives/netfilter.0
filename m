From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Fri, 30 Oct 2015 11:56:24 -0700
Message-ID: <8BE61298-7591-4BF4-AE3D-062A69F051B3@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com> <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com> <20151029195518.GB1778@salvia> <CAOkSjBhXp_Y39yT+dMPxMz+fHQ0S+QiB8nWwMQdvOjAnpSHyZw@mail.gmail.com> <20151030114617.GA1934@salvia> <500B1649-C3AA-4420-9384-6606448036FD@gmail.com> <CAOkSjBiajm2Oq9min2NpXDGmDUQVB0GuqmrD-1ECAoOJQCzuEw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=AMNUMZiGnMCOXITfrU6QojnfHnmrmdwkgxWQJts9QeQ=;
        b=jUWhz8xuEqyymnII9qG/ZEBeMAxvCxcR9xGV9llVCPI6mJM6T6oIstbCJ8K3VwskmH
         OhyaM807GtPI1W54hXEzPwtBdFC9LngE8bkGsqJ11oPVDHp3N3sV5/5lkGbtNjVQPGBb
         ACkumbJh/0loD5tOQOS/UY0mttDsrnyvHRIK0xEb4q7Tug86iaKTRQ94froYD2MO6ytj
         k7qv7IU/m4TAPNigypDdcmN/QpFrw7D27dwHho4IjfZlHF//DyvqjWnjo7QuG5Sqd1Zw
         3h7vMYFMfuHND2wh+Bd6dGCYVklRcqzRkHajYl7ZVn1B9gWbXFc3jDaFenmHwXiwnuYE
         Ad3Q==
In-Reply-To: <CAOkSjBiajm2Oq9min2NpXDGmDUQVB0GuqmrD-1ECAoOJQCzuEw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>


> On Oct 30, 2015, at 11:27, Arturo Borrero Gonzalez <arturo.borrero.gl=
ez@gmail.com> wrote:
>=20
> On 30 October 2015 at 19:25, Johannes Ernst <johannes.ernst@gmail.com=
> wrote:
>>>> [0] http://wiki.nftables.org/wiki-nftables/index.php/Building_and_=
installing_nftables_from_sources
>>=20
>> This:
>>> grep CONFIG_NFT_ /boot/config-4.2.0-1-amd64
>>=20
>> seems to be distro-specific. E.g. on Arch, I don=E2=80=99t have such=
 a file containing kernel config options at runtime. I=E2=80=99d add a =
note to the wiki, but I don=E2=80=99t know which distro does this.
>>=20
>=20
> Yeah that was an example on Debian.
>=20
> In Arch it seems you can look in /proc/config.gz

I added a note to the wiki.

Cheers,


Johannes.


