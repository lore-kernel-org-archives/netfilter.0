From: Hugh Buchanan <isp-lists@userfriendly.com>
Subject: iptables not correctly marking packets based on source address
Date: Sun, 25 May 2003 14:48:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ED13A12.9000601@userfriendly.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Greetings,

I am using iptables, currently as a NAT firewall but it will become a 
bridge firewall when I have it working correctly.

I have two simple rules for marking right now:

iptables -A PREROUTING -i eth1 -s $LAN -t mangle -j MARK --set-mark 1
iptables -A PREROUTING -i eth1 -t mangle -j MARK --set-mark 2

$LAN is defined to be "192.168.0.0/24"

Now.. I found a bit in the list archives about mangling with NAT.. so I 
am wondering if the source address is wrong.  But shouldn't PREROUTING 
happen before the NAT takes place?


My end goal is to have a mangle line for each of the half a dozen source 
addresses.  For example:
192.168.0.5 - mark as '2'
192.168.0.6 - mark as '3'
192.168.0.7 - mark as '4'
192.168.0.8 - mark as '5'
192.168.0.9 - mark as '6'
192.168.0.10 - mark as '7'
And all other source addresses should be marked as '1'.

I was thinking that I could do something like:
iptables -A PREROUTING -s 192.168.0.5 -t mangle -j MARK --set-mark 2

But that isn't working for me.

Hugh Buchanan





