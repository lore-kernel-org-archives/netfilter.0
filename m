From: "Gary W. Smith" <gary@primeexalia.com>
Subject: SNAT question
Date: Sun, 14 Nov 2004 14:53:20 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0197C6@pxtvjoexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

I'm having a problem with DNAT/SNAT.

I have this on a couple firewalls at different places and it works
great.  I'm implementing this on a new firewall based on RHEL3 and it
seems to work great for everything except local servers with external
IP's.  Trying to access 206.14.210.52 internally returns me
192.168.0.52.  If I access it from the firewall it all works fine.  If I
access from another workstation or the server itself then it returns the
local IP as part of the ping.

Some time ago on another firewall with multiple segments someone told me
to put this:
-A POSTROUTING -s 192.168.0.0/255.255.255.0 -d 192.168.0.52 -j SNAT
--to-source 206.17.98.52

On another firewall at another location I found that they had=20
-A POSTROUTING -s 192.168.0.52 -d 192.168.0.52 -j SNAT --to-source
206.17.98.52

Something to note that this is a custom RHEL3v3 compile with
pptp-conntrack compiled in.  We also recompiled iptables using the new
userspace changes.

The location where I got the information regarding the original
DNAT/SNAT is:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET


Here is the actual PRE/POST/OUT routing section

[0:0] -A PREROUTING -d 206.14.210.51 -j DNAT --to-destination
192.168.0.51
[0:0] -A PREROUTING -d 206.14.210.52 -j DNAT --to-destination
192.168.0.52
...
[0:0] -A PREROUTING -d 206.14.210.62 -j DNAT --to-destination
192.168.0.62

[0:0] -A POSTROUTING -s 192.168.0.51 -o eth0 -j SNAT --to-source
206.14.210.51
[0:0] -A POSTROUTING -s 192.168.0.52 -o eth0 -j SNAT --to-source
206.14.210.52
#[0:0] -A POSTROUTING -s 192.168.0.52 -d 192.168.0.52 -j SNAT
--to-source 206.17.98.52
...
[0:0] -A POSTROUTING -s 192.168.0.62 -o eth0 -j SNAT --to-source
206.17.98.62
[0:0] -A POSTROUTING -o eth0 -j SNAT --to-source 206.17.98.50

[0:0] -A OUTPUT -d 206.17.98.51 -j DNAT --to-destination 192.168.0.51
[0:0] -A OUTPUT -d 206.17.98.52 -j DNAT --to-destination 192.168.0.52
...
[0:0] -A OUTPUT -d 206.17.98.62 -j DNAT --to-destination 192.168.0.62


