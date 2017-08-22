From: "Walter H." <walter.h@mathemainzel.info>
Subject: IPv6: unknown packet logged ...
Date: Tue, 22 Aug 2017 16:42:19 +0200
Message-ID: <f1a8f3cdd11c6f2fa7a5946a0cf4c66f.1503412939@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=F+Nsg4xAZnci+SIH6cXzX2kcj2nftMeCJpUCpZbZ9Eo=;
        b=VsjwKM/d2cMSJi1EeyDWizHmk5Ff/kS/C1oTBf5FE2DehRL/JUo+D8KfzTw6V6BMOrrSlT2gf/KuBwU8oYY1AZ4pUo7ytL3nvVDHN3qDWH4YNC6fsw6IlFbCg2Vh0IAf2OCmSDpcE9p3s7ts1n4FjRQXamBkoWNUr5iu08ovibM=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have these rules at the beginning of /etc/sysconfig/ip6tables

# Filter all packets with state INVALID
-A INPUT -m state --state INVALID -j DROP
-A FORWARD -m state --state INVALID -j DROP
-A OUTPUT -m state --state INVALID -j DROP

and on bottom these rules:

# Log all other
-A INPUT -j LOG --log-prefix "IPv6[IN]: " --log-level 7
-A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
-A OUTPUT -j LOG --log-prefix "IPv6[OUT]: " --log-level 7

which rule would have catched these logged packets:

[70223.386265] IPv6[FWD]: IN=sit1 OUT=br0
SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
HOPLIMIT=60 FLOWLBL=617912 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
RES=0x00 ACK PSH URGP=0
[70232.150311] IPv6[FWD]: IN=sit1 OUT=br0
SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
HOPLIMIT=60 FLOWLBL=949795 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
RES=0x00 ACK PSH URGP=0
[70249.740932] IPv6[FWD]: IN=sit1 OUT=br0
SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
HOPLIMIT=60 FLOWLBL=811062 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
RES=0x00 ACK PSH URGP=0

Thanks,
Walter

