From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: port scan detector problem
Date: Tue, 4 Oct 2005 09:45:08 -0400
Message-ID: <FAC4E024BF776842876169173CE2F0132837@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: afshin lamei <afshinlamei@gmail.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> afshin lamei
> Sent: Tuesday, October 04, 2005 8:52 AM
> To: netfilter@lists.netfilter.org
> Subject: port scan detector problem
>=20
> hi all,
> I am using the "port scan match" with its default values, my=20
> rules are like
> this:
> iptables -A INPUT -m psd -j LOG --log-prefix "port scan:"
> iptables -A INPUT -m psd -j DROP // Drop it silently
>=20
> one of my DNS servers is 4.2.2.4 <http://4.2.2.4/> , and I'm=20
> seeing these logs, which say the 4.2.2.4 <http://4.2.2.4/> is=20
> port scanning my box (external interface: 192.168.100.151=20
> <http://192.168.100.151/>) !!
>=20
> Oct 3 17:23:35 kernel: Port scan:IN=3Deth0 OUT=3D SRC=3D4.2.2.4=20
> <http://4.2.2.4/>DST=3D
> 192.168.100.151 <http://192.168.100.151/> LEN=3D8 PROTO=3DUDP=20
> SPT=3D53 DPT=3D32769 Oct 3 17:23:35 kernel: Port scan:IN=3Deth0=20
> OUT=3D SRC=3D4.2.2.4 <http://4.2.2.4/>DST=3D
> 192.168.100.151 <http://192.168.100.151/> LEN=3D1 PROTO=3DUDP=20
> SPT=3D53 DPT=3D32761 Oct 3 17:23:35 kernel: Port scan:IN=3Deth0=20
> OUT=3D SRC=3D4.2.2.4 <http://4.2.2.4/>DST=3D
> 192.168.100.151 <http://192.168.100.151/> LEN=3D1 PROTO=3DUDP=20
> SPT=3D53 DPT=3D32773 Oct 3 17:23:35 kernel: Port scan:IN=3Deth0=20
> OUT=3D SRC=3D4.2.2.4 <http://4.2.2.4/>DST=3D
> 192.168.100.151 <http://192.168.100.151/> LEN=3D1 PROTO=3DUDP=20
> SPT=3D53 DPT=3D32775 Oct 3 17:23:35 kernel: Port scan:IN=3Deth0=20
> OUT=3D SRC=3D 4.2.2.4 <http://4.2.2.4/>DST=3D
> 192.168.100.151 <http://192.168.100.151/> LEN=3D1 PROTO=3DUDP=20
> SPT=3D53 DPT=3D32780
>=20
> I think these are false positives, isn't it? if so, dropping=20
> them will cause problems, so what should i do?
> regards,

It probably is a false positive. If you have a mail server, your DNS
server might be working overtime resolving remote MX hosts for domains
(you can fix that by installing a caching-only nameserver on that
machine). As far as I know, Linux hosts do not cache DNS unless you
specifically install a caching-only server on them, so unless you do
they'll be asking for DNS all the time.

To fix your port-scan problem you should insert a rule which allows
outbound traffic from your DNS server using source port 53 before your
port-scanning rules.

Derick Anderson

