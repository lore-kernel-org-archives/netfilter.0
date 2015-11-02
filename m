From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Mon, 2 Nov 2015 12:29:06 -0800
Message-ID: <9694F058-B55C-4926-99EB-ADC0A1BEAB67@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com> <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com> <20151029195518.GB1778@salvia> <CAOkSjBhXp_Y39yT+dMPxMz+fHQ0S+QiB8nWwMQdvOjAnpSHyZw@mail.gmail.com> <20151030114617.GA1934@salvia> <500B1649-C3AA-4420-9384-6606448036FD@gmail.com> <CAOkSjBiajm2Oq9min2NpXDGmDUQVB0GuqmrD-1ECAoOJQCzuEw@mail.gmail.com> <8BE61298-7591-4BF4-AE3D-062A69F051B3@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DHw8N13Yyzrfhlb1SX3Yfrnc3bxw6Miu5zjUt2hToAM=;
        b=NVTgIigfZbGyHZS3swpa0K0TYZ2UYLCZ2Xucy9vklM8UA7KLCCbP6Go1tyQRU6GBjh
         BjrOzcSTFn1/Nzbm7SQB+Eww0sWhTLKORCjhs+qfH+52LULPJnOiccMaabCsQBnyETC/
         aKGB11MFEKSc2wu5rcO2DQuFWPgFpcs/eM7Y8Nq7K+0EdllyMW7tHmkWaqB5K5vLsgJm
         lxPn4MH8MuSZE03lBxi2BuGF1q8UqB3gFXXIo26R5dGaZE8BWauya4qPyGwBkLGOemcU
         cFeJGZdf/AkvxqWwNgisIcTz7hxVdpxM4Leax0eRs7Nssw9F1mNAUnYOyl+VOnf2Ji6J
         pq3A==
In-Reply-To: <8BE61298-7591-4BF4-AE3D-062A69F051B3@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>

Kernel modules are ok now, but I can=E2=80=99t get =E2=80=9Cout=E2=80=9D=
 from my LAN via masquerade if I say 'oifname enp2s0 masquerade'.

It does seem to work without the oifname. But how does nftables decide =
which of the interfaces need to be masqueraded if I don=E2=80=99t provi=
de such a conditional?

This is what I have:

enp2s0: 192.168.138.125 (towards =E2=80=98upstream=E2=80=99)
enp3s0: 192.168.150.1 (=E2=80=98LAN=E2=80=99)

> nft list tables
table ip nat
> nft list table ip nat
table ip nat {
  chain prerouting {
    type nat hook prerouting priority 0; policy accept;
  }
  chain postrouting {
    type nat hook postrouting priority 0; policy accept;
    oifname =E2=80=9Cenp2s0=E2=80=9D masquerade
  }
}

My =E2=80=98LAN=E2=80=99 test machine has 192.168.150.239. It can ping =
192.168.150.1 and 192.168.138.125, but nothing further upstream.

My =E2=80=98gateway=E2=80=99 can ping upstream and the LAN test machine=
=2E

Again, it seems to work if I drop the 'oifname =E2=80=9Cenp2s0=E2=80=9D=
' in front of the masquerade.

Thanks,



Johannes.

