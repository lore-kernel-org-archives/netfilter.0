From: Stephen Satchell <list@satchell.net>
Subject: nftables element not in set
Date: Thu, 22 Jul 2021 15:50:23 -0700
Message-ID: <323b00e1-e94f-1353-59a5-4ddb1d202861@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

As the documentation currently reads, you can use set expressions like this:

   tcp dport {22,8022} accept

Is there anything in the nftables syntax that permits detecting the 
absence of a match?  Something like

   tcp not dport {22,8022}

     or

   tcp dport not in  {22,8022}

All the examples and descriptions have netfilter only test for set 
union, not for set difference.

What am I missing here?
