From: aksingh@hss.hns.com
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 20:38:11 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF06865F05.B3C199FC-ON65256E77.0051F118@hss.hns.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org





hi,

I am working on this, just wanted to know if there can be a better solution
to this problem :

problem :
to take a packet from the kernel before the routing decision is made by ip,
give it to a user space process which decides whether it wants to play with
the packet or wants to return it to the kernel.

soultion im thinking of :
use netfilter hook to capture PRE_ROUTING packets, define a call back
function in a kernel module and open a char device to write the sk_buff to
this char device, a user space process reads this and writes back to the
char device if needed, the driver for this char device calls the ip route
lookup function and based on the routing decision, calls etheroutput to
send the packet to its actual destination.

issues :
1. Does this solution sound ok, will this work or am i dong something
incorrect here.
2. If this works, this solution would require two copies, one from the
kernel sk_buff to the char device and then back from the user space process
to the char device, how much of a overhead would that be ? can a
better/easier approach be followed.

Do put in our suggestions.

Regards,
Amit




Antony Stone <Antony@Soft-Solutions.co.uk>@lists.netfilter.org on
04/15/2004 08:23:36 PM

Please respond to netfilter@lists.netfilter.org

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:

Subject:    Re: port forwarding not working


On Thursday 15 April 2004 3:28 pm, Alexander Economou wrote:

> If i understood well , you have a linux firewall with a dmz ip and you
> want to redirect traffic from a real ip to lan ip of your network.If i am
> correct then you should do :
>
> iptables -t nat -F
> iptables -t nat -A POSTROUTING -o dmzinterface -j MASQUERADE

I disagree with this rule.   It will make all connections to servers in the
DMZ network appear to come from the firewall, which will destroy any useful
logging on the services which are running.

> iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6181 -j DNAT --to
> lanip:6181
> iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6182 -j DNAT --to
> lanip:6182
> etc etc

It's important to remember that in addition to the PREROUTING rules to do
the
address translation, you need FORWARDign rules to allow the now-translated
packets through the firewall.   It was the FORWARDing rules which were the
problem in Nick's script.

Regards,

Antony.

--
Wanted: telepath.   You know where to apply.

                                                     Please reply to the
                                                           list;
                                                           please don't CC
                                                           me.





