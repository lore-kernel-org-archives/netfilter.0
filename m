From: "Igor M Podlesny" <for.poige+linux.nf@gmail.com>
Subject: Netfilter "sees" locally originated multicast traffic as external-incoming one
Date: Sun, 23 Mar 2008 21:49:54 +0700
Message-ID: <43d009740803230749v34f5e609k434487dc222220f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=47KWsYImvHpGuoDFSoQntbRNga4h65mebsewEojH03w=;
        b=LWt32lUFosZ/OeXUzH6QuJUD8Xdaq8NHaELOklvY5ALivnP+IP+viVxT4wPTX9o3FbL/gLg7ipHKEecCex7FSjvbRpv3O/yJ+vFaz5+rc16lb7hOFzr8AofWtV2wakt0UJ6a9olJH7ILcwFxmBQa+mTrLYISAT+FcsrhvsN5pU8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

Recently my home network got additional network connection, so I
decided to try using Zebra to see if the whole set-up would be simpler
and easier to maintain. During the test period I've noticed that
Netfilter "sees" locally originated multicast traffic as
external-incoming one:

	[125488.045542] RAW: M: IN=eth3 OUT= MAC= SRC=172.19.20.2
DST=224.0.0.9 LEN=512 TOS=0x10 PREC=0x00 TTL=1 ID=0 DF PROTO=UDP
SPT=520 DPT=520 LEN=492

	(Caught with such set-up:
	*raw
	-A PREROUTING -d 224.0.0.9/32 -i eth3 -m pkttype --pkt-type multicast
-j LOG --log-prefix "RAW: M: " --log-ip-options)
	
IP-addr. "172.19.20.2" is a local one; it's assigned to interface "eth3".

I'm not sure neither whether is this a bug or "feature" nor is this
Netfilter's bug/feature at all -- more likely it's the kernel's issue.
May be it's due to RIPv2/Zebra's "glitches"(?). What would you say?

-- 
End of message. Next message?
