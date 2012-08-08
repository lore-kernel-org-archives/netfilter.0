From: Stewart Middleton <stewart.middleton.spam@gmail.com>
Subject: Security validity of iptables in multi bridge environment.
Date: Wed, 08 Aug 2012 18:27:27 +0100
Message-ID: <5022A17F.9030701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=HoJq4JwhAGqyKYv9kK+oDELeQR1U/L0jefffwohFpHU=;
        b=UyNHeDe91XDBrnHlvX3MpVONRLimOsKfur/H8nwZzMn4JCZDxeG8Om755uI0Ul7N4v
         xBFKzwQi2Fm7Bz0qCbx7RRD9pW6o3SknW4PvdQ30bNk6mLw7iUAc3BkeYNghL9ihKfO0
         P7yi1AIY6rSChsnadDLzxSn+uu3s8A6/LWuAfZhk382XPFuhg2RPd/1jUogXUmPVtk61
         Da25iimrhJbTmnjScuA5XWsunX7MLk1Y+sJEO3TOBGHu4TLf85EDIJq1DYDNjWtC9cAJ
         OB8synp1LDwrfdj2SRj9gaPKpadZRu2x0DA4gVEr2BDM1pN5dF6PvSsvO9j4XnOGrM8J
         JgEA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am hoping someone can advise on the potential security (or otherwise) 
of the following setup.

Goal: The host is a rented dedicated server with a single physical 
interface, that will be hosting a series of KVM based, virtualised 
hosts. I want to be able to segregate the hosts at a network level, and 
filter traffic between segregated groups, groups and the outside world & 
groups and a VPN. At this stage I am not looking to filter between hosts 
within each group, though I will probably look at that down the line, 
presumably with ebtables if enforcing from the host.

Environment:

Distro: Debian Squeeze
Kernel: 2.6.32-5

Present Config:

eth0 - physical interface on the server
tun0 - OpenVPN device
br0 - bridge with /24 private ipaddress/subnet
br1 - bridge with /24 private ipaddress/subnet
..
brn - bridge with /24 private ipaddress/subnet

A series of KVM virtual guests who's virtual interface is connected to 
one of the bridges.

The traffic is then routed by the host between eth0, tun0 and the bridge 
interfaces and subsequently the guests, filtered (and NAT'd in the case 
of public outbound) by an iptables ruleset running on the host.

On the face of it, this seems to work as intended, but reading around 
there appear to security issues with this approach involving global 
iptables processing - e.g.:

http://publib.boulder.ibm.com/infocenter/lnxinfo/v3r0m0/topic/liaat/liaatkvmsecnetfilter.htm

So i would be interested in any advice in terms of:

1) Is the IBM info outdated?
2) Irrespective are there other network security issues with the 
approach I have taken
3) Any suggestions on a better way to approach this (tho appreciate that 
may well be for another mailing list)

Many thanks,
Stewart.



