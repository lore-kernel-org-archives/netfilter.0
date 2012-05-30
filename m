From: miao hongbing <miao_hb@hotmail.com>
Subject: Ask an issue about how can I let netfilter-nat work normally, thanks
Date: Wed, 30 May 2012 07:27:04 +0000
Message-ID: <BAY146-W327D42337C6D284F3060A6900A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Hi Sirs,
 
I am Steve Miao from China, currently we use broadcom's WiFi chipset, the chipset version is 5356  the software version is linux-2.6-router-5.70.48.10.
 
We meet an issue about fast-nat, we plan to remove fast-nat and use common netfilter-nat base some reasons, when we removed fastnat by disabling CONFIG_BCM_NAT(the option of kernle's menuconfig) or let "ipv4_conntrack_fastnat=0",  fast-nat is disabled succesfully, but netfilter-NAT can not work normally, the phenomenon is:  we can ping any website,  can not surf  it. that means ICMP can work normally but TCP/UDP can not.
 
Could anyone pls tell me how I can let netfilter-NAT work normally? if you know it pls kindly let me know.
 
Thank you very much!!!
 
Regards,
Steve 		 	   		  