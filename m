From: jason.faulkner@mailtrust.com
Subject: RE: NAT and openvpn
Date: Fri, 27 Mar 2009 22:39:46 -0400 (EDT)
Message-ID: <1238207986.285131659@192.168.1.202>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090327211404.aa4d4e6d.g@imagination.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "G. Skillen" <g@imagination.eu.org>
Cc: netfilter@vger.kernel.org

>I have set up a vpn (openvpn) from my home computer to a remote server, I have several >unused public IPs on the server and I would like to know how to transparently send all >traffic from e.g 123.123.123.123 (one of the spare public ips) to 10.8.0.2 (the vpn ip >of my home machine), and vice versa i guess.


% iptables -t nat -A PREROUTING -s $VPNIP -j SNAT --to-source $PUBIP
% iptables -t nat -A POSTROUTING -s $PUBIP -j DNAT --to-destination $VPNIP

That should do the trick for you for a general NAT, I'd suggest adding filtering, etc.



--
Jason Faulkner 
Linux Systems Engineer
Mailtrust, a division of Rackspace


