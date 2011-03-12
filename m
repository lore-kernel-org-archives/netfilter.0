From: Ed <ed@pyrpress.com>
Subject: Restrict all traffic from remote location through Internet VPN
Date: Sat, 12 Mar 2011 13:26:38 -0500
Message-ID: <4D7BBADE.1010900@pyrpress.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello All,

I have a remote location with a firewall router with a VPN between 
locations using cable at both sides. All LAN-to-LAN traffic uses the VPN 
between the locations. Any remote non-local traffic (email, http, ftp, 
etc) uses the remote internet cable connection. For compliance reasons, 
we now have to monitor the remote location's use of internet resources, 
as well as verify  that only our PC's are used for the internet (no 
laptops).

As a first step, could I add a Linux box at both locations and then use 
Netfilter/iptables to force all remote internet traffic through the 
existing VPN and out our cable connection?

Second, could I eliminate the firewall boxes, and create the VPN using 
the two Linux boxes.

I've searched the archives, but nothing I've found fits.

I'd like to know if it can be done and further any wisdom on how to 
proceed.

Thank you for any help...Ed
