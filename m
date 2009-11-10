From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Target in two chains simultaneously
Date: Tue, 10 Nov 2009 23:32:40 +0100
Message-ID: <4AF9EA08.6090709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=xI2PZ0AxLMkU2VjNVW55Bu6ZS/K54aS1R3ruejpU57A=;
        b=gbdZWEmR0GniT8ilebcCs1vQ1PToooUY9eMAiKAfz8j7K798UZqmm/YT2jVOLDkNXJ
         GAgHO7NYfaqNSrMpNTjtgZCcC8pr9S7aeEEc6pRUAcqSWveRVq/hiKOIJGWyNhlfhKL7
         8MAp6JSWhIYwtAy/IOrzoHaZsgeCZQst11Ov4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I am working on a small project where I need (or at least want) to base 
outgoing TCP load balancing on incoming ACKs. My first idea was to write 
a threaded kernel module using netfilter, but I am not sure if that is 
needed. Also, since every outgoing/incoming packet has to go through 
that module it might affect performance severly.

I am not too familiar with the iptables-architecture, but would it make 
sense to use the same module in two chains (for example OUTPUT and 
INPUT) simultaneously and then share data structures between them? How 
will this perform, and would I need to do any syncronization between the 
shared structures? For example, can the processing of an outgoing packet 
be interrupted by an incoming?

Thanks in advance for any help,
Kristian
