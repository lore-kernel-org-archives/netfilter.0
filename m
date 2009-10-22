From: Carl Michal <michal@physics.ubc.ca>
Subject: ssh connections stalling
Date: Thu, 22 Oct 2009 11:45:47 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm having some troubles with what should be a very simple firewall to 
simply protect a local machine.  When the firewall is enabled, ssh and scp 
connections will sometimes hang indefinitely.  I've tried configuring the 
firewall (which blocks all incoming requests to ports 0:1023 except ssh 
and icmp) with several different tools: firehol, ufw and lutelwall.  If 
the firewall is turned off, the problem disappears.  With lutelwall there 
is an option to create a non-stateful firewall - if that is done, the 
problem also disappears.

My syslog does show dropped packets that appear to be the cause of the 
problem.  From tcpdumps at both ends of the connection it looks like the 
problem happens if large packets are sent out from behind the firewall and 
then arrive in pieces at the other end with a piece missing.  ack 
packets coming back in are dropped, and the connection never recovers.

Any help in diagnosing this would be much appreciated.

Carl





