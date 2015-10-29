From: =?ISO-8859-15?Q?Martin_Gr=F6ger?= <mgroeger1@web.de>
Subject: nftables: bridge filter with queue to userspace
Date: Thu, 29 Oct 2015 22:23:44 +0100
Message-ID: <56328E60.4040002@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to build a transparent filter with application level 
filtering. First experiment with ip and output hook and queue to 
userspace was successful. Then I changed to bridge filtering with 
forward hook. With counter action I see that the packets match the rule, 
but the queue to the usersapce doesn't work.

Am I right, that this fuction should work?
I'm using Fedora 22 with nftables 0.4.



