From: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Getting counter values per rule number
Date: Thu, 13 Jun 2002 11:42:00 +0300 (EEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206131137130.21524-100000@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.samba.org


Hello!

How can I get byte (and packet) counter values per rule number?
I mean something like this:

iptables -L my_chain -v -x rule_number

So I could easily parse the results from the iptables output..

If I have lots of rules, it's not very efficient to parse the output for
whole chain and search the correct rule..

Any other methods to get the same information more easily?

Thanks!


- Pasi K=E4rkk=E4inen

                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.


