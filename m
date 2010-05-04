From: Bill Prochazka <billprozac@gmail.com>
Subject: Re: What's going on with my iptables?
Date: Tue, 4 May 2010 11:45:50 -0400
Message-ID: <o2w812495871005040845n42ce6963v8c2b12ecc8b24a38@mail.gmail.com>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
	 <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
	 <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
	 <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=mSRbUqe7Rcl1ztG7DtfxSUpxC68R64o+Y1ZX4Mp5cNs=;
        b=ERY4th6LG3GIymRgdj62SQul2cBrHf2oTbbwmK1FzKblYIR09CEVzu4EvSXK3ckYXE
         bCWJ5GcQS7aijWpkIOLjPYkj6LUIkP189vWaG7ro+kswbSyOxTY5N63qoMwmLXaTUkzB
         fsxD2XQL12qsxTgCkqT98iHgxMFVN3n8ieCO4=
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gary Smith <gary.smith@holdstead.com>
Cc: "jknowlton@vp44.com" <jknowlton@vp44.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hmmm, not necessarily.  I don't see a drop rule on the OUTPUT chain
and the default policy is ACCEPT.  The first packet in the posted log
goes out fine (hence the ICMP reply).

Take a look at your logs.  You have an outbound ICMP Echo (type 8)
going to the internet through eth1. You then have a reply (Type 0)
coming back in through...eth0?!?!  You have something really funky
going on here.  Your rule allowing related and established traffic
only applies to the external interface, as it should, but something
else is going on that is delivering the traffic to your inside
interface.

On Tue, May 4, 2010 at 11:03 AM, Gary Smith <gary.smith@holdstead.com> =
wrote:
>> Thanks Gary.
>> I went ahead with your suggestion but I still can't seem to figure o=
ut
>> where the problem is.
>> For example, this is me trying to ping google.com from the shell:
>>
>> [220040.098711] FW: IN=3D OUT=3Deth1 SRC=3DMYPUBIP DST=3D72.14.234.1=
04 LEN=3D84
>> TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DICMP TYPE=3D8 CODE=
=3D0 ID=3D871 SEQ=3D14
>>
>> [...]
>>
>> [220040.342816] FW: IN=3Deth0 OUT=3D
>> MAC=3D00:03:47:42:5c:17:00:04:ed:99:2c:fb:08:00 SRC=3D72.14.234.104
>> DST=3DMYPUBIP LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D48058 PR=
OTO=3DICMP TYPE=3D0
>> CODE=3D0 ID=3D871 SEQ=3D14
>>
>>
>> It all seems to be pretty kosher (except for the fact that the packe=
ts are
>> being dropped)..
>
>
> You are dropping outgoing packets. =A0Stop doing that :). =A0Unless y=
ou are ultra paranoid about traffic originating from your firewall, the=
re is no need to drop OUTPUT. =A0IMHO, the OUTPUT chain is useful for w=
hen you need to block specific outgoing traffic in a certain manner, sa=
y, port 25, to make sure that all mail flows through a specific server =
on your network for compliance, etc. =A0Or in the case of proxying, whe=
re you want to ensure that all traffic going to port 80 goes through th=
e proxy and only the proxy can go out.
>
> In essence, you are saying, do let my requests go out...
>
> Then, for the input chain, make sure you have a rule to allow establi=
shed and related connections to come in (and to be forwarded) and then =
return packets that originated from your network should be able to retu=
rn just fine.
>
> -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
> -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>
> Give that a try.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
