From: netfilter@buglecreek.com
Subject: State Explanation
Date: Sun, 17 Jul 2011 18:01:39 -0600
Message-ID: <1310947299.8819.2152814541@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:subject:date; s=smtpout; bh=tUoObkqvZiCgDDLyyMx9fncr4HM=; b=L2LbQnfDwG89VnTfdGQDPnTybWsS5oYeHA2/Micnlm14ptYRYXeSwc1z23497UJ+wgKXkhGYClS2Oqh50H+ojBjRwcFrHx8ryoiSfBs/88eDbfiKQYyfGMYbW8Dc8lR0n+AFw0pvyg2oG1QGMpGrcH7PWgNr27taxPdUcSM1NPU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

In the course of troubleshooting a very simple iptables ruleset that is
inexplicably dropping packets (more on that later) I came across a
explanation in a Iptables Firewall book regarding the NEW state when
using "-m state --state NEW" in a rule.  It states "NEW is equivalent to
the initial TCP syn request, or to the first UDP packet".  I have also
seen in some resources that "-m state --state NEW" will allow any packet
through whether a syn bit is set or not.  

So if for some reason a packet that just has the ack bit set and the
state is not known (ESTABLISHED, RELATED) it will be allowed through due
to the -m state --state NEW? 
