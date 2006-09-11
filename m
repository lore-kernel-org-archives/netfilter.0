From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: need help with ipset
Date: Sun, 10 Sep 2006 19:39:48 -0700
Message-ID: <4504CC74.3040607@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi netfilter users,

Trying to use ipset but having no joy.

O/S is Fedora Core 4, kernel is linux-2.6.16-xen.

I'm using the instructions from ipset.netfilter.net/install.html.
Kernel readied, patch applied, kernel built, iptables built, ipset
built, no errors reported.  Only issue was that everything wanted to
install into /usr/local.  The Makefile was changed to use this:

PREFIX:=/
LIBDIR:=$(PREFIX)/lib
BINDIR:=$(PREFIX)/sbin
MANDIR:=$(PREFIX)/usr/share/man
INCDIR:=$(PREFIX)/usr/include

I've built and installed the libipset*.so modules into both
/lib/iptables and /lib/ipset.

When iptables is started it reports v1.3.5 and seems to work with my
previous iptables rules.

Trying to create a set:
    "ipset -N TEST iphash" fails with:
       ipset v2.2.9: Error from kernel: Protocol not available

On google I found a user with that error, but said he had success once
he loaded the module (didn't say how he did it though).  Reading man
iptables says that modules will be loaded implicitly by specifying a
protocol, i.e -p tcp,etc or explicitly by specifying a -m "module", so I
tried this:
   "iptables -A INPUT -m set --set TEST dst -j ACCEPT" and got
      "iptables v1.3.5: Problem when communicating with ipset, errno=92"

(errno=92 is ENOPROTOOPT /* protocol not supported */)

Here are my kernel configs for ipset:
  <M> IP set support
  (256) Maximum number of IP sets
  (1024) Hash size for bindings of IP sets
  < >  ipmap set support
  < >  macipmap set support
  < >  portmap set support
  <M>  iphash set support
  < >  nethash set support
  < >  ipporthash set support
  < >  iptree set support
  <M>   set match support
  <M>   SET target support

Docs are pretty sparse on this, so it could very well be PEBCAK.

Any help would be very appreciated.

Thanks,
Mike Wright :m)



