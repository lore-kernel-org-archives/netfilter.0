From: "Fabrice Triboix" <Fabrice.Triboix@imgtec.com>
Subject: How to remove TCP options when doing NAT?
Date: Wed, 27 Jun 2007 10:51:45 +0100
Message-ID: <917D8AC5A524D343B28848D8BBFFEC0701B22523@klmail1.kl.imgtec.org>
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
To: netfilter@lists.netfilter.org

Hi,=0D=0A=0D=0AI have noticed that to handle masquerading, linux adds some =
TCP=0D=0Aoptions to the output packets (for a TCP stream, of course).=0D=0A=0D=
=0AI would like to know if there is a way to avoid that=3F Or more=0D=0Aacc=
urately: is it possible to tell the linux kernel to do the=0D=0Amasqueradin=
g without adding these TCP options=3F=0D=0A=0D=0AThank you very much for an=
y help,=0D=0A=0D=0A  Fabrice Triboix=0D=0A-=0D=0AThis message is subject to=
 Imagination Technologies' e-mail terms: http://www.imgtec.com/e-mail.htm=0D=
=0A-=0D=0A

