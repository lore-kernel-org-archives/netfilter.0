From: "Steve Howard" <showard@kennesaw.edu>
Subject: Re: iptables rules for forwarding remote desktop
Date: Wed, 06 Nov 2002 15:10:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sdc93102.060@kennesaw.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Thank you very much,

I tried those three rules, I even flushed all the other rules and saved. =
This still is not working.

I can scan the Linux machine with nmap and it does not show port 3389.
I can scan the windows machine and it does show the port 3389.

Should the port 3389 show up on a nmap scan of the Linux machine?


>>> Antony Stone <Antony@Soft-Solutions.co.uk> 11/06/02 01:56PM >>>
On Wednesday 06 November 2002 6:45 pm, Steve Howard wrote:

> I have a RedHat 8 machine with 2 ethernet cards. eth0 is connected via =
dhcp
> to the Internet (cable modem). eth1 is private 192.168.1.1. I have a
> windows xp machine which I have set up to acquire a dhcp address, (it is
> always 192.168.1.10). I would like to be able to use the remote desktop
> (port 3389) from outside. I understand that I will have to forward port
> 3389 to eth0 so that I can access this port from my office machine. I =
have
> seen recommendations of one rule, and I have seen recommendations that =
have
> three rules listed. Can anyone help me get this right?

iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 3389 -j DNAT --to=20
192.168.1.10
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -s a.b.c.d -p tcp --dport 3389 -j ACCEPT

where a.b.c.d is the address of your office machine - otherwise anyone =
will=20
be able to access your xp desktop :-)

I assume this service runs on TCP port 3389 - if it's UDP for some =
reason,=20
simply change both instances of tcp to udp in the rules above.

Antony.

--=20

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to =
play=20
with them



