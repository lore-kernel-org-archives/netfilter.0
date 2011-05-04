From: netfilter@buglecreek.com
Subject: Port Scan Detection
Date: Wed, 04 May 2011 15:16:48 -0600
Message-ID: <1304543808.31120.1448324677@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:subject:date; s=smtpout; bh=hfjE7GQruZ9q8AnnrlESBroTXuU=; b=e267kerSz7+A9UaxHqd1Ef8kAhijF1A2R0eNPhH3SOPrDqnL5bwVTBTa0VS957Wo9D4Bc4WnS6cFoVk1V9NPnNbDG2P6nU8KQswW70Jp5ICbDE/nvUtdApyN6LWwTm9lmPThMI3zxt7lkq/aVRHWQdoaAcqPFZfoja/fK4hbak8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

I have seen these rules used to detect a port scan:

iptables -A INPUT -i $INTERFACE --proto tcp --tcp-flags SYN,ACK,FIN,RST
RST -j LOG --log-prefix "PORT SCAN: " --log-level 6
iptables -A INPUT -i $INTERFACE --proto tcp --tcp-flags SYN,ACK,FIN,RST
RST -j DROP

It seems to me that this is a legitimate TCP flag combination, unless
I'm reading the rule wrong.  When I add them to the top of my ruleset
with other invalid TCP Flag rules, the above two rules  seem to fire
fairly frequently.  What about this rule detects a port scan?  I have a
rule that accepts established and related states.  The rules seem to
fire mostly on legitimate ldap connections.
