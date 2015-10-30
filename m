From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Fri, 30 Oct 2015 11:25:02 -0700
Message-ID: <500B1649-C3AA-4420-9384-6606448036FD@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com> <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com> <20151029195518.GB1778@salvia> <CAOkSjBhXp_Y39yT+dMPxMz+fHQ0S+QiB8nWwMQdvOjAnpSHyZw@mail.gmail.com> <20151030114617.GA1934@salvia>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=b414gmXgqDcx8nviPW2D0oKqaPfQj4lJK30VsossiR8=;
        b=voQsDXANNqDL7S9ZhLG4n1Afhi9dHVMTC9lERHqzHpYC9deGVVWb+yrELRzwOEeubg
         Tu1v9aEOcy2+uNy7ZqCH5KxTNv0VcEO+oOzXMqZY3Ybkrzz0XpfEr86piFAs5igLNVmu
         mB+XQmzjHqUDqxyX12mK/jQ9sii5m9lg2nzi8ujj2sfHhJO5HY4PdMNOEqkQw3JlYQd+
         sliGa407i2x7su/rdHW2TNDJUnR/VrVwMq/IQkVa8SgpdpnF9CRzWc4KnbJ6MYT32PfY
         VhwPVa8/DXtaJk4Mjx7gflnw9P79dve1QLflEpA+IsBoG/qPUFJnGNTntcIq1gOp5ZTe
         mSUw==
In-Reply-To: <20151030114617.GA1934@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

>> [0] http://wiki.nftables.org/wiki-nftables/index.php/Building_and_in=
stalling_nftables_from_sources

This:
> grep CONFIG_NFT_ /boot/config-4.2.0-1-amd64

seems to be distro-specific. E.g. on Arch, I don=E2=80=99t have such a =
file containing kernel config options at runtime. I=E2=80=99d add a not=
e to the wiki, but I don=E2=80=99t know which distro does this.

Thanks,



Johannes.

