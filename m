From: tlussnig@bewegungsmelder.de
Subject: NAT
Date: Wed,  1 Oct 2003 04:11:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065006710.3f7ab6766809d@mail.bewegungsmelder.de>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

Hi,
i use iproute2 for statical nat.
My Problem is that connect from intern-extern and extern-intern work fine.
But if i try to connect my external ip from an internal box it does not w=
ork.

Intern:
1.1.1.10/24 (ssh-server)
Extern:
217.0.0.10 (ssh-server
Gateway:
1.1.1.1
217.0.0.1


1.1.1.10/24--------[1.1.1.1/217.0.0.1](217.0.0.10)-----------Internet

what i can't do it from 1.1.1.10: telnet 217.0.0.10.
Any hint? I can also use iptables to get this point working.

Cu Thomas Lu=DFnig

