From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: Re: What's going on with my iptables?
Date: Tue, 4 May 2010 23:47:43 +0200
Message-ID: <386cc9f2ced35df490a3d79ffbab7c85.squirrel@webmail.vp44.net>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
    <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
    <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
    <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
    <o2w812495871005040845n42ce6963v8c2b12ecc8b24a38@mail.gmail.com>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vp44.com; h=message-id
	:in-reply-to:references:date:subject:from:to:cc:reply-to
	:mime-version:content-type:content-transfer-encoding; s=sel1;
	 bh=wyKtnjKSTpK2QeEDRrTc3ssb1tg=; b=sh5F1nsiYxBmi/vVrj7+Xob/Suln
	PxvBGSVdCd2v7TCWuTzfFF5apvnX3ZpguNoPkLh7IRg+HDd/AK/UdFjnvZdgAN0c
	MOREXnP+Q/xXh/hVrG5rQPbwr1bZragJ8rN224kKT6cwI4bSbofYVcF12xgu5vpt
	vitA5MX8Ei0gJVs=
In-Reply-To: <o2w812495871005040845n42ce6963v8c2b12ecc8b24a38@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Prochazka <billprozac@gmail.com>
Cc: Gary Smith <gary.smith@holdstead.com>, "jknowlton@vp44.com" <jknowlton@vp44.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, May 4, 2010 5:45 pm, Bill Prochazka wrote:
> Hmmm, not necessarily.  I don't see a drop rule on the OUTPUT chain
> and the default policy is ACCEPT.  The first packet in the posted log
> goes out fine (hence the ICMP reply).
>
> Take a look at your logs.  You have an outbound ICMP Echo (type 8)
> going to the internet through eth1. You then have a reply (Type 0)
> coming back in through...eth0?!?!  You have something really funky
> going on here.  Your rule allowing related and established traffic
> only applies to the external interface, as it should, but something
> else is going on that is delivering the traffic to your inside
> interface.
>
> On Tue, May 4, 2010 at 11:03 AM, Gary Smith <gary.smith@holdstead.com=
>
> wrote:
>>> Thanks Gary.
>>> I went ahead with your suggestion but I still can't seem to figure =
out
>>> where the problem is.
>>> For example, this is me trying to ping google.com from the shell:
>>>
>>> [220040.098711] FW: IN=3D OUT=3Deth1 SRC=3DMYPUBIP DST=3D72.14.234.=
104 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DICMP TYPE=3D8 COD=
E=3D0 ID=3D871
>>> SEQ=3D14
>>>
>>> [...]
>>>
>>> [220040.342816] FW: IN=3Deth0 OUT=3D
>>> MAC=3D00:03:47:42:5c:17:00:04:ed:99:2c:fb:08:00 SRC=3D72.14.234.104
>>> DST=3DMYPUBIP LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D48058 P=
ROTO=3DICMP TYPE=3D0
>>> CODE=3D0 ID=3D871 SEQ=3D14
>>>
>>>
>>> It all seems to be pretty kosher (except for the fact that the pack=
ets
>>> are
>>> being dropped)..
>>
>>
>> You are dropping outgoing packets. =A0Stop doing that :). =A0Unless =
you are
>> ultra paranoid about traffic originating from your firewall, there i=
s no
>> need to drop OUTPUT. =A0IMHO, the OUTPUT chain is useful for when yo=
u need
>> to block specific outgoing traffic in a certain manner, say, port 25=
, to
>> make sure that all mail flows through a specific server on your netw=
ork
>> for compliance, etc. =A0Or in the case of proxying, where you want t=
o
>> ensure that all traffic going to port 80 goes through the proxy and =
only
>> the proxy can go out.
>>
>> In essence, you are saying, do let my requests go out...
>>
>> Then, for the input chain, make sure you have a rule to allow
>> established and related connections to come in (and to be forwarded)=
 and
>> then return packets that originated from your network should be able=
 to
>> return just fine.
>>
>> -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
>> -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>>
>> Give that a try.
>> --


That actually makes sense. But Gary's solution worked and both forwardi=
ng
from LAN & local transmission are ok. (I still have troubles with
forwarding tho)

What puzzles me the most is that I had been running that same iptables
setup for years without problems..then one day BHAM! it just stopped
working

-JK

