From: Dennis Taylor <dennis@hollywoodcenter.com>
Subject: Re: SNAT and iChat
Date: Tue, 19 Dec 2006 14:19:40 -0800
Message-ID: <1166566780.26124.62.camel@netop-cmd-00.internal>
References: <1166556814.26124.33.camel@netop-cmd-00.internal>
Reply-To: dennis@hollywoodcenter.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1166556814.26124.33.camel@netop-cmd-00.internal>
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

Found some info.
This may require the sip-conntrack-nat extension (ip_conntrack_sip
module):

http://www.iptel.org/sipalg
http://sipx-wiki.calivia.com/index.php/HowTo_configure_iptables

Dennis

On Tue, 2006-12-19 at 11:33 -0800, Dennis Taylor wrote:
> I'm running a router based on a custom Linux 2.6.6 kernel, with all
> netfilter options either compiled-in or available as modules.
> 
> I use SNAT so that all traffic from a given private subnet appears to
> originate from a single routable IP address.  Each private subnet has a
> unique corresponding routable IP address.
> 
> In general, this works very well.  The trouble I'm having is in passing
> iChat AV traffic for an entire private subnet.
> 
> For example, let's say I have two routable IP addresses assigned to
> eth0: 69.54.179.2 and 69.54.179.3, and private IP address
> 192.168.10.1/24 assigned to eth1.  Clients are connected to eth1, while
> eth0 is my link to the internet.
> 
> If I use SNAT for the entire private subnet, iChat fails.  In order to
> make it work, I need to use a 1:1 mapping and DNAT.
> 
> This causes iChat to fail:
> 
> iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j SNAT --to-source
> 69.54.179.2
> 
> This works:
> 
> iptables -t nat -A POSTROUTING -s 192.168.10.3 -j SNAT --to-source
> 69.54.179.3
> iptables -t nat -A PREROUTING -d 69.54.179.3 -j DNAT --to-destination
> 192.168.10.3
> 
> The private subnet in question can have any number of nodes using iChat
> at a given time.  I need to avoid reserving a unique public IP address
> for each node that may possibly participate.
> 
> 
> What am I missing?  Is this expected behavior?
> 
> Thanks!
> Dennis
> 
> 
> 
> 


