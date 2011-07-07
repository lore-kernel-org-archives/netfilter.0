From: netfilter@buglecreek.com
Subject: Iptables State Table
Date: Thu, 07 Jul 2011 08:55:56 -0600
Message-ID: <1310050556.12710.2149230885@webmail.messagingengine.com>
References: <41268.1309529522@princeton.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:in-reply-to:references:subject:date; s=smtpout; bh=+v/Owq3jsgEdsdxGdLDHi6MO7H8=; b=mqhjV3tnUzV3mv09cRHk3W8I3xbZeFzEkCScpZ3QRa0GHQw4lUDV+uW1reTnU54JzuSrdIhLTExOJfQNRQQ//i0iArdwCdykapshy1bsIn83wBsRyNKGWatGXmagD4RHNAaSAXOnZoFyh/hAdLtLwvHfmpxFMKlsgd64b55kZ2k=
In-Reply-To: <41268.1309529522@princeton.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Given the following simplified rules:
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

When the system boots, various daemons create persistent connections
that stay established indefinitely to authentication servers like the
following:
clientSytem:44444 ----->  authServer:389
This creates an entry in the iptables state table which works fine. 
But, occasionally the state table gets cleared out.  Usually by
something simple like someone restarting iptables. Once that happens the
established connection is still there, but when the authServer sends a
packet back to the clientSystem the packet is viewed as new and
eventually gets dropped since their is nothing in the state table.  The
only way I can think of allowing for this is to create a rule that
allows new connections from the authServer:389 to the clientSystem:any. 
Is there a better way?
