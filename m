From: danny@ezelink.com
Subject: ebtables vlan captive portal
Date: Wed, 11 Mar 2015 22:39:35 -0500
Message-ID: <e83b24aadd74fe6ca9f82d7d4a38de82@ezelink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

http://s16.postimg.org/e5nu6g1md/bridgevlancaptive.png

The above image link is based on my project about captive portal. As you 
can see on the image i have a diagram on LEFT side which is WORKING 
without a problem on a normal scenario without any vlan.

On RIGHT side however, it is similar to the setup on left side but it is 
with multiple VLAN.

I am having difficulties on finding the solution on this. need your 
input.

Currently im looking at ebtables form the link

http://ebtables.netfilter.org/misc/ebtables-man.html#lbBD
Basically the idea is to intercept the packet that flows to bridge 
interface from whatever vlan is tagged and create the same rule as the 
iptables to mark packet and redirect to login page.

I welcome your possible solutions in this.
