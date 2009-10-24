From: Payam Chychi <pchychi@gmail.com>
Subject: Re: ssh connections stalling
Date: Sat, 24 Oct 2009 00:21:11 -0700
Message-ID: <f08c15d10910240021w64d9cd33i93a989b0b7fbf7b@mail.gmail.com>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
	 <4AE163B6.9040706@chello.at>
	 <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca>
	 <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
	 <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
	 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu>
	 <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
	 <alpine.LNX.2.00.0910232336420.29761@tesla>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Qv9mHdi1hZEHWDq07Rnfj4pqunC5K/N4XnlX5XJ7M28=;
        b=RDiupiiCkdnoYfX1Ez2B8Fl+j0CyenJJjxtBrA1s8jP0Z4J58OCscbQLOaLV9PFxy+
         6xoN3K4ygSkpKHwL3voh/qUWhfhKqytZlpRVVa1EVKUfK1TGcQoKuhqSRydUL61OD1uC
         AZOUnZYioY4wTM6EgXLjNadPf9UaLd42QZvJk=
In-Reply-To: <alpine.LNX.2.00.0910232336420.29761@tesla>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org

On Fri, Oct 23, 2009 at 11:44 PM, Carl Michal <michal@physics.ubc.ca> w=
rote:
> Eegads,
>
> so logging the invalid packets (strangely setting ip_conntrack_log_in=
valid
> to 1 didn't actually produce the logs, I had to bypass the check for
> LOG_INVALID in nf_conntrack_proto_tcp.c and recompile...) gives:
>
> Oct 23 23:35:00 spider nf_ct_tcp: ACK is over the upper bound (ACKed =
data
> not seen yet) IN=3D OUT=3D SRC=3D142.103.236.11 DST=3D142.103.235.177=
 LEN=3D52
> TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D10722 DF PROTO=3DTCP SPT=3D44574=
 DPT=3D22
> SEQ=3D3218503158 ACK=3D2892721343 WINDOW=3D24840 RES=3D0x00 ACK URGP=3D=
0 OPT
> (0101050ACCFD9D1FCCFDA283)
> Oct 23 23:35:00 spider nf_ct_tcp: ACK is over the upper bound (ACKed =
data
> not seen yet) IN=3D OUT=3D SRC=3D142.103.236.11 DST=3D142.103.235.177=
 LEN=3D52
> TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D10723 DF PROTO=3DTCP SPT=3D44574=
 DPT=3D22
> SEQ=3D3218503158 ACK=3D2892721343 WINDOW=3D24840 RES=3D0x00 ACK URGP=3D=
0 OPT
> (0101050ACCFD9D1FCCFDA7E7)
>
> but how can that be? =A0in the dumps posted earlier, the data had gon=
e
> through? =A0Hadn't it?
>
> Carl
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

To be honest im not sure, i didnt have much time to review your entire
dump though i did see mass ack/push in the logs. I can spend some time
this weekend but it really sounds like your packets are going to the
wrong place/device or being dropped somewhere and thats why tcp is not
being very reliable.

have you tried looking at the network layer? look at your layer3 and
see if there are any packet loss on either end during the time where
ssh is breaking.
btw, UBC? nice ... I went to BCIT ;)
--=20
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
