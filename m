From: Matteo <matteo.king@libero.it>
Subject: Iptables&& Invalid Argument
Date: Sun, 23 Mar 2003 11:11:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303231111.22364.matteo.king@libero.it>
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

Hi all,
I have a little problem..... I use a Redhat 7.3 with kernel 2.4.20 . I ha=
ve=20
installed iptables 1.2.7a and patch o matic and recompilated the Kernel a=
nd=20
it works.
But the problem is when I launch this command:
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE=20
That produced : Invalid Argument=20
I have loaded first the modules but the result is the same!!!

Can i help me??

Thanks a lot!!!
Bye

Matteo

