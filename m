From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: VLANs
Date: Mon, 10 Jan 2011 17:42:01 +0000
Message-ID: <4D2B44E9.3000006@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I wish to use VLANs on my Linux Xen hosts to seperate managed customer 
networks.

Can anybody please give me some pointers on how to make the network 
secure so no-one can VLAN hop?

At the minute, I plan to set up one bridge per customer, and use linux 
vconfig to add an if to the bridge (which I believe strips all tags). 
Then, all the respective customer Xen DomU (VM) interfaces will connect 
to the bridge.

Thanks
