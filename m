From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 14:01:26 -0200
Message-ID: <566c44d8.c17b810a.f320.ffffdbb2@mx.google.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
	<566BEF33.7090501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=EiUOb6q811KOoIHHGTmvsl3hNqwOaGlLMaaTxjgu7Ac=;
        b=CCk0SPqd7Cgqkuh8dKntYTJON7IxrlbRiwL3YXYWjer4fpnOwmPudFj+kMuiF0jJhb
         CQaUq6Ue8WEsk+XABd88/80t2wqe8SinFQPGI+x0e9Qa7Rxxvnj8/SWAbKkQxEU3mdy7
         VKwhs4/HLqHzOL2B2pVdjbpf9K3yo3qoD/eCiL55qn/iwrovUu90m/974Ss5iU3CwteL
         ujH8kYW3InDuLMmbjl7dlNArfnCu0KHFz2ROZ1xlnbJRaRW7Rx4oDY9+/fwTSS5HdkFE
         mHE6cbY4XNdoZ73+9KD7CgtMHXQR9AeGT9/SnxMM2MOZY4NyVsJDhhkRZeoXty7d70ol
         9NVw==
In-Reply-To: <566BEF33.7090501@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 12 Dec 2015 11:56:03 +0200
Remzi AKY=C3=9CZ <linuxliste@gmail.com> wrote:

> Please use with -p tcp
>=20
> iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCE=
PT

	I tried that, but it returns the same error:

iptables: Protocol wrong type for socket.

	Something has changed between kernel 4.3.0 and 4.3.1. Am I
missing something? Maybe some module isn't loading?

	I noticed the xt_state module isn't loading automatically, but
even if I manually load it, I get the same error.

--=20
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
