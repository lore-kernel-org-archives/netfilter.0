From: Rocco Stanzione <iptables@linuxkungfu.org>
Subject: MARK matching
Date: Sat, 14 Dec 2002 02:49:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212140249.21687.iptables@linuxkungfu.org>
Reply-To: grasshopper@linuxkungfu.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Group:

I don't like the idea of allowing all traffic destined for the external I=
P on=20
the external interface on a machine that doubles as a firewall and a serv=
er. =20
But I have a webmail interface that doesn't work unless I do just that.  =
What=20
I want to know is, is it valid to use the MARK target on these packets on=
=20
their way 'out' so that they can be recognized as not having been spoofed=
?  I=20
haven't seen any documentation on using it like this, and I wonder if thi=
s is=20
a viable solution, or if anyone has a better idea.

Thanks,

Rocco

