From: Jason Cosby <sky_jason@yahoo.com>
Subject: IPMARK
Date: Thu, 18 Sep 2008 01:30:54 -0700 (PDT)
Message-ID: <397309.80901.qm@web37302.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All,

Sorry to post here, but the LARTC list has gone belly up. I have a LAN of 35 with IPs from 192.168.1.6 thru 192.168.1.40 sharing a satellite link. I need to limit total bandwidth to 512Kbps and divide it evenly between all 35 clients. My plan is to create 35 individual queues and allow 100% borrowing so that the queues don't have to constantly be deleted/recreated upon user enter/exit. All traffic is run through NAT at the gateway computer. 

I see using IPMARK as the way to go, but am not clear how to put it together. The documentation doesn't quite clear it up for me. Can anyone help me get together a simple down and dirty script to do as I described? Once I get the network under control a bit I will continue implementing proper QOS. If I don't get a handle on this soon I will be tarred, feathered, and thrown in the desert to rot (almost), so any help is GREATLY appreciated. 

Thanks,
Jason
