From: Patrick Schaaf <bof@bof.de>
Subject: Re: Arbitrary Netmasks
Date: Tue, 28 May 2002 17:03:11 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020528170311.A11139@oknodo.bof.de>
References: <3CF383A9.7000106@mytomorrow.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CF383A9.7000106@mytomorrow.de>; from josef.k@mytomorrow.de on Tue, May 28, 2002 at 03:18:33PM +0200
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
Content-Transfer-Encoding: 7bit
To: Thomas Heinz <josef.k@mytomorrow.de>
Cc: netfilter@lists.samba.org

Hi,

(removed netfilter-devel from the headers, this is not a development Q)

> Netfilter supports arbitrary netmasks for IP addresses which is more
> powerful than just those IP/x (0 <= x <= 32) expressions.
> For example one could use IP/255.0.255.255 (IP/23.13.42.0 would also work ;-).
> 
> Are masks that cannot be expressed in the IP/x schmeme (at least not in one
> rule) used in practise? Are they used at all in firewall rulesets?

They are used in practise. I have been using them with ipfwadm, and I am
using them with iptables.

What I use them for, is "statistical multiplexing" based on one or more
of the low bits (but not the lowest!) of IP addresses. For example, I have
a dual-processor system with two squid processes, and want to distribute
a number of incoming clients evenly (and deterministically) over the two
squid processes. For godgiven reasons, under light load, the "even"
client IPs are preferred over the "odd" client IPs. To get a good distribution
for both light load and full load, I look at the second lowest bit of the
client IP address to determine where to REDIRECT to, like this:

iptables -t nat -A PREROUTING -s 0.0.0.0/0.0.0.2 -j REDIRECT --to-port 1234
iptables -t nat -A PREROUTING -s 0.0.0.2/0.0.0.2 -j REDIRECT --to-port 1235

Another real world example I have seen in use in Cisco access-lists,
where the noncontigous mask works just like in iptables, is to pick
out "the same local ip" in a range of subnets. Imagine you have a
number of LANs with IP addresses 10.23.x.y/16, and y==1 is your
default gateway in every LAN. Given 10.23.0.1/255.255.0.255, you
have a single-rule expression for "all gateways in my LANs", which
is preferrable (if you manage to keep to the scheme!) to a sequential
list of rules, one per LAN.

best regards
  Patrick

