From: Steve W <stevew@bandwidtharbitrator.com>
Subject: Allowing only a certain source IP range back out through the bridge
Date: 19 Jun 2003 18:25:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056072342.25728.44.camel@negun.uis.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I am wanting to stop such things as fake packets going out our network. 

Some of the new worms send out bogus packets claiming to come from IP's
that are not legit would be one case where this may be helpful.

I have a bridge with firewall capabilities setup and it is doing fine
with what it is doing so now I would like to know if there is a way to
say something like:

If the source is between 192.168.0.20 and 192.168.0.30 and the direction
it is going is from eth1 to eth0 then it is okay, let it go through.

something like:
iptables -A FORWARD --in-interface eth1 --out-interface eth0 -s \
 192.168.1.20 -j ACCEPT

Would this work and how do you allow a range of IP's or would I have to
add a rule for each IP I want to allow out.

Thanks.


