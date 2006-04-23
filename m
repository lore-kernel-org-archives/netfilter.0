From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: Adaptive stealthing/unstealthing of port 113
Date: Sun, 23 Apr 2006 11:51:39 +0000
Message-ID: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
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

Hi,

On Steve Gibson's site, I had a few interesting things to read about
the ZoneAlarm firewall:

(quote)
Even after many years, the (free) ZoneAlarm personal firewall from
Zone Labs is the only personal firewall to "adaptively" stealth port
113. Unlike any other firewall or NAT router (any of which could also
do the same) this allows port 113 to be stealthed to any passing
Internet scanners or probes, but "unstealthed" for any valid IDENT
connection attempts originating from remote servers with which the
user's computer is attempting to connect. (Since this could easily be
done by any personal firewall or even NAT routers, I am hopeful that
this feature might yet appear in other products.)

"Adaptive Stealthing" means that when a TCP SYN packet arrives to
request a connection to your machine's port 113, ZoneAlarm checks, on
the fly, to see whether your machine currently has any sort of
"relationship" with the remote machine (such as a pending outgoing
connection attempt). If so, the remote machine is considered to be
"friendly" and its IDENT request packet is allowed to pass through
ZoneAlarm's firewall. But if the IDENT originating machine is not
known to ZoneAlarm as a "friendly" machine, the connection requesting
packet is dropped and discarded, rendering port 113 stealth to all
unknown port scanners. It's very slick.
(end quote)

I wanna do it on my ADSL firewall!

How can I do this?  I realise I could just write a custom module in C,
but you guys probably know of a way to do it with the existing tools.

Thanks

