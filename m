From: "Tomek Macioszek" <tomekm@cea.pl>
Subject: multiple mapping
Date: Wed, 1 Sep 2004 09:59:10 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <006701c48ff9$9627b5b0$2a245cc2@cea05>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hi
I have my FIREWALL BOX with address 4.3.2.1 (eth0) and local address =
192.168.10.0/24.
Now I have SNAT:
iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o eth1 -j SNAT --to =
4.3.2.1
I would like to make SNAT with i.e two external address.
iptables -t nat -A POSTROUTING -s 192.168.10.0/28 -o eth1 -j SNAT --to =
4.3.2.1
iptables -t nat -A POSTROUTING -s 192.168.10.128/28 -o eth1 -j SNAT --to =
4.3.2.2. It is good solution? Should I make alias for eth0 with address =
4.3.2.2?
Thanks for help and sorry for my English.
Best regards
T.  
