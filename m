From: sbezverk <sbezverk@gmail.com>
Subject: Re: [ANNOUNCE] nftables 0.9.4 release
Date: Thu, 02 Apr 2020 08:52:37 -0400
Message-ID: <60AB079D-9481-4767-9E07-BDEE7E691B6B@gmail.com>
References: <20200401143114.yfdfej6bldpk5inx@salvia>
 <8174B383-989D-4F9D-BDCA-3A82DE5090D2@gmail.com>
 <20200402124744.GY7493@orbyte.nwl.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=user-agent:date:subject:from:to:cc:message-id:thread-topic
         :references:in-reply-to:mime-version:content-transfer-encoding;
        bh=QCBSvIRHgvM9RB9j7/TK8QMBYlllJbQ88T/ZrB7LOlg=;
        b=rxWVzi84N9Yox2z4OP2zTO+PlmSxEpcLGO8k3ZVnZL6M7pAMPlcH0rBfDGFv5RKP9/
         5SL2SCY0yDfn/Csc94aWkccfrYEJ3elLY+ICVUdGlu/pbdLF0P5CrujRipiDMO+deB9u
         OGhbNazla9/hsfA/RMW6LJ/Xd2HjgiIbKpffg4625920aRJRyh6ms2AiNYbwxGfXRcQm
         msOx8Qc44A2Q6l1u+kNYvwEIINUqvrnQaIHA7RZnsqBp4MLQB9fy7J9rJyjiqZKskpxY
         Q01JJnmVhW5xzCZMTy9ZpGn5dw2TV8Et7ezVm7oRCUEFFroTolbTHo4nKx179G+hmzF/
         Mzow==
In-Reply-To: <20200402124744.GY7493@orbyte.nwl.cc>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phil Sutter <phil@nwl.cc>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>, netdev@vger.kernel.org, lwn@lwn.net

Hi Phil,

Thank you for letting me know, indeed it is sad, but hopefully it will get =
in sooner rather than later.

Best regards
Serguei

=EF=BB=BFOn 2020-04-02, 8:47 AM, "Phil Sutter" <n0-1@orbyte.nwl.cc on behalf of p=
hil@nwl.cc> wrote:

    Hi Serguei,
   =20
    On Thu, Apr 02, 2020 at 08:38:10AM -0400, sbezverk wrote:
    > Did this commit make into 0.9.4?
    >=20
    > https://patchwork.ozlabs.org/patch/1202696/
   =20
    Sadly not, as it is incomplete (anonymous LHS maps don't work due to
    lack of type info). IIRC, Florian wanted to address this but I don't
    know how far he got with it.
   =20
    Cheers, Phil
   =20


