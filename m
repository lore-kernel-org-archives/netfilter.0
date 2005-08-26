From: Steven Zhang <zhangseven@gmail.com>
Subject: Is ACCOUNT target outdated in 2.6 kernel?
Date: Fri, 26 Aug 2005 11:28:11 +0800
Message-ID: <fd543852050825202829a6177e@mail.gmail.com>
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

Hi, there:=20
 As we know, the ACCOUNT target is very useful and effective for accounting=
=20
traffic within iptables.
But in my environment of 2.6.9.5 <http://2.6.9.5> kernel + 1.3.3 iptables +=
=20
pom-ng-20050823,
when I run the command "# ./runme ACCOUNT"
it displays: "cannot apply (1 rejects out of 2 hunks)"
 Then what is the way to use the ACCOUNT target correctly? :(=20
I need your help!
Thanks in advance.
