From: Will Macfarlane <macfarlane.will@gmail.com>
Subject: [iptable] distributing network requests over multiple interfaces by
	size
Date: Tue, 13 Dec 2005 15:32:59 -0800
Message-ID: <a23e371d0512131532t7991bf1ck935ec9e66d165f52@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

At the school where I am working we have 2 internet connections.  We
have a high latency, high bandwidth satellite connection and a low
latency, low bandwidth ISDN connection.  The network connects to the
internet through our linux server running Squid.  The interface eth0
connects to the satellite modem and the virtual interface eth0:1
connects to the isdn modem.

Basically, I would like for all small requests (normal web browsing)
to be directed to eth0:1 and for all requests for large files to be
directed to eth0.

Is there a way to balance these two connections in this way?  It seems
like a spectacularly good idea to me, if I could just figure out how
to make it work.  Do I want to be looking at iptables to do this?  Or
can I do something in squid?

thanks,
Will

