From: Gaetan Lord <email@gaetanlord.ca>
Subject: Redirecting external IP/Port from localhost to an ssh tunnel on localhost
Date: Wed, 21 Oct 2015 11:15:07 -0400
Message-ID: <CAHfhYmybX5R2Qo6dMTfMdcHBk7N_xsZQ548Hf5DZCZF9pv=QYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

 Hi

In short:

I'm having issue configuring some rules to do the following

My home computer is inside a firewall and currently do not have any
iptables rules defined

From my computer, I have an application trying to reach a external
host/IP but I would like to redirect all the packets to a local port.

That local port is indeed an ssh tunnel created by an ssh LocalForward rule.

I will not forward  request from other computers on my home subnet

Any help would be greatly appreciated

Regards

Gaetan

In long:

Because I do not want to connect via VPN to my job network, IT do not
want to help me if I use ssh.

The company have a cloud apps running on his network, where linux user
have to use citrix to connect. The 1st step is to connect on a web
portal to authenticate, once done you have download an ICA file and
start citrix. This should be transparent to VPN user and citrix should
start automatically.The problem is the ICA file contain corp network
IP. That IP could be one of 10 differents IP.
I have to save the ICA file, edit the file, change the IP/Port
combination to be the ssh tunnel one and start citrix manually.

This has to be done every time because the ICA file contain an
encryption key that is good for only one connection.
