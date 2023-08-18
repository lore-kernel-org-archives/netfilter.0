From: Alessandro Vesely <vesely@tana.it>
Subject: Extending an IPv4 filter to IPv6
Date: Fri, 18 Aug 2023 12:56:38 +0200
Message-ID: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1692356198;
        bh=HWRRPQs0ECs9HGW73kcuSWqjk0xgCe9kA90T8w40zVk=;
        h=Author:Date:To:From:Subject;
        b=AGNvjjhTlufPSaxZ2IrlG2QlNHz11yo3aPQeIj4nYICT5BaXDs3ktyjQCJifIA7BN
         aUY+/DVx1aeM1eHE4PuCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1692356198; bh=HWRRPQs0ECs9HGW73kcuSWqjk0xgCe9kA90T8w40zVk=;
        h=Date:To:From:Subject;
        b=DGLT84338Ldv0WYZI/Mc84GVu/nPwd4nwFu61M/hxNx8ZAJSGfzmd5XHLBs2XDPyB
         VYe2U0D3lghSX8kBuvNBkaRzE1aGqZFVLgpRHGiTX5EL0pjiV+KEDMwVLhqG+7pcru
         UIRV7wvOfvug/g8WGLcO17DObDX8ERw1FdRiClMch3beqjegH9t0qp0DizDAz
Subject: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I have an old program (ipqbdb) which filters IPv4 packets using 
libnetfilter_queue.  I want to extend it to also filter IPv6, now that at last 
I can use some of those addresses.

The program obtains a handle by nfq_open(), and then (after unbind) binds by 
nfq_bind_pf(h, AF_INET).  Afterwards it creates the configured number of queues 
and filters the packets it finds there.

There is a big DEPRECATED in the documentation, and the generated doc for 
nfq_bind_pf() parameters says "This call is obsolete, Linux kernels from 3.8 
onwards ignore it" (which is obviously false).
https://netfilter.org/projects/libnetfilter_queue/doxygen/

So, the first question: Can I keep using these functions?  What is the alternative?

Second question: Is there a "mixed mode" parameter, besides PF_INET and 
PF_INET6, that allows to capture both types?  In that case, can a queue receive 
either packet?


Any other suggestion about extending to IPv6 is probably going to be appreciated.


Thank you
Ale
-- 





