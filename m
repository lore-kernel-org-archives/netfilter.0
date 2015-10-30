From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Fri, 30 Oct 2015 19:27:59 +0100
Message-ID: <CAOkSjBiajm2Oq9min2NpXDGmDUQVB0GuqmrD-1ECAoOJQCzuEw@mail.gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
 <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
 <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
 <20151029195518.GB1778@salvia> <CAOkSjBhXp_Y39yT+dMPxMz+fHQ0S+QiB8nWwMQdvOjAnpSHyZw@mail.gmail.com>
 <20151030114617.GA1934@salvia> <500B1649-C3AA-4420-9384-6606448036FD@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=52eY3muqZUnn73K6sMFMnubg3Z0VZkJOqg4bKZoG/+I=;
        b=Q84fUUnOk8MutzIEmHq0bkzzwDO+vZwqDtzzVnWeru60RmuHqFh1PFL3zhpPiCQxHZ
         vik+Jh7QARnNPEuEmd8pmF9KtfNtQmpBjuQffJxXtF801OfIubwKtWKMLe31wK9YVTg7
         jV8twbkr/J9Q0hYtCBPwRTAlsJaJUOM0Sko78lAdCR3lRMypONZfA1u2tSvuvCXUAbvK
         w2rk0A94pq8PYWCg2GFkCBru9z/3SPeFB49XtXnlr1d8m9TFuaUd3yq8ULQnW9tAroH2
         UT2w6muWK4qow+VMy5QegECx6jmEfjccqAnVu6YBlhRZ9e5Se1xT1H1pYXHEEn9A3paO
         289g==
In-Reply-To: <500B1649-C3AA-4420-9384-6606448036FD@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johannes Ernst <johannes.ernst@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 30 October 2015 at 19:25, Johannes Ernst <johannes.ernst@gmail.com> =
wrote:
>>> [0] http://wiki.nftables.org/wiki-nftables/index.php/Building_and_i=
nstalling_nftables_from_sources
>
> This:
>> grep CONFIG_NFT_ /boot/config-4.2.0-1-amd64
>
> seems to be distro-specific. E.g. on Arch, I don=E2=80=99t have such =
a file containing kernel config options at runtime. I=E2=80=99d add a n=
ote to the wiki, but I don=E2=80=99t know which distro does this.
>

Yeah that was an example on Debian.

In Arch it seems you can look in /proc/config.gz
--=20
Arturo Borrero Gonz=C3=A1lez
