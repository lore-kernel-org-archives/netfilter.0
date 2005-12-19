From: TAC Forums <tac.forums@gmail.com>
Subject: Firewall and a FTP server
Date: Mon, 19 Dec 2005 17:22:12 +0530
Message-ID: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
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

Hi All,

We have a FTP server, (Red Hat Linux 7) behind a firewall, the
firewall allows only incomming and established connections on ports
20,21  from any where and evry where.

The Problem is, when the customers use FTP clients, the manage to
login , but cannot upload/download files if they use PASSIVE FTP
connections.

Can smeone suggest, how the best way to get out of this situation,
should we enable all ports above 1023?

Regards,
Boskey

--
TAC Support Team

