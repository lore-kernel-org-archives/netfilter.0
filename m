From: OTR Comm <otrcomm@isp-systems.com>
Subject: Help!! Is this true??
Date: Sun, 09 Jun 2002 22:46:27 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D043D33.41AED997@isp-systems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: iptables <netfilter@lists.samba.org>

Hello,

Is it true that iptables does not support virtual interfaces for virtual
domains?

That is, I have many virtual domains setup on virtual interfaces to eth0
(e.g. eth0:1 xyz.xyz.xyz.xyz) currently running on a system with
ipchains.  I am thinking about converting to a new kernel with iptables,
but I can not get iptables to work with the virtual interfaces on eth0. 
I setup a test server to verify that iptables would work, but I can not
access any of my test domains (i.e., web sites through Apache) when I
have the IP for the domain tied to a virtual interface.  If I shutdown
my iptables firewall, I can access the web sites fine.

What's up here, anybody got any ideas and solutions?

I have looked all through the documentation and can not find anything
that addresses iptables and virtual domains on virtual interfaces.

Also, I can not ping any of the virtual interfaces with iptables active,
but I can ping them if I don't have an iptables firewall active.

I CAN ping them and access them through Apache server if I have an
ipchains firewall active.

What's the deal?  Please reply via email.

Thanks,
Murrah Boswell

