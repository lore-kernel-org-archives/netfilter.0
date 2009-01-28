From: Joe Pruett <joey@clean.q7.com>
Subject: iptables, ipsec, and host2host
Date: Wed, 28 Jan 2009 11:20:02 -0800 (PST)
Message-ID: <alpine.LRH.2.00.0901281117320.7781@q7.q7.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

i have been scouring the net and i can't find any clues to whether i can 
do filtering after ipsec has decrypted a packet on a host2host connection. 
net2net goes through the filters a second time, but host2host doesn't seem 
to do that.  is there some other method i can use to filter the traffic 
after being decrypted?
