From: Jeff Kletsky <netfilter@allycomm.com>
Subject: "Test" mode for nft?
Date: Sun, 20 Aug 2017 17:05:37 -0700
Message-ID: <27b5c43e-a173-b292-3878-e655f53a2dc2@allycomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Slowly working through nftables syntax, with a lot of trial and error, 
my rules occasionally compile and load.

Unfortunately, they also have resulted in rules that have blocked my 
access to the machine, even with (I thought) carefully ensuring that my 
management interface was unrestricted.

Is there a "test" mode for nft that allows me to compile a candidate 
rule set and dump the results for inspection, without loading it into 
the kernel?

Jeff


