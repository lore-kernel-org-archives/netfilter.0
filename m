From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Why is networking enabled at kernel level?
Date: Tue, 6 Apr 2004 11:22:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F41@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Kenneth Andresen <kenneth@cancun.net>, netfilter@lists.netfilter.org

Kenneth Andresen wrote:
> Hello all,
>=20
> I have been searching for information related with why networking is
> part of the Linux kernel itself, but have found nothing at either
> kernel.org or with any of my Google searches. =20
>=20
> I can see multiple pro's and con's but am looking for a more
> extensive discussion about this. Anyone who can provide me with some
> good links? =20


1. Zero-copy networking means that when interpreting the packet, the
buffer never needs to be moved around in memory. This speeds up the
processing of the packet dramatically. You need at least a single buffer
copy to userspace in order to float the packet to the higher layer
interpreter.

2. The network code is very tied to the hardware, which means you'd
pretty much need to manage hardware from userspace as well. This breaks
the ability to network boot off DHCP/Bootp and NFS. This DOES get used.

3. The security capabilities are tied to the kernel. I think that Linus
and company stick to the unofficial POSIX standard on implementing this.

4. Linux is a Network Operating System (Even NT has networking in the
lower layers)

5. Context switches abound, assuming you're not memory mapping
everythign in sight (see security consequences!)


Anyone who replaces a networking sub-system due to some exploit, should
be competent enough to replace the entire kernel.
I'm sure there are a ton of other reasons, but I'll leave that to
someone else.

