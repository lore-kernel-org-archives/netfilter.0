From: "Brandon Hall" <Jodious33@hotmail.com>
Subject: random patch with 2.6 kernel?
Date: Thu, 10 Feb 2005 00:03:11 -0600
Message-ID: <BAY102-DAV108E4B8D08A7D0E5D30147AE760@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

i posted previously asking where i can get the random patch, i found the =
random patch, compiled what needed to be compiled and no random.  When I =
tried to add just the random patch it informed me that it was already =
applied but the libipt_random.so was not found.  Does this match not =
function with the 2.6 kernel?  I have seen a couple places that said it =
wasn't available with the 2.6 kernel.  If this is true I'll just convert =
back to the good ol' 2.4 and reconfigure my router(I have spare time), =
but i wanted to make sure it was true with the people that would really =
know.  Also if this is true, is there a workaround or a new feature with =
the 2.6 kernel that can be used to split packets evenly between 2 =
seperate ISP connections in a loadbalancing manor and still be able to =
be masqueraded into my internal network.  I should have included this =
with my first post, but being new to the lists i'll just have to learn =
:)

system
Fedora core 3, version 2.6.10 kernel
iptables version 1.2.11
