From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: Iptables v1.4.4 + kernel 2.6.31 mangle marking changed?
Date: Wed, 11 Nov 2009 08:33:15 +0000
Message-ID: <56378e320911110033n49d923c0x1ae5850abd560ea6@mail.gmail.com>
References: <4AF0CF8C.7000602@deboom.biz> <4AF1628D.5080401@trash.net>
	 <4AF17E57.2060206@deboom.biz> <4AF18B57.6060707@trash.net>
	 <4AF1A397.90806@deboom.biz>
	 <56378e320911050352p64455be8ga21655668c361d95@mail.gmail.com>
	 <4AF310FC.1060505@deboom.biz> <4AF9A417.4080005@deboom.biz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type;
        bh=AsjcEcZmgmmG3cz9LMyu9b1wdEp9UjEzVh0VCskiVUw=;
        b=Y97jOWzrjYMJX94pYqEWXurG0beQacuC2xoh0W3mtDQACRQ/a08ML9oqEFmUv+mBW5
         FH77HOjuHrljMHgPMY0c5Eq3UEXFTY4oRMTDZfYqBPo8zGvfJLRTpPzI32p8Rj1LlQny
         mF/HPpSvvVzsfDCB9qYH1C4+tTZLIg87BRsWo=
In-Reply-To: <4AF9A417.4080005@deboom.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2009/11/10 Ralph de Boom <lkml@deboom.biz>:
> Ralph de Boom schreef:
Nov  5 18:48:14 sakura kernel: [  194.028598] TRACE:
filter:FORWARD:rule:1 IN=eth1 OUT=eth0 SRC=192.168.1.30
DST=81.4.97.160 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=13005 DF
PROTO=TCP SPT=52436 DPT=80 SEQ=2949910603 ACK=0 WINDOW=8192 RES=0x00
SYN URGP=0 OPT (0204116C01010402) MARK=0x1

Ralph, only the entry above is from one of your iptable rules which
looks like the rules you are using to carry out the packet
mangling/nat/etc are not being hit - all the others are 'policy'
entries which are basically just saying oh look I went via 'x using
chain y'....



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
