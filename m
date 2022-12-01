From: Amish <anon.amish@gmail.com>
Subject: Which of these 2 rules will consume more CPU? Please guide.
Date: Thu, 1 Dec 2022 17:02:28 +0530
Message-ID: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhZtH+TiNf+5+RvDJxaBVlu+nz9IlAVASrCvUP+R/m0=;
        b=IPUP4u4l0PuQ1jfc56iEDU7pHJ+uqp7n1GMB5I27PqxWTSdwoqUvBKuGdwttMEMI1v
         Y2C1JXNZJMFneBt9jmpuWHU3WO205Qp/KmBsQs/8gh+UNdD+0gNgd0nkzE3A3YHaOr8k
         QZxp4R4CMu+DbxKaffFd9PNnOoKWZ9K1E2kx8XUrYca43ylEwAf3FKOA3pYgFuTgn7BI
         BEupiDtUclTc2wAa8gbvc4TSrDOCDPrJ0bvuGotT+g7zdLR6nj/h550tvVA7BQPNnfuK
         phpx/mt0cd356WDXbn33Q6FnUjO9F1iC/zujsFxWqbUFuuzPjGMebIdTZFMoSMbUmlyZ
         PKXQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hello everyone,

I have a hash:net IP set (with name say inblock) which has 2500 network 
blocks.

It is taken from 
http://rules.emergingthreatspro.com/fwrules/emerging-Block-IPs.txt

But let us assume that it can go up to 3000-5000 entries in future.

Now I have following rule right at the top.

# iptables -t mangle -I PREROUTING 1 -m set --match-set inblock src -j DROP

This rule will process each and every packet that is coming in and match 
it against the IP set.

So if I have a 200mbps line and then at its peak, above rule will go 
through data equal to 200mbits per second.

I am curious to know if I change the above line to:

# iptables -t mangle -I PREROUTING 1 -m conntrack --ctstate NEW,INVALID 
-m set --match-set inblock src -j DROP

Now above rule will send only NEW and INVALID packets to match for set. 
And skip ESTABLISHED packets to match against IP set.

But conntrack table itself can have 5000-10000 entries at its peak. 
(assumption)

So which rule will be more efficient?

In short:

First rule will process ALL the packets and test each packet against IP 
set containing 3000-5000 entries.
Second rule will first process ALL the packets against conntrack table 
containing 5000-10000 entries but will save CPU from matching 
ESTABLISHED packets against IP set.

So what would be more efficient?

We assume that NEW,INVALID packets would be far far less than 
ESTABLISHED packets.

Thank you and regards,

Amish.
