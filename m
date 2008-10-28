From: "Joey" <Joey@Web56.net>
Subject: whitelist ?
Date: Tue, 28 Oct 2008 13:37:05 -0400
Message-ID: <000601c93923$cb748720$625d9560$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

 

Hello all,

 

If I am blocking a block of IP's lets say

 

84.17.64.0/19

 

Using:

 

And I find that I need to allow:

84.17.64.23

 

 

 

My rules look like this:

:SMTP_TRAFFIC - [0:0]

-A INPUT -p tcp --dport 25 -m state --state NEW -j SMTP_TRAFFIC

 

Then

-A LOG_LIST_NAME -j LOG --log-prefix "SPAM-BLOCK-CIDR- LIST_NAME "

-A LOG_ LIST_NAME -j DROP

 

 

Would I put something like:

:WHITE_LIST

-A INPUT -p tcp --dport 25 -m state --state NEW -j WHITE_LIST

-A LOG_ WHITELIST -j ACCEPT

 

Then 

-A WHITE_LIST -s 84.17.64.23 -j LOG_WHITE_LIST

 

This is not my strong suite.

 

Thanks!

 


