From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Error in Masquerade ??
Date: Fri, 10 Mar 2006 09:27:14 -0600
Message-ID: <1142004434.2617.26.camel@davila.nicaraguaopensource.com>
References: <581260b00603100701n3beddb20p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <581260b00603100701n3beddb20p@mail.gmail.com>
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
To: Leandro Silva <lansoweb@gmail.com>
Cc: netfilter@lists.netfilter.org

Leandro:

You need another rule to alter the source ip address of the outgoing
packets.

iptables -t nat -A POSTROUTING -o eth0 \
-j SNAT --to-source <server_address>

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Jorge.

El vie, 10-03-2006 a las 12:01 -0300, Leandro Silva escribi=F3:
> I have the following rule in my firewall:
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> And that's the only rule if postrouting chain. It's working fine but
> from time to time a packet leaves the server with the original ip and
> not with the server's. It's happening  like 1 "wrong" packet for 100
> or 200 ok.
> I've tried in other servers with same results and different
> "Mandrakes" ( 9.1, 10,1 and 2006.0 ). And different cpus ( p3, p4,
> amd, all with 512 mb ram ).
> Any ideias ?
>=20
> Thanks a lot
> Leandro
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20


