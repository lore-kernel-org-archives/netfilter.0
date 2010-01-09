From: "=?windows-1251?b?z+7q7vLo6+Xt6u4g?= =?windows-1251?b?yu7x8ujq?=" 
	<casper@example.com>
Subject: What is the "nice" priority of the code runing iptables?
Date: Sat, 09 Jan 2010 22:34:09 +0200
Message-ID: <20100109223409.198672z4nx5v19c0@meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have router running on the edge with 100% CPU load most by  
IRQ/SOFTIRQ. This is causing a number of inconviencies like net load  
graphics (rrd) not being processed in time, slow command line  
responce, etc.

"renice"ing user root to -20 helps, but as I have red this is  
dangerious. So, I thought I could set "nice" priority for user root to  
be the same or a bit lesser than the priority of the code running  
IRQ/netstack/iptables.

So the question is in subj. Also, does somebody know wheather the  
kernel threads/processes considered the same as userspace regarding  
"nice" priority?


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

