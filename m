From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 12:44:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E74@alderaan.smgtec.com>
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
To: SBlaze <dagent.geo@yahoo.com>, Alistair@nerdnet.ca, Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org

For RAM: /proc/slabinfo gives you a lot of memory allocation info. The
second column is the 'number of objects' and the third column is the
'size of object'

For CPU: the 'system' on the CPU states field handles the cpu load on
the system.

For disk: there is not a consideration. Netfilter shouldn't be affected
by disk I/O.

The only serious slowdowns I had with Netfilter were when I had a memory
leak. I had 2.4.20 redhat derived kernel with a semi-recent
patch-o-matic.=20

The memory kept on building up, and eventually I was so short on memory
that the whole system started grinding doing anything. I updated to
2.4.22 and the problem has totally disappeared, as well as those
annoying slowdowns.=20

