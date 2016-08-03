From: jalvarez <jalvarez@toulouse.viveris.com>
Subject: nftables: nf_acct and quota support ?
Date: Wed, 3 Aug 2016 16:06:09 +0200
Message-ID: <91a3fab3-fd7d-02bc-4caa-107af0a39495@toulouse.viveris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I am currently trying to add quotas for traffic that matches some 
nftables rules.
While looking for a solution I have found the netfiler accounting 
infrastructure (nfacct) very interesting.
Problem is I didn't find anything about nfacct in the nftables code.

Is there any nftables support (or planned support) for nfacct ?

If there is not, is it "safe" to use some iptables rules in the FORWARD 
chain to trigger the accounting after nftables chains (with a priority < 
NF_IP_PRI_FILTER) performed the real packet filtering stuff ?

Thanks a lot :)
