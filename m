From: Jason Price <jprice@cyberbuzz.gatech.edu>
Subject: Re: Netfilter and Vonage.
Date: Mon, 24 May 2004 11:34:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040524113454.A16387@redfish.gatech.edu>
References: <20040519233740.A27043@redfish.gatech.edu> <1085030073.19632.8.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1085030073.19632.8.camel@localhost>; from john.sullivan@nexusmgmt.com on Thu, May 20, 2004 at 01:14:34AM -0400
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 20, 2004 at 01:14:34AM -0400, John A. Sullivan III wrote:
> iptables -t nat -A PREROUTING -i eth0 -p 17 -d $EXTERNAL_IP --dport
> 10000:20000 -j DNAT --to-destination 192.168.0.5:10000-20000

This turned the trick.  For the record (and those who look for this in the
future) here's what I did to make it all work:

Thanks!
Jason

######################################################################
#!/bin/bash

# NOTES:
# 1) This assumes that eth0 will be the external interface
# 2) We also assume that this is a DHCP assigned external IP.
# 3) Assume that DHCPD will assign Vonage the 192.168.0.5.

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# Get current details:
EXTERNAL_IP=`ifconfig eth0 | grep "inet addr:" | awk '{print $2}' | \
		cut -f 2 -d :`
VONAGE_IP=192.168.0.5

##############
# Vonage stuff

iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 53 -j DNAT --to ${VONAGE_IP}:53
iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 69 -j DNAT --to ${VONAGE_IP}:69

iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 5060:5061 -j DNAT \
		--to-destination ${VONAGE_IP}:5060-5061
iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 10000:20000 -j DNAT \
		--to-destination ${VONAGE_IP}:10000-20000
##############

