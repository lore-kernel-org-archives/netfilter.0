From: "Allan Spagnol Comar" <allan.comar@gmail.com>
Subject: Block smtp traffic
Date: Thu, 26 Oct 2006 16:35:51 -0300
Message-ID: <1cc2dc830610261235q7d678544r7dc62711bbea43d9@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi list, this is my first post.

I had a internet gateway that I want to block all traffic send to smtp
ports ( 25 tcp ). I had done this:
iptables -A FORWARD -i eth1 -p tcp --dport 25 -j DROP

and I cannot make this rule work, my user still can connect to port
25.... I try to change from drop to reject and still the same problem,
where can I look for to make this work ?

thanks, Allan

--=20
An application asked:
"Requires Windows 9x, NT4 or better",
so I=B4ve installed Linux

