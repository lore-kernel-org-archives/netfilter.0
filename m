From: zrm <zrm@trustiosity.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Wed, 23 Oct 2019 17:38:45 -0400
Message-ID: <4c30bf8e-868a-14a8-8d6a-d72835170a08@trustiosity.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
 <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1571866725; bh=uDRFOLrpTuop1FXtoUqeB0oaLlPU831uOQzLoCph6Po=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=yUsCJcQuos3+DF9Lh+mKswv0/5X9bXTOHyG02yorIjEQ0gZc7t4mUSh/IiqzJY5yG
         ArKS7KhRpoy7aooDJtLHzWx5vB5wk9JMCTFtCZDWsWcDrdedO9LWMgBLPFZA04FG/h
         6rbpWKipXbcnXeRPKOwT5ukvC3JtmaYJoNP3x4Is=
In-Reply-To: <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Gray <aaronngray.lists@gmail.com>, netfilter@vger.kernel.org

> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp5s5 -j ACCEPT
> iptables -P FORWARD DROP
> 
> And then reject the things you actually want to prohibit, e.g.:
> 
> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp4s0 -p tcp --dport 25 -j REJECT --comment "no 
> spamming"
> iptables -A FORWARD -i enp4s0 -p tcp --dport 80 -j REJECT --comment "no 
> unencrypted HTTP"
> iptables -A FORWARD -i enp5s5 -j ACCEPT
> iptables -P FORWARD DROP
> 

That should've been this, using the internal interface rather than the 
external one:

iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp5s5 -p tcp --dport 25 -j REJECT --comment "no 
spamming"
iptables -A FORWARD -i enp5s5 -p tcp --dport 80 -j REJECT --comment "no 
unencrypted HTTP"
iptables -A FORWARD -i enp5s5 -j ACCEPT
iptables -P FORWARD DROP

Note that this is a strong reason to rename your interfaces to something 
meaningful instead of using the ugly meaningless default names.
