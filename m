From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: captive web system using DNAT and SNAT
Date: Thu, 05 May 2005 15:11:58 -0500
Message-ID: <1115323918.21170.65.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

hello,

i am working on a captive web system and am using DNAT and SNAT to
accomplish this. things are going well, but i am have hit a road block.

currently our router is configured (via next hop routing) to send
traffic to the firewall for certain vlans on our network. thus i am
dealing with an asymmetrical route map. traffic coming from a vlan is
sent to the firewall, but traffic destined for the same vlan does not
pass through the firewall. this is fine, but it does make the problem a
little more challenging.

so in order to make the system captive, i am using DNAT. since it is an
asymmetrical route map, i am using SNAT.

DNAT ensures that web traffic goes to the box i want, and SNAT ensures
that the web talks back to firewall instead of directly to the original
client (who is not expecting to be getting traffic from *that* web
server).

the problem is that if the client has traffic destined for the captive
web server, then i dont want the firewall to DNAT or SNAT the traffic, i
just want to let it go peacefully.

here is my small firewall script that accomplishes the captive part:

# catch all redirects to registration server
iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
--to-destination ${REGISTRATION_SERVER}

iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
--to-source ${EXTERNAL_ADDRESS}

iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
--to-destination ${REGISTRATION_SERVER}

iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
--to-source ${EXTERNAL_ADDRESS}

so the above works for me. on my client machine i go to google.com the
firewall redirects me to the registration server (${REGISTRATION_SERVER}
and all is good.

what i want to do is if i type in ${REGISTRATION_SERVER} in my address
bar on the client system, then i dont want the firewall to do any DNAT
or SNAT. what is the best way to accomplish this?

thanks, 

matt zagrabelny


