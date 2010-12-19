From: Peter Phaal <peter.phaal@gmail.com>
Subject: sFlow probe using netfilter/ULOG
Date: Sun, 19 Dec 2010 13:04:46 -0800
Message-ID: <AANLkTinenfPTsqA-CKXBs0tuj9cCMyy+sCQV14-SEvND@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Ed3XF8cfdnd2jAhlgFhWPhHwCbqPti2ir3tzLYQIfIQ=;
        b=xjf7H/KxOxsQDxJQg/CongSMubq6+yxRHpvXZvpcCv4njRV2tBGczOZDrzQE1u4by0
         N69WZQeW9ymHse/S5gEuhVX6s7pVll2nMPR3bNBdMPAgBFhKS6ZrXYQmjEp6OXNSeEFB
         0ENBarrGVqqUyh3nac2c2dYwl1JhP++5AbP+Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I was reading the NetFlow/sFlow/IPFIX probe discussion from earlier
this year and thought there might be some interest the recent
ULOG/sFlow implementation in the Host sFlow project:
http://host-sflow.sourceforge.net

It turned out that the random sampling capability in the statistic
module combined with ULOG provided the hooks needed to implement
sFlow:
http://blog.sflow.com/2010/12/ulog.html

I do have a few questions:

1. When sampling the INPUT chain it is possible to get the layer 2
header. Sampling the OUTPUT chain only provides the IP header. I
understand that the layer 2 header hasn't been constructed yet, but is
there a hook further down the netfilter chain where the layer 2 header
is available?

2. We are also looking at an ebtables implementation. Is it possible
to perform random sampling in ebtables?

3. Finally, is there a way to programmatically retrieve the packet
counter associated with a rule? Ideally we would like to be able to
tag the sFlow monitoring rules and retrieve their packet counters. I
know its possible use a script to parse the output of iptables -L
--verbose to get counter values, but it isn't the most efficient
solution.

Thanks,
Peter
