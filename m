From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: What is so special about 172.31.254.254
Date: Wed, 04 Apr 2012 17:25:56 +0200
Message-ID: <4F7C6804.8090702@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi list,

I have a strange scenario.
For test reasons I had setup two PC-s.

1. 172.31.254.1
2. 172.31.254.254

Netmask 255.255.255.0

They do not see each other...
But if I change the second IP (for example to 172.31.254.253) then it 
all good...

What am I missing?

Swifty

