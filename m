From: "Dorian Haasler" <dorian@uptime.at>
Subject: RE: Redhat 7.2 Kernel
Date: Wed, 10 Jul 2002 10:39:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000c01c227ed$4f5a8520$050b10ac@tuq155u4834h40>
References: <000001c2277c$93210d40$7200a8c0@blue>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000001c2277c$93210d40$7200a8c0@blue>
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
To: 'Denis JULIEN' <denis.julien@vupublishing.net>, "'Mike G. Hammonds'" <mhammonds@knowledgeinenergy.com>
Cc: "'Iptables-User-list (E-mail)'" <netfilter@lists.samba.org>

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Why using rc.firewall scripts with RedHat? Write your script and at
the of it use "iptables-save" to store the information!
At the next reboot the iptables settings will be the same and you
don=B4t need to run your script every time. Changes can done in
/etc/sysconfig/iptables
where the rules where stored!

 Mfg,
Dorian Haasler

- -----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Glover George
Sent: Tuesday, July 09, 2002 9:12 PM
To: 'Denis JULIEN'; 'Mike G. Hammonds'
Cc: 'Iptables-User-list (E-mail)'
Subject: RE: Redhat 7.2 Kernel


If you install redhat with no firewall (i.e, when it asks for medium,
high, or no firewall), these scripts will exist but will not run.=20
Then
the common practice around here is to just create your script in
/etc/sysconfig/network-scripts/rc.firewall.  And have that run in
/etc/rc.d/init.d/rc.local (although I believe local is run after all
scripts, so this may not be the most secure for a highly secure
solution).

Glover George
Systems/Networks Administrator
Gulf Sales & Supply, Inc.
dime@gulfsales.com
(228)-762-0268


> -----Original Message-----
> From: netfilter-admin@lists.samba.org [mailto:netfilter-
> admin@lists.samba.org] On Behalf Of Denis JULIEN
> Sent: Tuesday, July 09, 2002 1:13 PM
> To: 'Mike G. Hammonds'
> Cc: Iptables-User-list (E-mail)
> Subject: RE: Redhat 7.2 Kernel
>=20
> I suggest that you read this very good documentation:
> http://www.netfilter.org/documentation/tutorials/blueflux/iptables-
> tutorial.
> html#INSTALLRH71
> I'm using also red hat 7.2 and this was able to solve the same
> problem like
> you
> rg
> Denis
>=20
> -----Message d'origine-----
> De : Mike G. Hammonds [mailto:mhammonds@knowledgeinenergy.com]
> Envoy=E9 : mardi 9 juillet 2002 16:17
> =C0 : Iptables-User-list (E-mail)
> Objet : Redhat 7.2 Kernel
>=20
>=20
> Does the default install kernel of RH7.2 have iptable support
> already compiled in it?
>=20
> Mike Hammonds
> Fellon-McCord & Associates, Inc.
> Information Services Manager
> Voice (502) 214-6324 Fax (502)426-8800
> mhammonds@knowledgeinenergy.com
<mailto:mhammonds@knowledgeinenergy.com >
>=20





-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 7.0.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBPSvyui/JW8KXJ5IHEQJscwCggkKbc9gC9HjyynhIwkOhcW/zMZIAoMYw
lHxh6q0MQckwScyFIypGRI5X
=3DKqOe
-----END PGP SIGNATURE-----



