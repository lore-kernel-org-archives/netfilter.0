From: LuisMi <luismi@adpsoft.com>
Subject: Re: what traffic is this?
Date: Wed, 26 Jun 2002 16:58:22 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206261658130.26555-100000@ns2.adpsoft.com>
References: <fd.19d60313.2a4b1ace@aol.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <fd.19d60313.2a4b1ace@aol.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JHoskins98@aol.com
Cc: netfilter@lists.samba.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks for the info. :)

- -- 
Luis Miguel Cruz.  

PGP KEY: 0x3AC52657   |   [ADPSOFT] http://www.adpsoft.com
		      |      "Connecting your business"

On Wed, 26 Jun 2002 JHoskins98@aol.com wrote:

> The traffic is CDP - Cisco Discovery Protocol.  It is a heartbeat to detect 
> changes i.e. newly attached or detacted cisco equipment.  
> 
> You can turn it off with "no cdp run" command at the enable prompt or "no cdp 
> enable" at the interface.  
> jhh
> 
> In a message dated 6/26/2002 7:37:06 AM Eastern Standard Time, 
> netfilter-request@lists.samba.org writes:
> 
> 
> > This traffic comes from a cisco router.
> > what type of traffic is ?
> > 
> > [root@cuelebre root]# tcpdump -i eth2
> > tcpdump: listening on eth2
> > 
> > 13:19:12.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
> >                          0000 0100 0000 0000 0000 0000 0000 0000
> >                          0000 0000 0000 0000 0000 0000 0000 0000
> >                          0000 0000 0000 0000 0000 0000 0000
> > 13:19:22.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
> >                          0000 0100 0000 0000 0000 0000 0000 0000
> >                          0000 0000 0000 0000 0000 0000 0000 0000
> >                          0000 0000 0000 0000 0000 0000 0000
> 
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj0Z1pEACgkQvQHLTzrFJle/hgCgjnU7W3LIc2i+l+RJ77VS0qDC
dNcAoJrZuGnYCdnMYGQK8+yY4NJWKgLu
=3K1e
-----END PGP SIGNATURE-----


