From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through masquerading gateway
Date: Tue, 9 Jul 2002 15:35:38 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000201c22798$f2ffd540$6b01a8c0@s3ac>
References: <000a01c22798$9a5773d0$0401000a@win2k>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000a01c22798$9a5773d0$0401000a@win2k>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1254"
To: "'R. Sterenborg'" <rsterenborg@xs4all.nl>, netfilter@lists.samba.org

First off thanks for taking the time.


> Anyway, PPTP forwarding with kernel 2.4.18 works, so you=20
> should be able to do it too (and use ReiserFS) :o)


ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html

I'm assuming you used the above patch with the

zcat patchfile.gz | patch -l -p1=20

Patch this is the only way I got it to work.



> If you portscan port tcp/1723 to your external gateway IP=20
> from *another external IP*, what is the state of the port  ?=20
> Don't portscan to the external IP from the machine itself or=20
> from any host behind iptables being NATted on that gateway.=20
> The results will be meaningless, it's like if there's no=20
> iptables running at all.

My test situation is basically two networks 192.168.2.0/24
And 192.168.1.0/24 with my Firewall playing router. I test
From a single machine on 192.168.1.0/24. knowing that you got this
To work I'll put some more time into trouble shooting it.


> Hope this helps,
>=20

It=92s a great start


