From: laurent@riviere.nom.fr
Subject: ip range
Date: Fri, 01 Aug 2003 14:11:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2A752E.20273.B96A60@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

i set up a firewall with iptables
the firewall has three interface :
eth0 (192.168.1.1) connecting the lan with a server and three workstations 
(192.168.1.xxx)
eth1 (192.168.2.1) connecting the dmz with a webserver (192.168.2.xxx)
eth2 (192.168.4.1) connected to the internet via a cable router

the webserver (apache 2.0) on the dmz has three interface : eth0 (192.168.2.2), eth1 
(192.168.2.3) and eth2 (192.168.2.4) for SSL purpose that not support virtualhost 
directive
I use dyndns service with three dynamic hosts, one for each interface
My problem is that I don't know how to foward port 80 requests to all ip addresses.
I just succeeded to foward one by one but apache serves the same site for each 
dynamic host

I had read the DNAT howto but I not sure it's what I need to do ?
any idea please ?

Laurent


