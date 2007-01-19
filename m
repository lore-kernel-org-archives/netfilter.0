From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 23:34:03 +0100
Message-ID: <45B1475B.7010906@plouf.fr.eu.org>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>	<45B11AF9.8060209@plouf.fr.eu.org>
	<009901c73c02$d046cad0$0700a8c0@stormbook>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009901c73c02$d046cad0$0700a8c0@stormbook>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

saspan a =E9crit :
>=20
> See: The browser sends http-request to e.g. 99.9.9.9.1:80.
> The request is redirected to proxy on 127.0.0.1:3128.
> Browser waits for reply from 99.9.9.9:80.
> Actually the reply will come from proxy on 127.0.0.1:3128.

Yes. Then the NAT code is supposed to translate it back to 99.9.9.9:80=20
on its way to the browser. Is this actually what happens ?
What is the kernel version ?

