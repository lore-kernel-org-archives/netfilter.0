From: Richard Feng <rfeng@wurldtech.com>
Subject: conntrack-tools 0.9.14 can not block the connection
Date: Thu, 6 May 2010 16:51:40 -0700
Message-ID: <201005061651.40203.rfeng@wurldtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am using Linux 2.6.29. I have the problem for using 'conntrack' 
(version:0.9.14) to block the traffic.
Using the following command as example:
  conntrack -D -s 1.1.1.1 -d 2.2.2.2
After execution, it appears the connection info was deleted -
  conntrack -L | grep 1.1.1.1 -- shows the entry was deleted.

However, the connection is still active - is this the correct behaviour? 

From the documentation (from conntrack-tools.netfilter.org), somewhere it says 
that "have to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 
zero".There is simply no 'netfilter' folder under my 
folder '/proc/sys/net/ipv4'. Is this the problem? How could I fix it?


Thanks,
Richard Feng
