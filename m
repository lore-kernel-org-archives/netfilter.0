From: JeHo Park <linuxpark@gmail.com>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Mon, 31 Jan 2011 11:47:38 +0900
Message-ID: <AANLkTikxZf8zMJxRTGg6BS4uc0PDus+E6cEtfLDQRTQu@mail.gmail.com>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>
	<alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr>
	<AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com>
	<alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XnK9dZOVOgK2BKA6X834ad3AxFkq2nBFgiJ2f465dl4=;
        b=vKHFTyIStgQ66CNs9CfgHotHIj9ZmZnaWmW7tm/zobjF8ppBQGO8YUDOQDqeMl2v8j
         7wCBdIvamE9anXfD5wrKYB1eEA2MgzNIz8QFB5npMdgpwX4PsjOslCa3NT0h9fmBD34t
         YJSsLsSohFL/nz7a40Cv9dbbMGHVhYLu8YVRs=
In-Reply-To: <alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

hello jan
i see, i took mistake. Ccs.. :-)
anyway, i wonder why there is no TCP payload in the skb of the string
or wurl match.


On Mon, Jan 31, 2011 at 11:38 AM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> *sigh* don't strip the Ccs
>
> On Monday 2011-01-31 03:24, JeHo Park wrote:
>>On Mon, Jan 31, 2011 at 11:09 AM, Jan Engelhardt <jengelh@medozas.de>=
 wrote:
>>> On Monday 2011-01-31 02:53, JeHo Park wrote:
>>>>
>>>>the string match works well in filter table, but it does not work i=
n NAT.
>>>
>>> Oh it _does_ work in nat.
>>>
>>> But given that the nat table is an abstract configuration database
>>> rather than a filter, not all packets do a lookup.
>>
>>but i found in runtime with debugging code, there is no TCP data but
>>only TCP header in the skbuff of string match.
>
> Good, then this issue is resolved.
>
>
>>>>i used following iptables rules
>>>># =C2=A0iptables -A PREROUTING -t nat -p tcp --dport 80 -m string -=
-string
>>>>"goole.com" --algo bm -j DNAT --to-destination 10.10.10.125:80
>
>
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
