From: "jamil egdemir" <unclejamil@gmail.com>
Subject: T1 router and multiple public ips
Date: Mon, 28 May 2007 23:25:56 -0400
Message-ID: <5009b2270705282025q2a2243b6u7e4d3e1d7dcbd0c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=WJ9cz+DkBW6KJs8F/Rt+7xhh4fxdyXEyNmvcmMy1DxmQbA0MCNDCpNJeQkxzmuq6i9FTbT3W5Vjm1PpSO1Mnfm/HTpiFETsNbfspIpky+vs0a62PSTVmF73VFCAHShJIlI0cRXi25FQBJ+qOQrqJ/qBd95YSg5UDt5jEeZBNi4Y=
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

Hi,

I have a T1 router that provides me with two public ips: 13.47.77.2
and 13.47.77.3.  There are two linux boxes, (each with two Ethernet
cards) acting as the gateways to a 192.168.1.0 network sitting behind
each public ip.  My question is how do I get a browser on 192.168.1.30
sitting behind 13.47.77.2 to reach a web server on 192.168.1.2 sitting
behind 13.47.77.3.

Usually I use something like the following rule to forward ports from
outside ips to internal ips on the 192.168.1.0 networks:

'/sbin/iptables -t nat -A PREROUTING -p tcp --dport $MYPORT -j DNAT --to
192.168.1.2:80'

so.. all my previous natting experience was for trying to let machines
on the outside communicate with my networks behind the 13.47.77.2 and
13.47.77.3 public ips.. the iptables command above works great fot
that.

let's say the hostname(eth0-ip, eth1-ip) of the first gateway are
floyd1(13.47.77.2, 192.168.1.1) and the hostname(eth0-ip, eth1-ip) of
the 2nd gateway floyd2(13.47.77.3, 192.168.1.1)and I'm trying to make
a browser on 192.168.1.30 behind floyd1 talk to the web server on
192.168.1.2 behind floyd2 that is listening on port 80.  The default
gateways are currently set to 13.47.77.1 on both floyd1 and floyd2.

What are the iptables commands that I need to make this thing fly?  I
feel like I should have a pair of iptables commands on each gateway to
do the job. One of them being a -j DNAT and the other being a -j SNAT
to handle both directions..

I'm also wondering what is the 'best practice' for this situation
where you have a T1 router with networks sitting behind each public ip
that need to talk to each other..


-- 
-jamil

-------------------------------------------------------------
Jamil Egdemir
unclejamil@gmail.com
AIM: unclejamil
YahooMessenger: uncle_jamil
http://grad.physics.sunysb.edu/~jamil
(631) 338-3170 (cell)
-------------------------------------------------------------

