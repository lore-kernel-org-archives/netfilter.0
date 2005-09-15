From: bernin_a@informatik.haw-hamburg.de
Subject: nat Problem with udp packets (missing packages between mangle and
	nat ??)
Date: Thu, 15 Sep 2005 11:51:40 GMT
Message-ID: <20050915115140.AC9163CCDA26@mailgate.informatik.haw-hamburg.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi all!

I have a strange problem here with some udp packets passing over a linux
firewall. I need to change the source port of the packages so they appear to
come from port 500.=20
This used to work without any problem, but for some time now, some of the
packages don't get their source port changed (but still, some do).
Our setup is the following:

We have an extra chain in the nat table called VPN_CLIENTS. for every ip we
expect ipsec connections from, we have an entry that makes a source nat to =
the
original ip and source port 500.

Postrouting chain of table nat looks like the following:

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
ULOG       udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:500 ULOG
copy_range 0 nlgroup 1 prefix `dport 500:' queue_threshold 1
VPN_CLIENTS  udp  --  0.0.0.0/0            62.67.60.5         udp dpt:500

As you can see, i have set up a log rule to log me every packet that
should be matched by the jump to VPN_CLIENTS. But some of packets do
not get here, although i can see them with tcpdump on both, the
incoming and the outgoing interface. And i can see them in the mangle
table with a similar rule to the log rule above:

# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
ULOG       udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:500 ULOG
copy_range 0 nlgroup 1 prefix `mangle_dport_500:' queue_threshold 1

=20
It seems that some packages are traversing the mangle POSTROUTING
chain but do not appear in the nat POSTROUTING chain. As i understand
package flow, they should be. And this setup works for some ips
(i see the packages in the nat table coming from them).

So, i have no idea what is happening here...I hope someone else has.

thanks,
        arne

I am running:

Kernel 2.4.27 (with grsecurity)
iptables 1.2.26a (debian)



_________________________________________________
Versendet =FCber Webmail der HAW Hamburg
http://www.haw-hamburg.de/webmail



