From: Joel Newkirk <newkirk@newkirk.us>
Subject: Re: help to build a small firewall for a child
Date: Mon, 24 Mar 2003 03:16:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303240316.30446.newkirk@newkirk.us>
References: <Pine.LNX.4.50.0303232012210.4365-100000@dragonII.tasso.info>
Reply-To: newkirk@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.50.0303232012210.4365-100000@dragonII.tasso.info>
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
To: Andrea Tasso <andrea@tasso.info>, netfilter@lists.netfilter.org

On Sunday 23 March 2003 02:34 pm, Andrea Tasso wrote:
> hi all,
> this is a part of my configuration, now from 192.168.2.2 you can do
> surf the internet (I have default ipmask on 192.168.2.1, iptable
> based). the router I do not want to use it to do this stuffs, but the
> 192.168.2.1 server is what I want to use, with iptables, hopefully.
>
>
> child PC |       |                       |    | adsl                 =20
> | wlan0   |       |  wlan0 server eth0    |    | router              =20

It's generally believed to be a bad idea to post your complete firewall=20
rules and your public IP to the list.  All posts to this list eventually=20
find themselves on a public web page indexed by search engines.

> I want my child on 192.168.2.2 to be able to connect to a limited list
> of web sites (or IPs), say
> 209.10.154.66
> 192.25.206.10
> 63.70.47.55
>
> On eth1 of server there is another net 192.168.1.0 (the server is
> 192.168.1.1 and the other is 192.168.1.0) I want to keep to be able to
> do everything
>
> any example for me ?

This is not the best way to handle this, it really shouldn't be a=20
firewall solution.  Filtering in a proxy would be more appropriate.  If=20
the child in question has their own computer, and it runs windows, you=20
can enable filtering in Internet Exploiter and create an 'approved' list=20
there, which will require a password to bypass or add to.  But as far as=20
restricting via netfilter this should do what you ask:

iptables -N KidFilter
iptables -A FORWARD -s 192.168.2.2 -p tcp --dport 80 -j KidFilter
iptables -A FORWARD -s 192.168.2.2 -p tcp --dport 80 -j REJECT  \=20
--reject-with icmp-host-prohibited
iptables -A KidFilter -d 209.10.154.66 -j ACCEPT

etc.  You can also use the URL in a rule, like:
iptables -A KidFilter -d www.mamamedia.com -j ACCEPT

If you want to get fancier, you can keep a list of approved IPs (or URLs)=
=20
somewhere, like /usr/etc/KidFilterIPs, then add those from within a=20
firewall script with this loop:

for ip in $(cat /usr/etc/KidFilterIPs | grep -v #); do /sbin/iptables -A=20
KidFilter -d $ip -j ACCEPT; done

the "grep -v #" will match any line in the file that does NOT have a # in=
=20
it.  This means you have to have each IP or URL on a separate line, and=20
you can insert comment lines in the list simply by having a # somewhere=20
in the line, traditionally the first character.

If you go with this you'll need to ensure that /usr/etc/KidFilterIPs is=20
readable by root at least.


> and this iptables-save

Do you use iptables-load and iptables-save each time, or just to generate=
=20
this listing?  If you use it all the time, then the above approach would=20
still work, but obviously you wouldn't have a script you could place the=20
mentioned loop in...

> -A FORWARD -s 192.168.2.0/255.255.255.0 -i wlan0 -o eth0 -j ACCEPT

Just make sure that the rules for this specific computer are reached=20
before this rule here.  You want to filter 192.168.2.2 first, ACCEPTing=20
what is acceptable, REJECTing what you don't want to permit, THEN the=20
rest of 192.168.2.0/24 will still be handled by this rule.  If=20
connections from 192.168.2.2 hit this rule first, they will always get=20
through.

> andrea@tasso.info

j

--=20
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.


