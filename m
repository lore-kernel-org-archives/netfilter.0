From: "Bruno Nunes" <nunesb@gmail.com>
Subject: ip redirection and multiport noobish question
Date: Mon, 27 Mar 2006 16:57:50 -0300
Message-ID: <52837e3e0603271157p80fbb87g154345f50735c4c4@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

first i want to thank the replys for my first post!
i want to do another route now

anypc --> webserver1 --- (router) --> webserver2

ip webserver1 =3D a.a.a.a (worldwide)
ip router =3D b.b.b.b (router)
ip webserver2 =3D c.c.c.c (intranet)

webserver1 uses APIs running on webserver2.

people over the internet should be able to see the contents of
webserver2 which is on the local network

how can i route this?

