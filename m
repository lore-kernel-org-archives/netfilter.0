From: "crux crux" <cruxam@gmail.com>
Subject: Forwarding packets on iptables firewall
Date: Sat, 21 Apr 2007 14:25:25 +0200
Message-ID: <4fccc36f0704210525md4c677frcb2d508c12655894@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=kPsTHvtmF/jVi8rpASr5qjsoIMlrMF6fJE+R6K1AnPug3ITs5Rbc0zaOxadJOH3qjAip0Hkvv3QZqRzdU0CkCs4cO6WS5xz7kMA9iLo6ze6f38Byd39I04awn0KHCggmuPs8od6kfvsU2pJUz3TcPqwLZ1Ltm+bEFJkAyHflTaE=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi people,

I have two machines which are connected to iptables firewall.
On firewall I have following rules

iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT


echo 1 > /proc/sys/net/ipv4/ip_forward  ( on firewall )

ip address of machineA is 192.168.1.2
ip address of machineB is 10.1.1.2
default gateway for machineA is 192.168.1.1 ( eth0 )
default gateway for machineB is 10.1.1.1  ( eth1 )


machineA -------- eth0(firewall)eth1-----
-machineB
I want make possible traffic flow from machineA to machineB.

The above rules should do that, but because of something I cannot ping
machineB from machineA.

OS is debian. Any help is welcome.

Regards

Crux

