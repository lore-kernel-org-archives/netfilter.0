From: "Dave Warchol" <Warchol@harthosp.org>
Subject: RE: iptables and device aliases
Date: Wed, 18 Aug 2004 15:20:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <s12373bc.050@hcnwgwds01.hh.chs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I will still need to define the device alias, correct?
Thanks
Dave

>>> "Jason Opperisano" <Jopperisano@alphanumeric.com> 08/18/04 09:25AM
>>>
> Hello:
>          I am new to the list.  I am currently using iptables to
> redirect traffic on eth0 for ports 80 and 443,  to ports 8080 and
8443,
> respectively.  I have request to set up another DNS name for this
server
> and to redirect entries coming to port 443 for this new DNS name to
port
> 8444.  I think that one way of doing this would be to define a
device
> alias, say eth0:1, assign it a new IP address and associate the new
DNS
> name with that new IP.  I could then use iptables to redirect traffic
on
> eth0:1, port 443 to port 8444.  I was just wondering if iptables
> recognizes/supports device aliases or if there is a better way of
> accomplishing the same thing.

iptables does not recognise the "eth0:1" syntax.  use ip aliases:

	ip address add x.x.x.x dev eth0

and then filter on "-i eth0" and ip address "x.x.x.x"

-j


