From: Rich <rich@hq.vsaa.lv>
Subject: Re: Letting Hotline downloads through
Date: Tue, 05 Apr 2005 16:39:44 +0300
Message-ID: <42529520.105@hq.vsaa.lv>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

i'm sort of responding to an email that's several years old, but i just 
hope that this might help somebody.

when i tried to set up hotline server in dmz, i stumbled upon downloads. 
a client could connect, chat etc, but not download or upload files.

when i searched the web, i came upon this message:

(dated Thu, 17 Oct 2002 07:57:43 -0600)

-----------------------------------------------------------------------
I'm trying to setup a Hotline server on an internal NATed machine and I'm
having problems with getting clients to download. Here's what I have so far:

$EXTIF="eth1"
$INTIF="eth0"
$IPTABLES=/sbin/iptables
$EXTIP=12.252.56.159
$RAGABLE=192.168.0.2

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 5500:5503 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF --dport 5549 -m state --state
NEW,ESTABLISHED,RELATED
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 5500:5003 -j DNAT
--to $RAGABLE:5500:5503
$IPTABLES -A PREROUTING -t nat --dport 5549 -j SNAT --to $EXTIP

According to the Hotline server documentation, incoming connection requests
come in on ports 5500 - 5503 while outgoing download connections are on
port 5549. People are able to connect to the server just fine, but are
unable to download so I'm wondering what rules I need to let the downloads
through.

-Chris Born
------------------------------------------------------------------------

(ok, let's ignore starting rules and the fact that last rule has no 
protocol specified - we should have hotline going to dmz and back)

i tried a lot of combinations. at the end i installed tcpdump and tried 
to gather some information that way. it seemed that incoming connections 
were on dport 5501 but hotline server received them on port 5500. wtf ?

woohoo, probably no news for most of list members, but iptables seems to 
redirect to first (available ?) port if dnat has port range specified.

so, iptables redirected connections to 5500, but they should be to 
5501... ok, i created separate rule for every port to be sure that they 
all are redirected to the correct ones on hotline server. and that did 
the job.

it might be possible to do that in one rule, but i don't want to try 
that out once this combination works ;)

so, to dnat incoming hotline connections to a server in dmz you need a 
rule :

iptables -A PREROUTING -t nat -p tcp -s ! $INTERNAL_NET --dport 5500 -j 
DNAT --to $HOTLINE_SERVER:5500

(of course, single line, you can omit internal_net part and you should 
create such a rule for all four hotline ports, default are 5500-5503)

if your chains are set to default DROP action, some forwarding should be 
allowed :

iptables -A FORWARD -d $HOTLINE_SERVER -p tcp --dport 5500:5503 -j ACCEPT

additionally, udp port 5499 is used only for trackers, so if you have no 
need for them, don't bother with additional rules (i have no idea what 
could be the hotline server documentation to suggest 5_5_49 for 
downloads - maybe protocol implementations differ ?)

i'm not subscribed, so if i am wrong (or if somebody can assure that 
this forwarding can be done with single rule - for example, by not 
specifying destination ports at all), i would like to receive private 
note on that :)
-- 
  Rich

