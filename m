From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: When writing rules for multiple sequenced firewalls, does the source 
	IP of client need to be modified at each firewall
Date: Sun, 8 Nov 2009 11:35:34 +0000
Message-ID: <ac5c74140911080335t3c58400t653b8eaaf3343f4d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=AizK2W28pIohCA8YMSWVFzrUQuwYULR0gOEjLvhUot4=;
        b=IRmjhFBffv63j0mPmBcWZMqxyNCq0QgKJC6iRcJ9IJy4WEmi/Fxky/QQjcw4+ScrgI
         Oi2U3yans+3gTxFauwhFXuRDBvwPOMGOppDJ07PQwVBZSKD7cbVHXQygqnHflp/7ZBRC
         +SY8Ba98pcEFbno/hUg7/6EvRhliV/yTtDJYY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Experts,

Suppose I have two firewalls in the network and suppose the network
consisted of the following:

Internet -- gwFirewall -- tier2firewall -- sshServer

gwFirewall has two interfaces:
eth0 = Internet facing (IP address 1.2.3.4)
eth1 = Internal facing (IP address 192.168.1.1)

tier2firewall has two interfaces:
eth2 = gwFirewall facing (IP address 192.168.1.4)
eth3 = deep internal facing (IP address 192.168.2.1)

sshServer = IP address 192.168.2.2, Port 22

Now suppose the two firewalls where a typical SOHO box like the
linksys 54G WRT runnning dd-wrt, so they handle my Netfilter firewalls
rules and NAT etc.
Or the Firewalls could be any PC's converted to a netfilter firewall
(filter, nat and mangle enabled).

My question is, when writing rules to permit Internet access to a
system deep in the network, do you keep the original source IP address
of the internet client in your firewall rules for each firewall in the
path?

That is, if a internet client (source IP address 94.108.94.75) needs
to access a ssh server (destination IP address 192.168.2.2) across two
firewalls how should the inbound rules look?


Scenario 1)

On the gwFirewall you permit the internet client access to
tier2Firewall on the IP address of eth2 and from there, tier2Firewall
will permit that same client IP to the ssh sever.

For example:

iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 22  -j ACCEPT
iptables -A FORWARD -i eth2 -s 94.108.94.75 -d 192.168.2.2 --dport 22  -j ACCEPT

Scenario 2)

On the gwFirewall you permit the internet client access to
tier2Firewall on the IP address of eth2 and from there, tier2Firewall
will permit the *gwFirewall* internal IP to the ssh sever. Because of
NAT etc I wonder will the source IP addresses etc be changed.

For example

iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 22  -j ACCEPT
iptables -A FORWARD -i eth2 -s 192.168.1.1 -d 192.168.2.2 --dport 22  -j ACCEPT

I presume its Scenario 1 above is correct and the original source IP
address of requesting Internet client is carried through the chain of
firewalls towards the destination.
