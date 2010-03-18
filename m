From: Angel Motta <angelmotta@gmail.com>
Subject: Re: Rules PREROUTING doesn't work
Date: Thu, 18 Mar 2010 00:53:36 -0500
Message-ID: <1c1b5a0f1003172253s415bb886j15c5339ba1657876@mail.gmail.com>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
	 <hnqkk4$62v$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>
	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
	 <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
	 <hnrrke$d0$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
	 <hnsba3$50s$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=znS4kAmSBArxphyBB7izplI/62K4ZAXxKDKVtgOHI8c=;
        b=LF8ezMOE7Wo0rBs0p/xvQbbs45lkRt3thZuxE3E7+D9cpGCRh8WshJtGNm9yZ/8ZsO
         W9xK5fFMDtxfckNFC/Rh7exYcwvqhZR2qy0ZHe2JDSNsK56gJIQkntC8nmvx7fiS7mVk
         CBvWcEggzbsZIT3TZB7Qi6W6MFaKQDmNWk84o=
In-Reply-To: <hnsba3$50s$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@vger.kernel.org

Hi Robert and List
Actually, the rule PRERUOTING isn't matching, and I remember be with
this problem about 5minutes and the clients vpn still atemp conect to
the Firewall, but something strange happened, only one tun vpn,
reconect automatically to the new servervpn behind the Firewall but
the rest did not conected.(about 50 vpn client.)

One question, I donde have that file
/proc/sys/net/netfilter/nf_conntrack_udp_timeout*
I don't have netfilter directory, where is that ??

Thanks for the assistance
--
Angel

2010/3/17 Robert Nichols <rnicholsNOSPAM@comcast.net>:
> On 03/17/2010 08:14 PM, Jan Engelhardt wrote:
>>
>> On Thursday 2010-03-18 01:20, Robert Nichols wrote:
>>>
>>> And, I just noticed that the protocol is UDP. =A0The only way a UDP
>>> entry gets removed from conntrack is by timing out, and that can ta=
ke
>>> up to 3 minutes (see the values in
>>> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*).
>>
>> No, that is not the only way. You can manually remove entries
>> with `conntrack -D ...`.
>
> Yes, I should have said, "... gets removed _automatically_ ...".
>
> --
> Bob Nichols =A0 =A0 "NOSPAM" is really part of my email address.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Do NOT delete it.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Atte
Angel Motta Paz
