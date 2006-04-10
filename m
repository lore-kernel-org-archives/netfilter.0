From: b52@entrap.de
Subject: recent module
Date: Mon, 10 Apr 2006 14:01:16 +0200 (CEST)
Message-ID: <52994.212.77.162.22.1144670476.squirrel@www.entrap.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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


Hi folks,

maybe somebody could give me an advice with the iptables recent module.

I need a list of 100 ip addresses which have special rights as long as the
last packet of this ip was recieved within the last 300 seconds.

If this source ip is not in that list and the list is not full include
this ip in that list.
If this source ip is not in that list and the list is full redirect that
connection.
If this source ip is in that list and the last packet is less than 300
seconds ago update the timestamp in the list.
If this source ip is in that list and the last packet is more than 300
seconds ago treat it as it is not in the list.

I thought this will be simple, but the list will be completely filled
anytime with connections older than 300 seconds. How can I tell recent to
forget an entry or overwrite it if the timestamp is more than 300 seconds
old?

There is an example at the programers page
http://www.snowman.net/projects/ipt_recent/ which confuses me even more:

Example #3:

# iptables -A FORWARD -d 192.168.1.1/32 -p tcp --dport 25 -m recent --set
--rsource --name SMTP_RELAY_IN -j ACCEPT
# iptables -A FORWARD -d 192.168.1.1/32 -p tcp --dport 113 -m recent
--rcheck --rsource --seconds 15 --name SMTP_RELAY_OUT -j ACCEPT

if I use this rules the list will be filled after some time, because I
never remove entries out of that list..

Any help would be appreciated.
Thanks, b52


