From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT/SNAT question
Date: Thu, 14 Apr 2005 15:16:37 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A8D@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Jason,=20

Less typos this time...  Just another couple questions though.  Assume
that I have the 128 IP's but I don't want to route all of them but
rather most of them internally.  Specifically, I don't want to route the
first 6 usable.  I have concocted the nat segment below.  Logically it
should work.  I have taken the larger subnets and broken them down to
the largest possible block then worked my way down from there. =20

Is the below now correct?

The other question was regarding the OUTPUT rules.  When I had the
manual 1:1 mapping I found that without the OUTPUT rules that there were
problems accessing an internal server from the firewall (or the server
itself) using the external address.  Is this something that is fixed
with the NETMAP setting?


And the final question, which I have never been totally sure about is
that if we have a VPN tunnel between two networks we had problems access
the servers on the other side of network.  We found that putting a
second entry in on the outgoing map that it was fixed.  i.e we had the
following

[0:0] -A POSTROUTING -s 10.20.30.96/27 -j NETMAP --to 88.44.55.96/27
[0:0] -A POSTROUTING -s 10.20.30.96/27 -d 10.20.30.0/24 -j NETMAP --to
88.44.55.96/27

So, in recap, is this what they new rules should look like (assuming
that IP's .3-8 belong to devices next to of the firewall rather than
behind it)?

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
# Incoming Maps
[0:0] -A PREROUTING -d 88.44.55.8/29  -j NETMAP --to 10.20.30.8/29
[0:0] -A PREROUTING -d 88.44.55.26/28 -j NETMAP --to 10.20.30.16/28
[0:0] -A PREROUTING -d 88.44.55.32/27 -j NETMAP --to 10.20.30.32/27
[0:0] -A PREROUTING -d 88.44.55.64/27 -j NETMAP --to 10.20.30.64/27
[0:0] -A PREROUTING -d 88.44.55.96/27 -j NETMAP --to 10.20.30.96/27
# Outgoing Maps
[0:0] -A POSTROUTING -s 10.20.30.8/29  -j NETMAP --to 88.44.55.8/29
[0:0] -A POSTROUTING -s 10.20.30.16/28 -j NETMAP --to 88.44.55.16/28
[0:0] -A POSTROUTING -s 10.20.30.32/27 -j NETMAP --to 88.44.55.32/27
[0:0] -A POSTROUTING -s 10.20.30.64/27 -j NETMAP --to 88.44.55.64/27
[0:0] -A POSTROUTING -s 10.20.30.96/27 -j NETMAP --to 88.44.55.96/27
[0:0] -A POSTROUTING -o eth0 -p ! esp -j SNAT --to-source 88.44.55.2
# Output Maps --- NONE...
#[0:0] -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/26
#[0:0] -A OUTPUT -d 88.44.55.16/28 -j NETMAP --to 10.20.30.16/28
#[0:0] -A OUTPUT -d 88.44.55.32/27 -j NETMAP --to 10.20.30.32/27
#[0:0] -A OUTPUT -d 88.44.55.64/27 -j NETMAP --to 10.20.30.64/27
#[0:0] -A OUTPUT -d 88.44.55.96/27 -j NETMAP --to 10.20.30.96/27





