From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: newbie at routing !!
Date: Wed, 7 Jun 2006 11:50:02 +0200
Message-ID: <001f01c68a17$c04e36b0$0101000a@sterenborg.info>
References: <BAY19-F16E0836CEB64153379C39C9E8A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <BAY19-F16E0836CEB64153379C39C9E8A0@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I need help!! My VLAN IP is 192.168.202.1. I can ping another PC with
> the VLAN IP of 192.168.206.1 but i can't ping the 202.184.41.41
> address in that PC. Am i supposed to do some sort of routing
> configuration? I am using FC3 as my OS. What am i supposed to do to
> ping 202.184.41.41? Thanks 

Perhaps you noticed that this is the Netfilter list, not Linux Routing ?

Anyway. I'll give it a try.
- Your IP is 192.168.202.1 and you can ping 192.168.206.1, so I'm
guessing that your netmask is would be 255.255.0.0.
- If I understand you correctly, you say that 202.184.41.41 is
configured to the PC that also has 192.168.202.1.

To be able to ping that IP,
- you need, on your PC, to set the default gateway to 192.168.206.1 or
have a specific route for 202.184.41.41 which points to 192.168.206.1.
- on the machine that holds both 192.168.206.1 and 202.184.41.41, you
need to enable IP forwarding, make sure that it has routes for both
networks and check the iptables rules if they permit this FORWARD
traffic.

If the above does not help you, you should add more details about your
setup.


Gr,
Rob


