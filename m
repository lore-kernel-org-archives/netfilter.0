From: "Manfred Stock" <manfred.stock@gmail.com>
Subject: Controlling an iptables-match from userspace
Date: Tue, 23 May 2006 13:42:17 +0200
Message-ID: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm looking for a way to control an iptables-match from a
c/c++-program. My goal is to
have a simple match-module which can be told from userspace to either
return 0 or 1
in it's match-function (this would be useful for dynamically turning
on/off several more
complicated rules without inserting/removing them from the ip tables,
i.e. without
using libiptc (for which I haven't found an easy way on how to use it
anyways...) or
iptables itself).

The netfilter Hacking HOWTO mentions nf_register_sockopt for such
tasks (receiving
commands from userspace) - is this still the way to go, or is it going
to be removed
in the (not so far) future (eg. in favor of netlink)? Another way
would be the use of
sysfs, but it seems to be more for device drivers than this; configfs
is still relatively
new and probably not available for older kernels... Or is there even a
simpler way to do
such a thing? Any ideas/hints?



Best regards,

Manfred.

