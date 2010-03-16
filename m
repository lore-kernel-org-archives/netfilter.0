From: Julien Vehent <julien@linuxwall.info>
Subject: TBF parameters: overhead and linklayer =?UTF-8?Q?=3F?=
Date: Tue, 16 Mar 2010 07:47:45 +0100
Message-ID: <26ebdce5177a0bf0b47245b90e6b526c@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:date:from:to:subject:message-id:content-type:
	content-transfer-encoding; s=lnw-dkim; bh=HdhxnUUnwlSYdl+rflkVVj
	WGcHZSLzC68DuaXMsJSI4=; b=oPtrUfMxeWKRuDtkDmRj1Jtq3ucXeX6stTsjUc
	P+Beml5+2WRRzT+DObFGePIaQDz200flAsxMOkEGEOObzA2IopLJ0ri4Acqp0fvv
	/fEIqg6+ddFtp+dKUbwQKia9kZIfSbKJhj2s7ei69QBMSzsw4Vo4TaTo/m/SQ3uh
	3JLkE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>


Hello guys,

I tried to ask this on netdev, but without luck. Maybe somebody will know
the answer here.

TC_TBF man page seem outdated (even in latest version of iproute2) and
doesn't explain what those two parameters do:

# tc qdisc add tbf help
Usage: ... tbf limit BYTES burst BYTES[/BYTES] rate KBPS [ mtu
BYTES[/BYTES] ]
        [ peakrate KBPS ] [ latency TIME ] [ overhead BYTES ] [ linklayer
TYPE ]


 - overhead ?
 - linklayer ?

Or did I miss something in the code/manpages?


Thanks,
Julien
--
To unsubscribe from this list: send the line "unsubscribe netdev" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
