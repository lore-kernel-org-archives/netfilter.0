From: "L.Malinov" <lucho@galix.com>
Subject: IPTABLES + IPROUTE2
Date: Fri, 30 Jan 2004 11:39:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EHENIKBEJAMHPLPJOJBPMEFKDIAA.lucho@galix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Antony,

According to the iproute2 manual, I can't do routing based on a destination
port but based on the fwmark. So that's why I think I can achieve that alone
with iproute2 only and I need iptables to put the mark as well. But in this
case I'm not sure that this can be achieved on a box with one network card
only or for traffic generated lacaly from the box. Any suggestions?

Regards

L.Malinov


On Saturday 24 January 2004 12:57 pm, L.Malinov wrote:

> Hi Antony,
>
> In my situation is not possible to set router1 as a default route because
> the machine acts as a mail server as well and the mail needs to go through
> router1.

Okay then - in that case I suggest you use iproute2 to route all TCP port 80
packets via router2, all TCP port 25 packets via router1, and decide what
you
want to do with everything else such as DNS.   I don't see that there should
be any need to MARK packets - just route based on the destination port
number.

see http://lartc.org for more details of iproute2 and what it can do.

Regards,

Antony.

--
Wanted: telepath.   You know where to apply.

                                                     Please reply to the
list;
                                                           please don't CC
me.



