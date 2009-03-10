From: jason.faulkner@mailtrust.com
Subject: Re: Determining number of active connections
Date: Tue, 10 Mar 2009 11:30:40 -0400 (EDT)
Message-ID: <1236699040.83825693@192.168.1.202>
References: <1236694715.945517171@192.168.1.202> 
 <200903101622.35671.erik.wasser@iquer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200903101622.35671.erik.wasser@iquer.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----Original Message-----
From: "Erik Wasser" <erik.wasser@iquer.net>
Sent: Tuesday, March 10, 2009 11:22am
To: netfilter@vger.kernel.org
Cc: jason.faulkner@mailtrust.com
Subject: Re: Determining number of active connections

>check out the following files:
>
>/proc/sys/net/ipv4/netfilter/{ip_conntrack_count,ip_conntrack_max}

Thanks for this information :) This is awesome for my new firewalls.

However, I have a few old 2.4 kernel firewalls (RHEL3), and they don't seem to have an ip_conntrack_count anywhere. Is there something for those? 




--
Jason Faulkner 
Linux Systems Engineer
Mailtrust, a division of Rackspace


