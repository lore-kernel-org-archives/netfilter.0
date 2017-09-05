From: Raul Martinez <mraul@qti.qualcomm.com>
Subject: RE: Possible nftables U32 equivalent to read packet's data contents
Date: Tue, 5 Sep 2017 17:04:49 +0000
Message-ID: <7d1ef2913f5044439eda19d345f53d28@nalasexr02h.na.qualcomm.com>
References: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
 <20170901103004.GA16773@salvia>
 <c57ba9690f0d4ec680ce16599e8b15da@nalasexr02h.na.qualcomm.com>
 <20170904205521.GA14891@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1504631090; x=1536167090;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MWawkB4YL8tpNAEd+gptZ+NWlYbaaiwPht7HF3z3JLQ=;
  b=d8pUPaqYAql2T5FuNf4f2kyPT7VG6aTvGZ49kE7fmwLztakWrIJi6lOb
   6UpQf0rletHPfOC2uxpi8S6gHPBG7m9VvNug3SWhTYMng4D7mIgI8176c
   tjKoAIMzLarWqqhtT1D1mai59vCITS0oVP+5RPL5V7dQPRAPmTbvUMKix
   I=;
In-Reply-To: <20170904205521.GA14891@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Yes, that is correct.  The first byte of the payload needs to be read not a=
 field in a the protocol defined header..=20

>OK, so it's just an arbitrary byte. Not anything in a standard header that=
 needs to be matched.

>I'm asking because we could add the protocol definition for what you need,=
 so we don't need to use raw expressions.

Thanks,
Raul
