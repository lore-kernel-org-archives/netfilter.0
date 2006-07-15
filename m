From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Strange NAT Behavior
Date: Sat, 15 Jul 2006 12:44:30 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127C5@knowledge.wizdom.nu>
References: <005a01c6a750$847a7d00$e30da8c0@tmilawton.com>
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
To: "Anthony R. Vallario" <avallario@tecmasters.com>, netfilter@lists.netfilter.org

Well, there is most likely nothing wrong. Clients sometimes behave =
badly. I see it every day, especially with P2P software. If you have no =
problems reported to you, don't worry about it. It just happens.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Anthony R. =
Vallario
Sent: Fri 14-Jul-06 16:19
To: netfilter@lists.netfilter.org
Subject: Strange NAT Behavior



To all;
    I've got a CentOS 4.2 box configured as your standard nat firewall.
Nothing fancy, nothing new. Of course logwatch is on and configured to
report about the day's previous activities. After looking at these =
emails
from logwatch I noticed something funny. There were entries from where =
the
firewall was blocking my LAN pc's. Huh? That's right. I went thru
/var/log/messages to confirm. Sure enough, there are logged events from =
when
one of the LAN pc's was blocked from going to say yahoo, adobe or =
google.
Weird thing is, it's random. Ports are random to.I can't make heads or =
tales
out of a pattern or reason why. So why on earth would a nat firewall =
with no
outgoing drop rules all of a sudden block these lan pc's? Oh one more =
thing
of note. This same nat firewall (text file with the rules) was used on a
fedora core 1 box about a month ago. No issues with random outgoing =
blocks.


Anthony R. Vallario





