From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias
Date: Mon, 3 Jun 2002 23:44:53 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032244.g53MitA27298@Networker.rockstone.co.uk>
References: <20020603221558.71090.qmail@web9907.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603221558.71090.qmail@web9907.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Monday 03 June 2002 11:15 pm, "J=F6rgen" Danielsson wrote:

> The problem is that on 2 of the nics have to have 2
> ip's each, and the only way to have more than one ip
> on a nic is by using alias, as far as i know, and then
> they get names like eth1:0 and so on. I have not seen
> any other possibility for names in slack.

Actually, it is not the only way, the preferred method these days is to use=
=20
the iproute2 functions, which will add another address to your interface=20
without giving the alias a new name:

ip addr add w.x.y.z/bits dev eth0

(unless you use the 'label' option which Alin Nastac suggested earlier:

ip addr add w.x.y.z/bits dev eth0 label eth00)

And no, this is not ifconfig, this is newer and more powerful.

> But would it work if i specify it as eth1 in the rule
> and use the ip aswell, sounds weird if that would
> work.

Yes, that is what I am saying - if you want to specify the interface, call =
it=20
eth1; if you want to specify the destination address, then use that.   Use =

both together if you want.

eg:

ifconfig eth1 192.168.1.5
ifconfig eth1:1 192.168.1.9

iptables -i eth1 -d 192.168.1.9 -j ACCEPT

or whatever.....


Antony.

