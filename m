From: Arthur Titeica <arthur@psw.ro>
Subject: nfacct + ipset usage
Date: Sun, 04 Nov 2012 20:03:36 +0200
Message-ID: <8053765.UAHfcTIRLq@lhart>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=psw.ro; h=
	user-agent:content-type:content-type:content-transfer-encoding
	:mime-version:organization:message-id:date:date:subject:subject
	:from:from:received; s=mail; t=1352052217; bh=mGqfqHsxYVT+7SNRGs
	T1nVHaP0DZUewh6yY3IuQD9bY=; b=JESmjDDn3iM+WbFQS6FT1i7KqXpt3Fo5+H
	MKVlPtELZ8KVn/LoQdAOQr4W59iH7M5/euSKm7TItdNZiIDkNrw9/IbR2Zz5FsZ3
	a++uwOWleYzAQb/v3mNeh3QEQombuYzWIGaY8nj8F2cPRE3ro9Ziq5E205VKSdEs
	TsZ3vQ1sM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,

I'm trying to get some numbers regarding the usage of certain services (vnc 
and samba). For this I've created 2 accounting objects with nfacct and used 
the bellow iptables rules.

# nfacct add vnc-test
# nfacct add smb-test
# iptables -A FORWARD -m set --match-set test src \
                    -m set --match-set test dst \
                    -m nfacct --nfacct-name vnc-test \
                    -p tcp --dport 5900:5902

# iptables -A FORWARD -m set --match-set test src \
                    -m set --match-set test dst \
                    -m nfacct --nfacct-name smb-test \
                    -p udp -m multiport --dports 137,138

# iptables -A FORWARD -m set --match-set test src \
                    -m set --match-set test dst \
                    -m nfacct --nfacct-name smb-test \
                    -p tcp -m multiport --dports 139,445

However, something seems wrong as I get the same numbers for both objects:

{ pkts = 00000000000000040947, bytes = 00000000000036315309 } = vnc-test;
{ pkts = 00000000000000040947, bytes = 00000000000036315309 } = smb-test;

Is there something I'm missing?

nfacct v1.0.0
iptables v1.4.16.2
kernek 3.6.5

Thank you!

-- 
Arthur Titeica
