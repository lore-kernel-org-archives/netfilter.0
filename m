From: "Trevor Paskett" <tpaskett@cymphonix.com>
Subject: Transparent Proxy using bridging 2.6.9 and REDIRECT on different
	subnet
Date: Fri, 18 Mar 2005 11:41:20 -0700
Message-ID: <2F413D5F33545D4A8465BBEE900238CC3FA5F1@cymmail.cymphonix.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have the following setup

Test Machine ---> Linux 2.6.9 ---> Internet Router (Doing NAT)
192.168.255.152   192.168.255.165   192.168.255.1/24
				            192.168.12.1/24

I have blacked out all my iptables and ebtables all default ACCEPT
policy.

The Linux 2.6.9 is bridging. I use the following rule to redirect port
80 traffic to Squid on the Linux 2.6.9 box:

iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j REDIRECT
--to-port 3128

This works just like it should. No problem. The problems comes in this
setup:

Test Machine ---> Linux 2.6.9 ---> Internet Router (Doing NAT)
192.168.255.152   192.168.12.165    192.168.255.1
				            192.168.12.1

When the Linux box is on a different subnet that the test machine the
request will get to Squid, the rules get a packet count I see squid get
the request. Then squid try to send the request back to the client and
it hangs up. The browser just spins. The test machine and the Linux
2.6.9 can both ping each other so I know connectivity is ok.

Now if I bring up an alias br0:0 192.168.255.165 in the above setup,
then everything works again. So does the br0 have to have an ip on the
same subnet for REDIRECT to work? I have also tried adding ebtables
rules like:

ebtables -t broute -A BROUTING -p IPv4 --ip-protocol 6 \
        --ip-destination-port 80 -j redirect --redirect-target ACCEPT

Makes no difference. I have also tried some more complex variations
like:

iptables -t nat -A PREROUTING -p tcp -m physdev --physdev-in eth1
--dport 80 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -p tcp -i br0 --dport -j DNAT --to
i92.168.12.165:3128

All see to work the same. Broken :) I have messed around with settings
on /proc/sys/net to no avail.

I'm using iptables v1.2.9 and Linux 2.6.9. Debian Woody. Thanks!!

Trevor Paskett
Cymphonix Programmer - CCNA, CWNA
P: 801-938-1500 F: 801-938-1501
=20


