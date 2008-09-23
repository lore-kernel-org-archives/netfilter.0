From: "Kristopher L. Bachtal" <kbachtal@gmail.com>
Subject: Re: IPSEC VPN Pass-Through/Nat-T Help Needed
Date: Tue, 23 Sep 2008 00:40:02 -0400
Message-ID: <48D87322.7040706@gmail.com>
References: <48D7FBA5.70402@gmail.com> <34ecc2db0809222056y5bc2a12fg1c94e4af6ebe3e8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <34ecc2db0809222056y5bc2a12fg1c94e4af6ebe3e8a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello again,

I have heard of IPSec NAT-T as you can see from the subject of my
original post. In fact as I said before a --> Single <-- IPSec
Connection works just fine through our Linux Gateway/Firewall. My
problem is getting --> Multiple <-- Ipsec connections from multiple
client machines to work simultaneously. What do I need to do to get this
working on my Linux NAT Gateway/Firewall? Is there a compile time option
in  netfilter or the kernel I need to enable? Or is there some module
like nf_conntrack_ipsec or nf_nat_ftp I need to load? The network
admin's from the remote network that we are connecting to are pushing me
to remove the Linux Gateway/Firewall and replacing it with a Cisco
router that they say will allow this. I'd rather stick with our Linux
Gateway/Firewall if possible, and I think it should be capable of this.
Once again any help would be appreciated.

P.S. I realize a site to site VPN would probably be the best way to do
this but the admin's from the remote network will not allow this due to
their security policy.

Thank you,
Kristopher L. Bachtal

Anton V. Antonenko wrote:
| Hi,
| IPSec does not work after NAT.
| You must use NAT-T. see of http://en.wikipedia.org/wiki/NAT_traversal
|
| 2008/9/22 Kristopher L. Bachtal <kbachtal@gmail.com>:
|> Hello,
|>
|> I have a Fedora Core 5 machine running kernel 2.6.20-1.2320 and
|> iptables/netfilter acting as a gateway/Nat for a private network to the
|> internet. I have several client machines (aprox. 10, Running Windows XP)
|> that are behind this router that need to create individual IPSec VPN
|> (Cisco IPSec Software Cleint)connections over the internet to a Cisco
|> VPN Concentrator (Diagram Below). I can only seem to get one client at a
|> time to work. If I try to start a second VPN connection from another
|> machine it connects to the VPN Concentrator but will not carry any data.
|> (i.e. Cant ping, traceroute, etc.) I'm thinking I need some type of
|> connection tracking kernel module for IPSec Connections (like
|> nf_conntrack_ftp but for Ipsec instead of FTP) but I cant find any
|> reference to one in the documentation or google searches that I have
|> done. Any help would be greatly appreciated.
|>
|> Clients(10) --> Gateway/Nat     --->    Internet  --->  Remote Network
|> (Windows XP)    (Fedora Core 5)                         (Cisco VPN Box)
|> Private IP      Private IP / Public IP                  Public IP
| --
| To unsubscribe from this list: send the line "unsubscribe netfilter" in
| the body of a message to majordomo@vger.kernel.org
| More majordomo info at  http://vger.kernel.org/majordomo-info.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI2HMiG8acbTj+cSARAqZ2AKCS+KUYKuZey0j6L3dQtBPcGGgsvACggsZM
bMlY5MMjEwjT4Vnl59aQfdg=
=7kaD
-----END PGP SIGNATURE-----
