From: Shyam Prasad <shyam@rocsys.com>
Subject: Connection Stats per interface using iptables
Date: Mon, 5 Nov 2007 00:09:19 -0800 (PST)
Message-ID: <971580.28281.qm@web1005.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I need to get statistics like 
Total outgoing connections
Total incomming connections
Total Connections dropped 
Total TCP ,UDP data
and other protocol stats on "PER INTERFACE" basis.

Is there a way to directly fetch these stats using
iptables rule or i
 have to create separate chains for each interface
,redirect the traffic
 to these interface specific chains and then calculate
the stats.

netstat -s gives me some info but it is the total info
on all
 interfaces but not on per interface basis...any
pointers ???

Regards,
Shyam.
