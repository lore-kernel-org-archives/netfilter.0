From: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Subject: Redirecting incoming traffic to 127.0.0.1
Date: 21 Mar 2003 15:31:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048257065.1493.137.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I have a service running on a box wich is only able to bind to 127.0.0.1
(hardcoded and I can=B4t get the source to change it). Since I want to use
it from any other box the only way to solve that I think is to nat
incoming packets to 127.0.0.1.

IPTABLES -t nat -A PREROUTING -p tcp -d 172.16.172.12 -j DNAT
--to-destination 127.0.0.1

and many others wich I tried don=B4t work.=20

If I understood REDIRECT correctly it only changes to the local IP where
the packet came in (in my situation 172.16.172.12) wich also not solves
the problem.=20

any ideas?

Henry


