From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: iptables and bridging
Date: Mon, 11 Apr 2011 20:52:00 +0100
Message-ID: <4DA35BE0.6090703@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Folks,

Am I correct in saying that in a setup where multiple interfaces are 
connected to a Linux bridge, iptables (using -m physdev) can stop 
non-broadcast traffic appearing on the wrong interface? I know generally 
that the bridge will act like a switch and only send frames to the 
correct interface, however this is not always the case (during learning, 
for example, where it acts like a hub for a second or two)

Thanks
