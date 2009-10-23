From: Karl Hiramoto <karl@hiramoto.org>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 12:29:51 +0200
Message-ID: <200910231229.51847.karl@hiramoto.org>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <200910222224.15040.karl@hiramoto.org> <alpine.LNX.2.00.0910221327250.21366@spider.phas.ubc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910221327250.21366@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org


Could you send your syslog rules that match your LOG   rules from firehol, 
That might explain what is being dropped.

Does your connection stall when your doing something or just when idle?
If your idle you could try and modify your sshd config TCPKeepAlive option.  
It could be the kernel timed out the state of your connection. 

Another thing you could try is making your SSH ports more permissive with 
something like: 
iptables -I INPUT -p tcp --dport 22 -j ACCEPT

To accept ssh destined TCP traffic regardless of state. 

--
Karl
