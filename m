From: Alexander Salmin <security.member@gmail.com>
Subject: IRC and ident with iptables
Date: Sun, 5 Jun 2005 16:23:50 +0200
Message-ID: <393114f9050605072369575137@mail.gmail.com>
Reply-To: Alexander Salmin <security.member@gmail.com>
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

Hi.

I've set up my firewall so that it provides NAT for a small network.
That network has about 10 computers who are beeing used by diffrent
users. The problem is that I can't find a way to make the IRC-servers
that those computers are connected to recognize each computers
diffrent ident. So, what I would like to know is if there is a way to
make iptables recognize to whom it should portforward to, based of
what internal ip that is connecting. Can it be done? If not, is there
any identd-server for Linux 2.6 that you know could do this?

-Alexander

