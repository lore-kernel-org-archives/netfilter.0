From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: 2 basic iptables questions
Date: Tue, 25 Jul 2006 14:59:51 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901679B2@pxtbenexd01.pxt.primeexalia.com>
References: <20060725212039.59780.qmail@web60024.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20060725212039.59780.qmail@web60024.mail.yahoo.com>
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
To: Peter <petermatulis@yahoo.ca>, netfilter <netfilter@lists.netfilter.org>

Answers inline

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Peter
> Sent: Tuesday, July 25, 2006 2:21 PM
> To: netfilter
> Subject: 2 basic iptables questions
>=20
> Hi,
>=20
> Two questions:
>=20
> 1) I understand the basics of the iptables command but I am having
> trouble grasping how the various "scripts" go together.  I have a
> CentOS (Red Hat) box set up and there is an init script
> /etc/init.d/iptables.  There is also a support script
> /etc/sysconfig/iptables-config.  I know also that 'service iptables
> save' saves a ruleset file of the current ruleset inside
> /etc/sysconfig/iptables.  My question is therefore "Where do I place
my
> main (and documented) ruleset file?".  I envision a file solely
> containing a multitude of iptables commands but many files I find on
> the net contain other commands as well.

If you load your iptables that you want to run using iptables-restore
then you can do an iptables-save, drop it into the
/etc/sysconfig/iptables file and it will autoload on the next restart of
the server (or a restart of /etc/init.d/iptables).

Some people find iptables-save/restore too limiting so they just put all
of the commands into a shell script and load each line individually. =20

Both ways work.  Pick the one that's easiest to you.  Remember, if you
put something in /etc/sysconfig/iptables it will load every time the
computer starts.  If things break randomly remember to check that before
restarting.

>=20
> 2) I have inherited an iptables firewall and I'm trying to grok its
> ruleset.  Here are the beginning lines of the output of 'cat
> /etc/sysconfig/iptables':
>=20
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :log_and_drop - [0:0]
> :service_chain - [0:0]
> [0:0] -A INPUT -d 127.0.0.1 -j ACCEPT
> [0:0] -A INPUT -s 127.0.0.1 -j ACCEPT
> [0:0] -A INPUT -i lo -j ACCEPT
> [0:0] -A INPUT -j service_chain

Here is where you chain is called.  Basically you are telling the input
chain to jump to the service_chain at that point.  I find it helpful to
create buckets (like your service_chain) which handle certain processes
(such as a bucket for http servers, a bucket for email spoolers, etc).
I then call them on my input (or forward) chain.  This way if I have a
email spooler on a particular IP I can just forward it to the specific
chain that will already take care of what it needs to do.


> [0:0] -A log_and_drop -j LOG --log-prefix "FWSERVER (Blocked
> Connection)"
> [0:0] -A log_and_drop -j REJECT --reject-with icmp-port-unreachable
> [0:0] -A service_chain -p icmp -j ACCEPT
> [0:0] -A service_chain -p icmp -j log_and_drop
> .
> .
> .
> { many more '[0:0] -A service_chain' lines }
> COMMIT
>=20
> My question here is how is the last rule ever matched?  If ICMP is
seen
> it will be accepted and the evaluation stops.  What is the meaning of
> this line?  My guess is that it is there to log and then block
unwanted
> traffic (via the log_and_drop chain) but I do not see how it works.
> The ruleset is full of these line patterns.
>=20
> Peter
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com


