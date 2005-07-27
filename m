From: "curby ." <curby.public@gmail.com>
Subject: SSH Brute Force not working (any longer)
Date: Wed, 27 Jul 2005 10:36:57 -0600
Message-ID: <5d2f37910507270936737ad3d1@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
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
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

I know enough to realize that it didn't stop working just because it
hates me: most likely, i changed something in the configuration or
something to make it stop working.  However, I can't think of anyting
I could have done to two different machines to make them stop working
in exactly that same way.  Basically, every SSH attempt skips the
return to the input chain and jumps directly to log/drop or
log/tarpit.  I've tried increasing the --hitcount, tried rebooting or
otherwise restarting the network service, tried using a different
--name in recet, etc.

I have tried all the following scripts (I can paste their contents in
if requested but it would be rather annoying because of their combined
length) with no success.  Any ideas on what might have happened?=20
Kernel version and iptables version didn't change, the recent module
loads with no errors, and all the iptables commands to insert rules
complete with no errors.

Links to variations that I tried with no success:

http://curby.net/doc/testwall1
http://curby.net/doc/testwall2
http://curby.net/doc/testwall3
http://curby.net/doc/testwall4

Hopefully it's a really simple typo or something, though with all the
variations I've tried, I'm starting to doubt that simple explanation.=20
What might the problem be?  Thanks!

