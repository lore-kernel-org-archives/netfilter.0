From: "Christoph Leser" <Leser@sup-logistik.de>
Subject: connect overlapping private networks using dialup ppp
Date: Tue, 1 Feb 2005 22:20:06 +0100
Message-ID: <3E779DE9F923CA46A9BD3313B56EA3C30386D3@win2000.sup-logistik.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

maybe a comman question, but I was unable (or simply too stupid) to find =
an answer in the mailing lists:

I need to connect my private network ( 10.1.0.0/24 ) to several other =
private networks not under my control ( my customers sites ). For =
simplicity asume all these customer networks use 192.168.0.0/24.

I imagine to address the network of the n'th customer as

10.1.n.x

that is I would like to address=20

host 192.168.0.x of my first  customer site as 10.1.1.x
host 192.168.0.x of my second customer site as 10.1.2.x

I imagine to set up, for each customer site, a ppp dialup interface, =
with address 10.1.x.254.

So when I open a connection to 10.1.3.1, the third ppp interface should =
be selected, and a dialup connection established.

To make this work, some sort of SNAT and DNAT would be need, after the =
routing decision has been made, before the packet is send over the ppp =
link:

I would like to have:=20

the source address to be replaced by my official IP address ( so my =
customer can setup the return route w/o any conflicts )

the destination address to be replaced by the corresponding address in =
my customers private network:  In the above example I send to 10.1.3.1, =
and this gets replaced by 192.168.0.1,
as 10.1.3.15 would be replaced by 192.168.0.15.

This would give me a one to one correspondence for each of my customers =
nodes ( assuming all use a class C subnet ).

Did I make it clear what I would like to accomplish? ( Or do you think =
that's all rubbish ? )

Could that be done with iptables?=20
Or are there better ways do accomplish this?


Mit freundlichen Gr=FC=DFen

Christoph Leser
S&P Computersysteme GmbH
Systemhaus f=FCr Logistik

Tel: 0711 726410
Mail: leser@sup-logistik.de

