From: "Jeffrey B. Murphy" <jbmurphy@gmail.com>
Subject: iptables and arpd
Date: Thu, 31 Mar 2005 14:04:36 -0500
Message-ID: <89629fe005033111041b245b9d@mail.gmail.com>
Reply-To: "Jeffrey B. Murphy" <jbmurphy@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I sent this to the honeypots list but I got no takers. I was hoping
someone here might be able to help me. My question involves the
interaction between iptables and arpd. arpd is used in the honeyd
project (http://www.honeyd.org/tools.php).

I have a fedora core 3 box and I have the following iptables script:

# IptablesScript
iptables -F
iptables -X

# Set Default Policy to drop everything
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

I believe that this should block all traffic going to and from the
machine (Ip address of 192.168.0.3)
So I ping 192.168.0.3 and get no response back (As I expected)

When I add arpd into the mix with honeyd bound to the arpd ip (192.168.0.5)

I ping the arpd/honeyd IP of 192.168.0.5 from a different machine and
I get no response back (as I expected)

BUT my honeyd sees the traffic:
honeyd[PID]: Sending ICMP Echo Reply: IPAddyOfHoneyPot -> SourceMachine
honeyd[PID]: couldn't send packet: Operation not permitted

So I don't understand why the traffic is getting to the arpd/honeyd
process if my iptables is dropping everything?
I understand why I am getting the "honeyd[PID]: couldn't send packet:
Operation not permitted" as the default OUTPUT chain is drop. But why
is the traffic getting by my INPUT chain?

I realize that arpd and honeyd are not applicable to the list, but I
received no replies (I guess I am out of karma) on the honeyd list or
from the maintainer of the arpd project.

Any help is appreciated.
And Thanks.

