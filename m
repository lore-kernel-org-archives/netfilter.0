From: "Andrew Magnus" <xanadian9@hotmail.com>
Subject: Re: SSH dnat
Date: Tue, 03 Dec 2002 20:48:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F156pgTFur2iz2Mb1s700018666@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2323 -j DNAT 
--to-destination internal_IP:2323

...also needs...

iptables -t nat -A POSTROUTING -s internal_IP -p tcp --sport 2323 -j SNAT 
--to-source external_IP:2323

Otherwise, you've only got traffic going one way:  into the ssh server.

If you're dealing with a dynamic IP address on your external interface, you 
should instead use:

iptables -t nat -A POSTROUTING -s internal_IP -o eth0 -p tcp --sport 2323 -j 
MASQUERADE

Hope that helps.



From: "Ambor" <ambor@alternity.net>
To: <netfilter@lists.netfilter.org>
Subject: SSH dnat
Date: Sun, 1 Dec 2002 15:52:02 +0100

Hello everyone,

I'm trying to dnat SSH throught the firewall to an internal machine.
  I use following Rule

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2323 -j DNAT 
--to-destination internal_IP:2323

eth0 is connected to internet

The problem is that the connection is allrght it just seems that I don't get 
an answer from the ssh server.
(I'm getting a connection timeout, ot a connection refused)

To be sure I don't filter anything, so all trafic is accepted

Can someone help me?

thx

Ronny


_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE* 
http://join.msn.com/?page=features/junkmail


