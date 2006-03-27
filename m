From: "Bruno Nunes" <nunesb@gmail.com>
Subject: ip redirection
Date: Mon, 27 Mar 2006 12:13:35 -0300
Message-ID: <52837e3e0603270713g798cea20v1e718747a631a095@mail.gmail.com>
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

this is what the dns server does:

 intranet.xxxxxxxxx.com.br --> AAA.AAA.AAA.AAA

 requests to intranet... goes to AAA....A  (the router)

 this is what i want:

 AAA.AAA.AAA.AAA (router) --> BBB.BBB.BBB.BBB (webserver)

 BBB...B is an IP address inside a private network like 192.168.1.x
 AAA...A is a worldwide ip address like 139.82.x.x

 How can I do this redirection with iptables?

 thanks!

 bruno

