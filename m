From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: help with whitelist
Date: Tue, 10 Feb 2009 16:06:31 +0100
Message-ID: <499197F7.10502@freemail.hu>
References: <000001c98af5$d31f3c30$795db490$@net> <49919410.9040906@freemail.hu> <000101c98b90$1112b540$33381fc0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000101c98b90$1112b540$33381fc0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joey <Joey@Web56.net>
Cc: IPTables <netfilter@vger.kernel.org>

Hi,

Okay...
Try again... :D

:LOGDROP_ASIAN - [0:0]

-A LOGDROP_ASIAN -j LOG --log-prefix "SPAM-BLOCK-CIDR-ASIAN"

-A LOGDROP_ASIAN -j DROP

:SMTP_TRAFFIC - [0:0]

-A SMTP_TRAFFIC -s 2.3.4.5 -j LOGDROP_ASIAN

-A INPUT -p tcp -m tcp --dport 25 -m state --state NEW -j SMTP_TRAFFIC


You can check the state (matching packets) with this command:

iptables -vnL

Swifty


