From: Padmanabhan <rpdumps@gmail.com>
Subject: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 01:15:19 -0500
Message-ID: <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=LwlwdhPzmYZX7mT4T30Zp6XtQwa5FlJttxVvNGMXpQw=;
        b=HPAkf+9zbz9SFeclkNveoEVCaINCbo8Xnb5MNVLkxoXSoTMzc9XlCGWYE9gaC7FB4u
         T81zFp0pfhuez3YOWAQM3wR6pmcyaxYKpcU8yK8NVBSTgt8FPeS6GytH1KQBBPOf37UD
         U3n9JnLWKXCqe4HzbzzGKl4BygblOnS2snB3o=
In-Reply-To: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,
I am couple of questions on whether iptables can used to achieve my requirement.

Test Setup
Two Fedora core 9 ( kernel 2.6.25.6-55) systems running Intel 2 core
duo processor as iSCSI initiator/target connected via Gig Ethernet
switch
IP Tables v 1.4.0

Requirement
On the target system, I have to look for packets that have TOS bits
set and in those packets, I have look beyond the TCP header i.e. into
iSCSI header for specific values.
In this case, i am looking for iSCSI read command( first byte) and
notedown ITT value ( 4 bytes, from 16-19 )

I studied manual pages and I am not sure whetehr IP tables/u32/ulog
can help me to achieve me this requirement.

Questions
1. I just need to pull out few bytes out from the packet and log it.
2. Whether ulog can record only few bytes or interested bytes in the paylod ??

Thanks in advance for your suggestions

Regards
Padmanabhan
