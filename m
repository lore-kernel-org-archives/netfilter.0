From: Daniel <tech@tootai.net>
Subject: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 15:53:50 +0200
Message-ID: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629294831; bh=NNFbniWsRZ4bQoUW3WgxP7coM6zIAEP/1rz9A5BaaBU=;
        h=To:From:Subject:Date:From;
        b=F4ejeADoy73ckcBQbj+jRi8Lzhz4qdb9FuB9+Zb4xRptVv1hmTc2CYTlzfLO6ET3V
         OGCvZgwh7xkUmoB46TN4B/LwFHXs4bGdkl0I3+oBMEyZ/8rNCGRmYG9MPbgN0In4z3
         9IcfHlLz2mbECw2sJZqxUVFJLhLDtrShmmy6ssTQ=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629294830; bh=NNFbniWsRZ4bQoUW3WgxP7coM6zIAEP/1rz9A5BaaBU=;
        h=To:From:Subject:Date:From;
        b=tdNGzjOO+8PhbPWjAhyTV6xcUVBXCyxc6YW2YuiBRxXpN6XqW+/TcF1Djqku661L/
         rG+V2R4ADlLAgVlgp5I0r9jQAGrdmiQ/WU6dqbjlYG5EZ19ilNbrqEs4nAUMxXgrzv
         L0iOsY4EDmVqh9vgCXjY+Q2fMYSenhYIImrULFwc=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

how on a NAT firewall server using iptables or nftables, are the 
external source ports choosen ? I would say range is 1024-65535 but if 
for instance I use port 5060 for SIP this one can not be used as source 
port. Is there a table of at time used ports ?

Also, SNOM phones are systematically using port 2048 as source port of 
the WAN ip. Is there a mechanism to allow such behavior ?

If you know any good documentation about this (without reading source 
code ;)) will also be accepted :)

Thanks for your great job
-- 
Daniel
