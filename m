From: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>
Subject: How install nth extension?
Date: Wed, 17 May 2006 15:44:47 -0400
Message-ID: <200605171544.48125.frankabel@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=nowsp; d=tesla.cujae.edu.cu;
	s=MDaemon; t=1147895142; x=1148499942;
	i=frankabel@tesla.cujae.edu.cu; q=dns; h=DomainKey-Signature:
	Received:From:Organization:To:Subject:Date:User-Agent:
	MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-Disposition:Message-Id; b=lq9kRrfMA9v1t0nMEt7ubRZaf5eWUz8
	zsqIeK7dFuqZxI1C+gJZSVBSwXF9skLYOh15WMU5gCaZkFiRduUSIRRqEdnBVZwr
	sYY9u4lctSC8/nB0/RhahLnpkj9jE2/GnlujjB3a0EzRtxWgyD1PmA27TTYTx58U
	nzWQzru3CvWk=
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

Hi all!

When put in command line "make KERNEL_DIR=3D/usr/src/linux" to compile the =

iptables-1.3.5 I don't see that in extensions directory appear the=20
"libipt_nth.so" file. After when I write "make install=20
KERNEL_DIR=3D/usr/src/linux" and try to add the following rule:

"sudo iptables -t mangle -A OUTPUT -p icmp -m nth --counter 0 --every 2=20
--packet 0 -j NFQUEUE 0"

the ouput error is:

"iptables v1.3.5: Couldn't load match=20
`nth':/usr/local/lib/iptables/libipt_nth.so: cannot open shared object file=
:=20
No such file or directory"

Well can anybody tell me what I must do to install "libipt_nth.so"?

Salute
Frank Abel


__________________________________________

XIII Convenci=F3n Cient=EDfica de Ingenier=EDa y Arquitectura
28/noviembre al 1/diciembre de 2006
Cujae, Ciudad de la Habana, Cuba
http://www.cujae.edu.cu/eventos/convencion

