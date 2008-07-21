From: Padmanabhan <rpdumps@gmail.com>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 11:41:29 -0500
Message-ID: <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>
	 <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>
	 <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>
	 <4884ADDC.7000600@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=5jDI6UitHRs/wo98tgRrpJXOUEpMWgPyxNYyZfHbPss=;
        b=KXfjnAFsaGjRSOC3isaFk47LgvT15fX0/UdXsHrW3ZMNtDROwIJQdc56dZpeRTsFye
         I1Ei8ttDQPoDlAgtu/YFm5cO12TnY5BdVBboxxkujhUtI4I0c5eotkpKUXBQlGVPaicp
         ROufVhX+l+oD4FRKOf3EK1rPzZUBX34LTB0zc=
In-Reply-To: <4884ADDC.7000600@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, Jan,
I came up with following  u32 rule ,,should I not multiply by 4 for
TCP header length to get the offset , as we do for the IP header ?

iptables -m u32 --u32 " 0>>22&0x3C@12>>26&0x3C@0&0xFF000000=0x01
&&
0>>22&0x3C@12>>26&0x3C@16=0x00000000:0xFFFFFFFF" -j ulog

for TOS bits set packet, I am inspecting first byte of TCP payload and
if that matches, need to record/log value from 16-19 in the TCP
payload. Since a test has to be made, i just compared those byte value
to be in the range of all 0's to all FF's.. which obviously it would
be ...So, with this test done, the action I would like to do is log
those four byte value .

1. My requirement is as stated by Grant, just need to log those four
bytes ( ITT value) from the iscsi header. Is there any options in
linux space ? With u32 I came so close, yet it was not able to fulfill
it.

2. I tried ulog, to provide a option to log interested bytes,, Will cp
range provide first few bytes of the packet say 100 bytes ?
Can i use this option instead of 0 ? ( caution in the man page says to
leave it to 0)

Thanks again ,,
Padmanabhan
