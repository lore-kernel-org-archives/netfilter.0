From: chhj@scut.edu.cn
Subject: How to use the --set-mark mechanism to do the accessing limit
Date: Mon, 20 Mar 2006 18:32:12 +0800 (CST)
Message-ID: <22012409.42191142850732279.JavaMail.webmail@letterbox.scut.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-2022-jp"
To: netfilter@lists.netfilter.org

Hi!
     I am doing a small project about firewall in linux in which I will use=
 the --set-mark mechanism to do the accessing limit .For example ,The user =
of LAN 1 can access Server 1 and can't access Server 2 through --set-mark m=
echanism ,The user of LAN 2 can access=20
Server 2 and can't access Server 1 .I 'm going to use the netfilter/iptable=
s frame.
The data package from LAN 1 will be set mark 1 and the data package from LA=
N 2 will
be set mark 2 in PREROUTING chain in mangle table . My problem is that wher=
e to match=20
the data package ? In POSTROUTING chain ? Is need to register functions in =
Netfilter framework ? Is need to use iprouter2 ? and which one is the best =
?
=20
 I hope I could explain my point well.
 I will really appreciate any help.
 Thanks.=20
=20
 Sincerely,
 chewhai

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1chhj@scut.edu.cn
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12006-03-20

