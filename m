From: Katriel Traum <katriel@traum.org.il>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 09:58:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301310958.38656.katriel@traum.org.il>
References: <200301301931.41645.katriel@traum.org.il> <20030130193408.GR11221@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030130193408.GR11221@miggy.org>
Content-Description: clearsigned data
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
Content-Type: Text/Plain; charset="windows-1255"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thursday 30 January 2003 19:34, Athan wrote:
> On Thu, Jan 30, 2003 at 07:31:38PM +0000, Katriel Traum wrote:
> > I want to redirect _all_ traffic into the DMZ (is that even possible?)
> > and in the same time MASQ the LAN. The question is will they collide? If
> > I use a ruleset such as:
> > iptables -A PREROUTING -i $INET_IF -j DNAT --to-destination $DMZ_IP
> > iptables -A POSTROUTING -o $INET_IF -j MASQUERADE
> > (yes, there's only one computer in the DMZ)
> >
> > Will I get return traffic into my lan? won't it be DNATed into the DMZ?
>
>   You need at least one public IP that is *NOT* in the DMZ.  Then change
> the DMZ rule to exclude on this:
>
> iptables -A PREROUTING -i $INET_IF -d ! <not-DMZ IP> -j DNAT
> --to-destination $DMZ_IP

Well, the problem is I have 1 public IP via a cable modem.
So I ask again, if I DNAT everything into the DMZ lan, and try to MASQ my=20
private lan, will I even get return traffic?


>
> This IP would also be the IP on the outgoing interface of the firewall.
> So should automatically get used for MASQUERADE.  If it's all static,
> then just use SNAT instead of MASQUERADE and you can specify the IP to
> be sure of it:
>
> iptables -A POSTROUTING -o $INET_IF -s <LAN network> -j SNAT --to-source
> <not DMZ IP>
>
> Note the '-s' bit on that rule so you only SNAT traffic coming from the
> LAN, and not that from the DMZ.
>
>   I'm sure others will correct me if anything in this is wrong ;).
>
> -Ath

=2D --=20
+katriel                                                =EB=FA=F8=E9=E0=EC+
pgp key: traum.org.il/gpg.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+OkjODWy+Hv/461sRAvv4AKCFs+zLCmzRs6lgjQtNV9T9IrZGJgCcD5bg
41rSU533ygx88Bjz40TlwXU=3D
=3DrV9v
=2D----END PGP SIGNATURE-----


