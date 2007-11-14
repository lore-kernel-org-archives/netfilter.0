From: "ml@bortal.de" <ml@bortal.de>
Subject: Replace Switch with Firewall - Is there some auto-learnign tool for
 firewall requirements?
Date: Wed, 14 Nov 2007 14:10:48 +0100
Message-ID: <473AF3D8.1040204@bortal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello List,

right now we have a "flat"-network (one subnet):
192.168.0.1-100 and 192.168.0.101-254

Those two Network segments are connected by a bridged linux box. Not 
filtering at this point. Its just a switch really.

Now we would like to keep the "flat"-network for some good reasons and 
replace the linux-bridge with a bridged firewall (physdev match).

Since i dont want to break the network with its functionality i thought 
of capturing the current traffic for some time and check out the IPs, 
Ports, etc... which are beeing used.
Like the learning mode grsecurity has.

Based on the captured information i would like to create my firewall 
rule with firewallbuilder.
I know i have to check out the captured rules well to make sure i dont 
implement a hole in my firewall setup!

Is there a way or project to capture my firewall requirements? I guess i 
basically need all SYN-Flags and its DEST-Ports?
How can i get them easily out the the massive traffic each day? Do you 
need more infos?

Any ideas are welcome!

Thanks, Mario



