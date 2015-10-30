From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Fri, 30 Oct 2015 11:50:20 +0100
Message-ID: <CAOkSjBhXp_Y39yT+dMPxMz+fHQ0S+QiB8nWwMQdvOjAnpSHyZw@mail.gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
 <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
 <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com> <20151029195518.GB1778@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=PCwVph2PSWltNDSmciSlsdOM5lKsl3vJTJYaKAASgLw=;
        b=Kar8flG4hVXW39XLUf+CFH14kIyEqkPtvaen1xyqh40fQwnHuKGfshCeB4v1eZ6f4d
         eo/D18DbiV5OOUqRQBSmoOVq/iKh7NOmexK9SGDTJaQmihdGYiSYzIzqFJF+Eqgic46A
         E2y8INl9muAMlzhbmYvFRT0GnmRwXr3dLVkDhE73aTRWcMppSRLS5yP4zFGGH/5AV5t6
         WMygeTO1vEIfOUlWNnzpEW/epdPm+7qEn+/zYC5/peQZNEfUQOJSrpgeXn+Qm/K/Qoa+
         yDfjiKn7w5HwSWjQj7Audbfs20zOEd4FWEsUYqE5fIK1mGQIb796h4IUd9Y8CtRonnKb
         xPWA==
In-Reply-To: <20151029195518.GB1778@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Johannes Ernst <johannes.ernst@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 29 October 2015 at 20:55, Pablo Neira Ayuso <pablo@netfilter.org> wr=
ote:
>
> It would be good to have a sort of "compiling nf_tables kernel
> support" on the wiki, in case anyone finds the time to contribute it.
>

Hi Pablo,

I added a bit more info to the wiki. Would you like to review it?

I added hints about checking the kernel configuration [0] and some
pointers to distributor's nftables as well [1].

[0] http://wiki.nftables.org/wiki-nftables/index.php/Building_and_insta=
lling_nftables_from_sources
[1] http://wiki.nftables.org/wiki-nftables/index.php/Nftables_from_dist=
ributions

--=20
Arturo Borrero Gonz=C3=A1lez
