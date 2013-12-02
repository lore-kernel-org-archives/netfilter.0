From: Olaf Zaplinski <oz42@oz42.eu>
Subject: packets rejected as invalid, =?UTF-8?Q?why=3F?=
Date: Mon, 02 Dec 2013 14:43:14 +0100
Message-ID: <1c23a9c49af4cca75004123c0166f546@mail.zaplinski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oz42.eu; s=20131022;
	t=1385991794; bh=9NvjARX0lGOtcdsFtGm8Uqr6EcWRy4hMgAitn0QEHa0=;
	h=Date:From:To:Subject;
	b=PsTYaLGtbDaK3Hjxvl4Ofrbjz5V9SCRW6B77ihCRFmX1KRrQem4tEO9xr1PXPnORz
	 nVVlefUH0eQ6PrLY8Id7Rj7A0zNpzUXM3nu8ETKj15YqqjfcTvnoF2b4j0E1W4xuqV
	 bQ70/XwFj+diTmFFZhQBLaQTx/jeLNMRNk09aI6dOm304u8W5MWOqsuY+gfg0KIDKW
	 X1m6+N+26iF2Y5+q4FEU4ksFYBevmTm09PZ6FBnk7CL2mrkk5tpbrMv1wlQ4FqpFPL
	 +RCpc03H1Nyc2j24VbTM+jpCcdRggMzHg/0siur3bjyFa4OPbhFC0nckwnMY0Og+5e
	 vT21Igk/fAY2Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello all,

since Dec. 1st I see 60 rejected packets from well known and "good" 
SMTP hosts:

Dec  2 12:12:02 binky kernel: [873572.327219] iptables-INVALID IN=eth0 
OUT= MAC=00:f1:70:00:58:f0:fc:fb:fb:2d:55:48:08:00 SRC=213.165.67.104 
DST=109.75.188.214 LEN=40 TOS=0x00 PREC=0x00 TTL=58 ID=0 DF PROTO=TCP 
SPT=25 DPT=37022 SEQ=3171195917 ACK=0 WINDOW=0 RES=0x00 RST URGP=0

Why are these logged and rejected?

The rules:

$IPTABLES -A INPUT -m conntrack --ctstate INVALID -m limit \
--limit 3/s -j LOG --log-prefix="iptables-INVALID " \
--log-tcp-sequence --log-tcp-options

$IPTABLES -A INPUT -m conntrack --ctstate INVALID -j DROP

I think this packet was part of the TCP closing handshake, so it should 
have been ESTABLISHED and not INVALID. Am I wrong?

Olaf
