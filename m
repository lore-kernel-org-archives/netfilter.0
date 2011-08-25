From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Theoretical question: need for filter table in the POSTROUTING chain
Date: Thu, 25 Aug 2011 13:40:51 +0200
Message-ID: <4E5634C3.80908@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi all,

I am facing an interesting problem.
I would like to filter some destination IP-s both on the FORWARD and the 
OUTPUT chains... (For example to stop requests to private IP 
destinations leave our system.)
I would like to use the REJECT target...
It would be nince if there would be a filter table in the POSTROUTING 
chain...

What do you think?

Thanx:

Swifty
