From: zottmann <zottmann@ig.com.br>
Subject: Reserving bandwidth with iptables
Date: Thu, 18 May 2006 10:11:18 -0300
Message-ID: <20060518_131118_033947.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1147957878"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1147957878
Content-Type: text/plain; charset="iso-8859-1"
Content-description: Mail message body
Content-Transfer-Encoding: quoted-printable
Content-disposition: inline

Hi !!=20

Our management asked us to reserve some bandwidth to our vip users, and, as=
=20
we use Squid proxy, I was thinking that we could achieve it by setting an=20
outgoing ip address at the Squid proxy based on the user=B4s group, and=20
reserve bandwidth at the iptables firewall based on this ip address.=20

Is this feasible? Can we reserve bandwidth with iptables alone, or shoule w=
e=20
use another product as well?=20

Thanks in advance,=20
Carlos.=20



--Message-Boundary-by-Mail-Sender-1147957878--


