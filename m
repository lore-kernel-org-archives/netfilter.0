From: jason.faulkner@mailtrust.com
Subject: Determining number of active connections
Date: Tue, 10 Mar 2009 10:18:35 -0400 (EDT)
Message-ID: <1236694715.945517171@192.168.1.202>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'd like to be able to monitor (trend) the number of tracked connections in iptables; however, doing something like "cat /proc/net/ip_conntrack | wc -l" eats up too much CPU to run with regularity (we track somewhere in the realm of 200,000 connections).

Is there a way to just pull the total number? It'd be nice to know that we aren't even getting close to the number of connections set in the sysctl. 

Thanks!

--
Jason Faulkner 
Linux Systems Engineer
Mailtrust, a division of Rackspace

