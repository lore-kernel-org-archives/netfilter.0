From: "Mansour Al-Aqeel" <mansour77@ownmail.net>
Subject: setting up a firewall from scratch
Date: Mon, 15 May 2006 21:46:42 -0300
Message-ID: <1147740402.17757.261507231@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi Everybody:
I need an advice from someone about what to do. I have a small lan and
looking to connect it to the net through a LinkSys router using OpenWrt.
The router comes with a built in rules that does everything. However,
I'm a new to iptables, and therefore it would be good chance for me to
be introduced to this tool. I need to delete all the built in rules and
recteate them again from scratch in order to know what each of them
does... I wrote a small script to excute and save my rules in. The
router stopps responding when I excute the script, and I have to reboot
it. All I need at this point is to disable any connection attempt from
out side ($WAN) and enable everything on the ($LAN) side. Here's what I
did so far. Can any one tell me what's next, or what I'm missing ??


#delete all the existing rules from all chains
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

#set the default policy on the external interface not to accept anything
iptables -P INPUT -i $WAN -j REJECT  # dont let anything coming from
outside
iptables -P OUTPUT -i $WAN -j ACCEPT # let anything go out
iptables -P FORWARD -i $WAN -j REJECT # dont forward anyhting from
outside to inside

#######################################
## allow everyThign internally
#######################################
iptables -f filter -A INPUT -i $LAN -j ACCEPT
iptables -f filter -A INPUT -o $LAN -j ACCEPT

iptable  -A OUTPUT -i $LAN -j ACCEPT
iptable -A OUTPUT -o $LAN -j ACCEPT

####forward internally through the br0
iptables -f filter -A FORWARD -i $LAN -j ACCEPT
iptables -f filter -A FORWARD -o $LAN -j ACCEPT


Thanx
-- 
  Mansour Al-Aqeel
  mansour77@ownmail.net

-- 
http://www.fastmail.fm - I mean, what is it about a decent email service?


