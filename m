From: "Paul" <andnicky@myrealbox.com>
Subject: Can iptables create alias IP for another box?
Date: Sat, 21 Dec 2002 18:51:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040514666.5163ee60andnicky@myrealbox.com>
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

An SNAT & a DNAT rule didn't work for me, and I'm too dumb to know what to =
do next.

Behind our firewall which NATs everything, I have a server (A) with one IP =
1.2.3.4 that needs to be reachable also thru a second IP like 10.5.6.7.  =
The application won't support adding an alias IP.

If I give the second IP to box B's eth0, can iptables make box B emulate an=
 alias IP for box A?  It only has to work for port 80 traffic but be nice=
 if it did more.

I was trying to do something like this on box B (from error-prone memory, w=
ith B's address 10.5.6.7):

> iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport 8080 -j DNAT --t=
o 1.2.3.4:80

> iptables -t nat -A POSTROUTING -d 1.2.3.4 -p tcp --dport 80 -j SNAT --to =
10.5.6.7

any ideas will be appreciated.

Paul
NJ Dept of Health & Senior Services


