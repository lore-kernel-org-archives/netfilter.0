From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Tue, 10 Dec 2002 03:12:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212100312.13403.apapadop@cmu.edu>
References: <Pine.LNX.4.33.0212100849050.9625-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212100849050.9625-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 10 December 2002 02:52, Jozsef Kadlecsik wrote:
> On Mon, 9 Dec 2002, Alexandros Papadopoulos wrote:
> > /sbin/iptables -P OUTPUT DROP
> >
> > #####################
> > #### CHAIN INPUT ####
> > #####################
> >
> > ## Accept everything incoming on loopback interface
> > /sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -i lo -j ACCEPT
> >
> > ## Accept all incoming traffic from related or established
> > connections /sbin/iptables -A INPUT -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> >
> > ## Allow connections to our ftp server
> > /sbin/iptables -A INPUT -p tcp --dport 2121 -j ACCEPT
> >
> > ..but still, the packets with the SYN flag set when the client
> > tries to establish the new data connection are dropped. Someone
> > please tell me what am I missing? I'm sure it's something obvious
> > but I can't seem to find it!
>
> What about the rules in the OUTPUT chain?

Oops, I'm sorry. I actually tested with a default ACCEPT policy in the=20
output chain to rule problems from there out, but forgot to mention it.=20

In any case, the relevant rules from the output chain are:

## Allow outgoing FTP (data) + HTTP replies
/sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT

## Allow data for incoming FTP to return back to sender
/sbin/iptables -A OUTPUT -p tcp --sport 2121 --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT

I'd bet that the problem is that the SYN request sent from the client to=20
my server gets dropped, though. Seems like a conntrack/INPUT thing.

Thanks

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE99aHdgmAMwQt1gmURApc8AJ4rhcf4LzELDQ399VEuunF8VBnWYwCcDNlN
oY6E1VBYAM/mHufJen5YrDk=3D
=3DxJ8w
-----END PGP SIGNATURE-----


