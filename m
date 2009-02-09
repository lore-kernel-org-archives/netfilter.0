From: "Joey" <Joey@Web56.net>
Subject: help with whitelist
Date: Mon, 9 Feb 2009 15:34:34 -0500
Message-ID: <000001c98af5$d31f3c30$795db490$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

Hello All,

 

Im having a problem with a whitelist I am trying to implement and apparently
we still block IP's on the whitelist.

 

First I execute the whitelist like so:

 

:CIDR-WHITE-LIST - [0:0]

:LOG_WHITE-LIST - [0:0]

-A CIDR-WHITE-LIST -s 1.2.3.4 -j LOG_WHITE-LIST 

-A LOG_WHITE-LIST -j LOG --log-prefix "CIDR-WHITE-LIST" 

-A LOG_WHITE-LIST -j ACCEPT 

-A SMTP_TRAFFIC -j CIDR-WHITE-LIST

 

Then the blacklist like so:

:CIDR-ASIAN - [0:0]

:LOG_ASIAN - [0:0]

:SMTP_TRAFFIC - [0:0]

-A INPUT -p tcp -m tcp --dport 25 -m state --state NEW -j SMTP_TRAFFIC

-A CIDR-ASIAN -s 2.3.4.5 -j LOG_ASIAN 

-A LOG_ASIAN -j LOG --log-prefix "SPAM-BLOCK-CIDR-ASIAN" 

-A SMTP_TRAFFIC -j CIDR-ASIAN

 

I am basically blocking port 25 traffic to blocked IP's.

I must be missing something stupid, but cant see it.

 

Any help is greatly appreciated!

 

Thanks!


