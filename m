From: Jan Rovner <jan.rovner@diadema.cz>
Subject: HW accelerated DPI hardware and software for module x86 ?
Date: Sun, 29 Oct 2017 12:49:48 +0000
Message-ID: <bfffd78fbd2f4db6b4944092983124c2@diadema.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

sorry for a little offtopic, however I am looking for a functional hardware and software module for 
PC (x86) platform that would allow to perform packet content inspection via (ip)tables match.

Something like xt_layer7 or xt_string, but L7/REGEX matching to done by hardware offload... 

Probably a PCIe NIC card with proper drivers and some custom iptables module is what I am looking for.

Any recommendations or other solutions for x86 are welcome.

Thank you very much.

Jan


