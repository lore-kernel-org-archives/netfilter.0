From: d i <navilein@hotmail.com>
Subject: Need Implicit Source Local NAT (or efficient Replacement)
Date: Mon, 15 Sep 2008 04:13:26 +0000
Message-ID: <BLU144-W4102513FDFADCDD1953F86D1520@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello,

I understood that iptables (my version is 1.4.0) do not longer support implicit source local NAT, i.e., the effect of 
iptables -t nat -A OUTPUT -p tcp --dport 222 -t DNAT --to-destination ${LANIP}:22
which allows one to  write on the local machine:
ssh -p 222 localhost
and connect to the LAN machine with address ${LANIP} on the ssh port.

This functionality has been removed and I would need that. 
Can anyone suggest how I could solve the problem? Is there any replacement for that same thing?
The above mentioned rule does not give any error, but it doesn't work either. Looking in the log of the localy generated packets, I've noticed that their destination address is not changed (i.e., it is still 127.0.0.1, despite what the man page says this rule does). 

I need this functionality for the following case in which I am:

I am a subnet inside another subnet and I have no access to the public router, other than getting DNS and having my connections routed. 
So my WAN IP is not public. In order to access my router from the outside world, I am using a reverse ssh tunnel to a computer which is public and to which I have access. This reverse ssh tunnel is nothing but remote port  forwarding of the ssh.

Using this reverse ssh tunnel, I can connect (ssh) to my router directly from outside by connecting to a local port on that public computer.

I would like to have the same for the other machines in my subnet:  
I want to forward some ports on my router towards the ssh ports of my LAN machines, and using the ssh reverse tunnel port forwarding I can connect to them from the outside world. This is where I would need the implicit source local NAT: these ports would be forwarded (by iptables) towards my subnet machines (ssh port).


Thanks for any help!

PS: please CC any response to my email address. 
_________________________________________________________________
Invite your mail contacts to join your friends list with Windows Live Spaces. It's easy!
http://spaces.live.com/spacesapi.aspx?wx_action=create&wx_url=/friends.aspx&mkt=en-us