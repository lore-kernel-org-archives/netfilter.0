From: Payal <rpayal@indiainfo.com>
Subject: migration to iptables
Date: Mon, 10 Jun 2002 19:48:18 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <ae2cts$80k$2@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi all,
I used to use ipchains like=20
ipchains -A forward -j MASQ=20
to share internet connection. Now on Linux kernel 2.4.18 on Mdk 8.2 I wan=
t to=20
try iptables for a while.
I just substitued ipchains in the above command with iptables=20
iptables -A forward -j MASQ
iptables v1.2.5: Couldn't load target `MASQ':/lib/iptables/libipt_MASQ.so=
:=20
cannot open shared object file: No such file or directory

I heard MASQ cannot be used like this here. How do I use iptables for the=
=20
same purpose as for ipchains.
Thanks a lot in advance and sorry for the non-techinicality of the mail :=
)
Thanks and bye.
-Payal

