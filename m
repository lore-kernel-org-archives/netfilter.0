From: =?iso-8859-1?Q?Lo=EFc?= Minier <lool+netfilter@via.ecp.fr>
Subject: Re: Matching UDP broadcasts using RELATED
Date: Mon, 5 Jan 2004 17:13:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040105161337.GU30323@via.ecp.fr>
References: <xiwu88jw8c.fsf@random-node.example.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <xiwu88jw8c.fsf@random-node.example.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

yu5p97f02@sneakemail.com - Sun, Jan 04, 2004:

> For protocols which work by initiating a request using a UDP broadcast and
> expecting a reply for a specific host, is there any way to match the reply
> back to the original broadcast.
>=20
> An example of something that does this is smbmount, a request is broadcas=
t to
> the localnet with a port set to the netbios-ns port, and then smbmount ex=
pects
> a reply from a particular host to the initiating port.

 I think this should go in a conntrack module, but there's always the
 possibility for you to write such rules manually with the "recent"
 module.  See ``iptables -m recent --help''.

   Regards,

--=20
Lo=EFc Minier <lool@dooz.org>

