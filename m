From: Barry R Cisna <brcisna@eazylivin.net>
Subject: sip voip traffic forwarding
Date: Sat, 03 Jan 2009 18:19:18 -0600
Message-ID: <1231028358.31327.47.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello List,

First time posting here. I am fairly familiar with iptables rules in
general. I always use Webmin to apply rules to try and cut down on me
fatfingering things:). I am trying to get port forwarding working on my
Linux terminal server ,server to a newly built asterisk/trixbox. This is
on a default install of K12ltsp/ Centos5,default kernel. I have tried
all of the MANY how to's on trying to get the correct stuff forwarded.No
luck bottom line.

Setup: Linux server has two nics in it. eth1=public eth0=internal
Asterisk/trixbox one nic eth0
internet-->cable connection-
-->Linksys wrt54gs router to LinTS->eth1
All ports on the linksys wrt54gs are forwarded to the LinTS. (The only
purpose the linksys is really serving is wifi for a couple laptops.)
LinTS runs iptables.
I have loaded the ip_conntack_sip & ip_nat_sip modules into iptables.
Naturally, the TS has nat/MASQ setup on it with a default install.

I'll try and 'display' as best I can my setup physically.

**internet**-->wrt54gs-->eth1=LinTS=eth0(nat/masq)-->switch-->clients
						     -->asterisk/trixbox


Gateway;192.168.1.1-eth1;192.168.1.2-eth0;192.168.0.1-.dhcp/nat->clients
,asterisk

Is this do-able with the default iptables contained in Centos5,or do i
need to add some patches,and add ons?
Sidenote: I was considering setting the astersk server right on the
wrt54gs linksys,but my plan is to do away with the linksys if I can make
this work to cut down on clutter/pieces,cabling.
I would need to of course udp 5061, 10000-20000 forward to asterisk
server from LinTS eth1,eth0?.
Would someone be good enough to do a ,,1.,,2.,,3. how to accomplish
this?
Sorry for the long post.

Thanks,

Barry
                                         

