From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: newbie question
Date: Mon, 24 Mar 2003 11:27:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303241127.59577.netfilter@newkirk.us>
References: <1048521242.10333.55.camel@razor>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048521242.10333.55.camel@razor>
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
To: Scott Melnyk <scott@sbc.su.se>, netfilter@lists.netfilter.org

On Monday 24 March 2003 10:54 am, Scott Melnyk wrote:
> Hello, I hope this is not to simple to post. I have not quite got
> IPTABLEs use down.
>
> I am looking at setting up local firewalls on  a cluster of machines
> (almost 100 linux boxes running RH 7.3 and 8.0).  The login nodes for
> the cluster have extensive hardware based firewalling rules.
>
> On the rest of the cluster I would like to set IPTABLEs to accept
> everything within the subnet and drop the anything from and outside
> address.
>
> My thought for setting the rules on each machine is by pushing out and
> running a bash script.
> Is it possible to simply set up a firewall with something as simple
> as:
>
>
> #!/bin/bash
> #
>
> service iptables stop
>
> iptables -F
>
> iptables -A INPUT -m limit -j LOG
> iptables -A OUTPUT -m limit -j LOG

Are you sure this is what you want?  It will log 5 entries the first=20
hour, then 3/hour after that.  (presuming you have at least that many to=20
log)

> iptables -A INPUT -s 130.xxx.xxx.128/25  ACCEPT
> #rule here to drop all non 130.xxx.xxx.128/25

Two things here - first, the DROP policy below will drop anything not=20
already accepted, so you don't need and explicit DROP.  Second, you can=20
specify this DROP (if you really want it) with
iptables -A INPUT -s ! 130.x.x.128/25 -j DROP

> iptables -P FORWARD DROP
> iptables -P INPUT DROP
>
> service iptables save
>
>
> We have a subnet of 130.xxx.xxx.128/255.255.255.128
> How can I define a mandatory drop of everything not in
> 130.xxx.xxx.128/255.255.255.128?

Just the DROP policy is all that is needed, so long as you specify the=20
source IP in ACCEPT rules.

> Finally what risks am I taking by doing this?  Other than if someone
> hacks into one of the login nodes, I realize this would then give them
> access to the rest of the cluster.

The only risk I see is of someone spoofing one of your IPs.  If all=20
communications will take place with specific ports or protocols, you can=20
tighten the ACCEPT rule to only allow that in.  But as you have it, the=20
only thing that these boxes would accept communications from would be=20
their own subnet, and if you doun't have unnecessary services running=20
you shouldn't have much to worry about.

j


