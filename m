From: David Trott <linux@davidtrott.com>
Subject: Re: Problems with policy based routing
Date: Fri, 16 May 2003 17:04:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053129871.3ec57c8f445d6@www.mailshell.com>
References: <000147C2.3EC4D93D@192.168.206.251>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000147C2.3EC4D93D@192.168.206.251>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: "rwaeger@m-logix.de" <rwaeger@m-logix.de>
Cc: netfilter@lists.netfilter.org


> From "rwaeger@m-logix.de" <rwaeger@m-logix.de> on 16 May 2003:

Apologies if I am stating the obvious here.
But based on your description:

> We're trying to setup a policy based Linux router to route "normal"=20
> services (like http(s) or ftp) over a DSL line and all other services
> (like smtp, ssh, pop3) over a leased line. The leased line router is=20
> listening to an official IP net. There are some internal servers (mail=20
> and web) which are using official IPs (but nated at Firewall-1). All=20
> traffic for and from these servers have to go over eth1.=20
=20
It seems logical to me to configure the "main" routing tables as if the
DSL line didn't exist i.e.:

- Add routes so that any traffic for the internal network is sent via eth0.
- Add a default route that points to eth1 (the leased line) to handle
  everything else.

Then create a second routing table "dslout" which handles the DSL line i.e.:

- Add routes so that any traffic for the internal network is sent via eth0.
- Add routes for any special cases that are needed on the leased line
  (via eth1). Special cases are only for specific IP=92s such as
  administrative interfaces on routers (on the leased line).
- Add a default route that points to eth2 (the DSL line) to handle
  everything else.


Add the rule using a fwmark:

ip rule add fwmark 1 table dslout


Then use iptables to mark the packets

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -p tcp --dport 443 -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -p tcp --dport ftp -j MARK --set-mark 1


I know this is pretty similar to what you have already, however there
are a few changes that I would like to highlight:

- It is not necessary to specify source or destination IP addresses
  in the marking rules as either routing table will handle the=20
  packets correctly.
- I am only using one fwmark because I do not believe the second
  fwmark gains anything.
- I am not adding a mangle rule for ftp-data because this will only
  catch passive ftp connections.
- I am not certain but I believe that if you insmod the Linux ftp
  conntrack module it should route ftp data along the same route as
  the original control connection. Note: You may need to add some state
  tracking rules to the FORWARD chain in order to get the conntrack module
  to work correctly.

Please bear in mind that I am pretty new to this myself so what I have
said may be wrong. But hopefully it might help,

David

