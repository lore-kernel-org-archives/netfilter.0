From: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Subject: Problems With MASQ/ Kernel 2.4.29
Date: Fri, 11 Mar 2005 18:01:27 -0600
Message-ID: <20050311180127.rcp5r70mjo0c4c4c@mail.col.gob.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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

I recently compiled kernel 2.4.29 with all netfilter options as modules.

All start ok, but when i set the MASQUERADE jump target on POSTROUTING
i got:
iptables -t nat -I PREROUTING -o eth0 -j MASQUERADE
iptables: target problems.

So, i recompiled the kernel but now, all netfilter options directly injecte=
d to
kernel and i got the same problems.

Thanks.

-----------------------------------------------------
"2005, A=D1O DE LA FEDERACION DE ESTUDIANTES COLIMENSES"

