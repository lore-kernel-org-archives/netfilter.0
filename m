From: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Subject: Problem using "string" support on iptables
Date: Wed, 06 Sep 2006 13:50:52 -0500
Message-ID: <20060906135052.taczeo17kgs04ock@mail.col.gob.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes"; format="flowed"
To: netfilter@lists.netfilter.org

I want block a certain packets with some text on it.
Im using iptables 1.3.5 and i want do the follow:

iptables -I FORWARD -p tcp --dport 1863 -m string --string "someuser" -j DRO=
P

And i get this error:

iptables v1.3.5: STRING match: You must specify `--algo'

Why i get that problem?

Thanks.


--=20
Ing. Rogelio C. Sevilla Fern=E1ndez
Direcci=F3n de Desarrollo Telem=E1tico / Secretaria de Administraci=F3n
Tel (312)3162062 / (312)3162000 ext 2360
Gobierno del Estado de Colima.

-----------------------------------------------------
  "2006, A=D1O DEL BICENTENARIO DEL NATALICIO DEL LIC.
     BENITO JUAREZ BENEMERITO DE LAS AMERICAS"
-----------------------------------------------------


