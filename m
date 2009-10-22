From: Karl Hiramoto <karl@hiramoto.org>
Subject: Re: ssh connections stalling
Date: Thu, 22 Oct 2009 22:24:14 +0200
Message-ID: <200910222224.15040.karl@hiramoto.org>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org

On Thursday 22 October 2009 20:45:47 Carl Michal wrote:
> I'm having some troubles with what should be a very simple firewall to
> simply protect a local machine.  When the firewall is enabled, ssh and scp
> connections will sometimes hang indefinitely.  I've tried configuring the
> firewall (which blocks all incoming requests to ports 0:1023 except ssh
> and icmp) with several different tools: firehol, ufw and lutelwall.  If
> the firewall is turned off, the problem disappears.  With lutelwall there
> is an option to create a non-stateful firewall - if that is done, the
> problem also disappears.
> 
> My syslog does show dropped packets that appear to be the cause of the
> problem.  From tcpdumps at both ends of the connection it looks like the
> problem happens if large packets are sent out from behind the firewall and
> then arrive in pieces at the other end with a piece missing.  ack
> packets coming back in are dropped, and the connection never recovers.
> 
> Any help in diagnosing this would be much appreciated.
> 

Send your configuration,  as root or using sudo do:

iptables -L -vn
iptables -L -vn -t mangle
iptables -L -vn -t nat

--
Karl Hiramoto
