From: Carlos Pastorino <carlos.pastorino@gmail.com>
Subject: Fwd: How make iptables script with NAT handle "active FTP"?
Date: Thu, 2 Feb 2006 09:01:23 -0200
Message-ID: <cc4fcc140602020301k108c21fevb6574a74c7052a7b@mail.gmail.com>
References: <1138390474.4844.79.camel@localhost.localdomain>
	<1138787017.6290.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138787017.6290.2.camel@localhost.localdomain>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

In my system (Fedora Core 3 -- iptables 1.2.11-3.1.FC3), sometimes it
seems that the ftp conntrack stop working, because I try to connect
via FTP (PASV mode) and I get the return packets blocked. I have to
re-execute the iptables script to make it work again.

What causes this?

Is it a problem with the modules? Or is it something else?

By the way, is there an order in which I should execute the modules?
The order I'm using is:

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_tables
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_state
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat

Best regards,

Pastorino


---------- Forwarded message ----------
From: Eric Leblond <eric@inl.fr>
Date: Feb 1, 2006 7:43 AM
Subject: Re: How make iptables script with NAT handle "active FTP"?
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: Ray Schumacher <rays@blue-cove.com>, netfilter@lists.netfilter.org


Le vendredi 27 janvier 2006 =E0 11:34 -0800, Christian Seberino a =E9crit :
> Active FTP seems to need to open new sockets.
>
> This creates problems for NAT'ing firewalls.
>
> What is easiest way to open the right ports
>
> and do NAT'ing back to clients on 192.168.x.y IP addresses?

Netfilter has a module called ip_conntrack_ftp which is used to take new
socket opening into account for the ftp protocol. To use that feature
you need t load the module and use a rule which accept packet RELATED to
another connection :
iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

BR,
--
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBD4ILInxA7CdMWjzIRAv1fAKCP4dzVO4A2NVhlKI4QdFRC6wKzpwCggON2
7WNtTi23KdXS4/TGMMkMtXw=3D
=3DubS8
-----END PGP SIGNATURE-----

