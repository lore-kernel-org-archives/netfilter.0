From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: HFSC scheduling and Linux vlans
Date: Sat, 18 Jul 2009 07:56:10 -0600
Message-ID: <bf0e93a30907180656i7f1d6b9cs725c1bbf88ebc132@mail.gmail.com>
References: <bf0e93a30907172138lea3f7efu9656f58e360a64eb@mail.gmail.com>
	 <4A616A0C.4000005@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2afnkcMwCZT1QbA89H/tTNxjLexZXzL+k5+/8GOgS6g=;
        b=TFDx2qk/ruB56C1IW4scDK8499apYUVxal3m0rzSSSaz6qljyQoZ4w1JbZWtVlmG0T
         hmBxQzyMPLa6Gg/xyEVvSf7uUbRJM1xv178g4TYvitoW3CE9QVIXQNcSlFrjtnqd522L
         ldXEQLDlhTWEEoVOM1dLT55EKwm2rcyoAqsa8=
In-Reply-To: <4A616A0C.4000005@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Thanks for your answer.

Can you provide me, please, an example?

Thanks again,

Jorge D=E1vila.

2009/7/18 Patrick McHardy <kaber@trash.net>:
> Jorge D=E1vila wrote:
>> The actual configuration works using HTB scheduling but when I tried
>> apply the HFSC configuration there is no traffic through any
>> interfaces.
>>
>> This is the output
>>
>> tc -s filter show dev eth1; tc -s class show dev eth1
>> filter parent 1: protocol ip pref 1 fw
>> filter parent 1: protocol ip pref 1 fw handle 0x17 classid 1:23
>> filter parent 1: protocol ip pref 1 fw handle 0x30 classid 1:48
>> filter parent 1: protocol ip pref 2 fw
>> filter parent 1: protocol ip pref 2 fw handle 0x10 classid 1:16
>> filter parent 1: protocol ip pref 3 fw
>> filter parent 1: protocol ip pref 3 fw handle 0x20 classid 1:32
>> filter parent 1: protocol ip pref 3 fw handle 0x80 classid 1:128
>> filter parent 1: protocol ip pref 4 fw
>> filter parent 1: protocol ip pref 4 fw handle 0x5 classid 1:5
>> filter parent 1: protocol ip pref 4 fw handle 0x15 classid 1:21
>> filter parent 1: protocol ip pref 6 fw
>> filter parent 1: protocol ip pref 6 fw handle 0x4 classid 1:4
>> filter parent 1: protocol ip pref 6 fw handle 0x6 classid 1:6
>> filter parent 1: protocol ip pref 6 fw handle 0x9 classid 1:9
>> filter parent 1: protocol ip pref 7 fw
>> filter parent 1: protocol ip pref 7 fw handle 0x2 classid 1:102
>> filter parent 1: protocol ip pref 7 fw handle 0x3 classid 1:3
>> filter parent 1: protocol ip pref 7 fw handle 0x7 classid 1:7
>> filter parent 1: protocol ip pref 7 fw handle 0x8 classid 1:8
>> filter parent 1: protocol ip pref 7 fw handle 0xa classid 1:10
>> filter parent 1: protocol ip pref 7 fw handle 0xe classid 1:14
>> filter parent 1: protocol ip pref 7 fw handle 0x11 classid 1:17
>> filter parent 1: protocol ip pref 7 fw handle 0x13 classid 1:19
>
> You're missing arp classification.
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
