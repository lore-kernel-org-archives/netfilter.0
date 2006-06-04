From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: How stop DoS and SYN attack..
Date: Sun, 4 Jun 2006 09:57:56 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C72@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alberto Ferrer <albertoferrer@gmail.com>, netfilter@lists.netfilter.org

There's not really very much you can do about DDOS attacks with =
netfilter alone. You can block the traffic ofcourse, or try to fiddle =
with --limit, or tcp_syn_cookies.
But usually the problem is that the amount of traffic just fills your =
entire Internet connecection, which renders it useless. The only thing =
you can do in such a situation is ask yout ISP to block the attack =
upstream.
And often, ISPs are very unhappy about customers being DDOS-ed.

-Sietse=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alberto =
Ferrer
Sent: Saturday, June 03, 2006 10:33 PM
To: netfilter@lists.netfilter.org
Subject: How stop DoS and SYN attack..

=BFany know a way to stop via Linux with iptables or related a SYN =
attack ?
=BFwhere i can read something related to this?

Thanks in advance.

P.S: sorry for my bad english :D
--
Alberto Ferrer


