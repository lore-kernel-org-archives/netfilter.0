From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: ARP Requests/Replies
Date: Sat, 26 Jun 2010 15:57:15 +0100
Message-ID: <4C26154B.8050008@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm trying to set up ebtables on my Xen host. What I'm trying to do, is 
make sure that each guest can only access the bridge on the xen host 
using the "legal" mac address assigned to it.

The 2 rules I'm using are this:

ebtables -I FORWARD -d $legal_mac_of_guest -o $vif_of_guest -j ACCPET
ebtables -I FORWARD -s $legal_mac_of_guest -i $vif_of_guest -j ACCPET

While the above 2 rules do allow normal IP traffic, they seem to block 
ARP requests/replies working properly. So any machine on the network 
that doesn't know where to find the IP address of the guest (and has to 
send a who-has ARP request), they can't communicate with the respective 
guest.

Can someone please suggest some rules that I need to add to make ARP 
Requests/Replies work?

Many Thanks
