From: "John Hill" <jhill@noach.com>
Subject: Iptables 2.4.x kernels
Date: Fri, 11 Mar 2005 23:48:26 -0500
Message-ID: <SIMEONMjFEFuopJLW1100000001@mail.noach.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

El vie, 11-03-2005 a las 12:36 -0500, John Hill escribi=F3:
> Should I consider iptables to be dropping 2.4.x kernel support?
>=20
> I have yet to compile iptables successfully since 2.4.26 and 1.2.11. I =
get
a
> MUTEX error. This was addressed by a patch (sent to me in email) but a
> permanent fix has failed to make the kernel and the iptables code. The =
new
> 2.4.29 and 1.3.1 still does it. I also had segmentation errors with
> shorewall after applying the patch to 2.4.28 and 1.3.0. I gave up =
without
> looking into the problem further hoping the new kernel and iptables =
would
> fix it. It has not.

Are you applying the patch-o-matic patches to the kernels and userspace
tools? You must do it to compile the code.

> Thanks
>=20
> --john

Regards.


Yes I patched it with the latest ng.

--john


