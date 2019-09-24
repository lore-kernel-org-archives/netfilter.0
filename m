From: Charles Eidsness <charles@ccxtechnologies.com>
Subject: queue bypass not working?
Date: Tue, 24 Sep 2019 15:16:47 -0400
Message-ID: <CAAV4SYYtrepDSWvV3KP=gE_5V609h-J_YGrPOFFxk4ctjXdBFA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ccxtechnologies.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=qistwbmeMppsDvz8fbuApaUdn6xbM23uav37TY8GrlE=;
        b=fDCJKSW8amEJqzsXoxkJnljx+bzaylEU9ghWmkK/U3Oe5fKbARl/pnH6HZYQro91ST
         2P17x85NA3gPnvlwu1IRhKUW9uqK20k2OdluI4bo5GV5Ona/EmIhXQcHOsV5p5dW/fA/
         oFuCg33/AiqW+avRXYO1mHT0pfn3JQYA1c1kUdNH7MwjOsHi/Eph8uA3VzCtjsOH/j73
         4I0X4DT+JjWXwH4fZBU3OJdwUQxZnAVJeBwsgxuhFdqEx+eqR5HD0cZuk72KuC2u4F9Q
         SllFsu/PZeduSuNbTfNbjwyMaSNRPOavIzbxvV7xZvnMQySIFe+5JgICL4Q6UWZfFx/m
         R0ZQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I'm using nftables v0.9.1 and kernel 5.2.10.

I'm not sure if I'm using it properly but queue bypass doesn't seem to
work the way I expected.

I add a rule "queue num 10 bypass" to my chain, I don't run any
listeners on queue 10 and all traffic is blocked (I installed counters
before and after that rule).

I was expecting all traffic to bypass the rule, but maybe I
misunderstood what the bypass keyword is for?

Thanks!
Charles
