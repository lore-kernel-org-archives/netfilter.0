From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Having troubles with ipfilter, networking etc.
Date: Tue, 15 Aug 2006 14:08:12 +0200
Message-ID: <44E1B92C.4000003@rtij.nl>
References: <ebs7th$p0o$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ebs7th$p0o$1@sea.gmane.org>
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
To: Peter Nabbefeld <Peter.Nabbefeld@gmx.de>
Cc: netfilter@lists.netfilter.org

Peter Nabbefeld wrote:

>Hello,
>
>I've got many problems with routing and firewalling. As I've found
>anywhere, that I could forward packets using iptables without the need
>of a bridge (may also be a misunderstanding), I think this might be the
>most helpful mainling list.
>
>My situation:
>- I can access the internet from my server (PC).
>- I can access my server from my windows notebook (NB), ping works as
>well as samba.
>- I can ping the internet from my NB using IP, but not DNS.
>
>- My internet connection is using a ASDL/USB modem, using br2684ctl to
>establish a device "nas0", which "ppp0" is connected to.
>- ppp0 gets an IP assigned from my ISP; nas0 doesn't get any IP.
>- I've got a wired interface assigned to "eth0" on PC.
>- My WLAN is configured using hostapd on PC, using "wifi0" and "ath0".
>- My WLAN is using a bridge (brctl) "br0" bridges "ath0"/"eth0"
>- My server is running samba and apache (needing http and webdav access)
>- I need to be able to use ping
>
>  
>
(snip)

>1. I guess, I don't need br0? Probably it is even an error to set an IP
>for br0? Should I assign an IP to ath0 instead?
>  
>

AFAIK, you need to set an address on br0 to make that subnet accessible 
from your firewall.

>2. I've got a script from the internet (already tried to make some
>changes, but isn't yet successful):
>  
>

I guess the script is for a routed environment, not a bridged one. I 
would start from scratch.

Create a new script.
- Start with all policies DROP.
- Add -m state --state ESTABLISHED,RELATED -j ACCEPT to 
{INPUT,FORWARD,OUTPUT} so you get a stateful firewall.
- End {INPUT,FORWARD,OUTPUT} with -j LOG, so you can see what packets 
get dropped.
- Enable forwarding.

Execute this script and see all packets being dropped.

- Add rules to access the needed services on the firewall to INPUT. You 
indicated samba and http. You should use -i br0 for this to allow this 
form the internal net only. (Obviously this should go in before the -J LOG).

Execute script and test if you can access samba and http from your local 
network.

- Allow outgoing traffic to the internet (ppp0 I assume) (both OUTPUT 
and FORWARD!) and set up the correct NAT rule for this.

Execute script and test if you now can connect to the Internet from both 
the firewall and the internal network.

Go on, taking one step at a time. If it doesn't work, take a step back 
and try to understand why. Ethereal and syslog are your friends here. 
Read all tutorials on www.netfilter.org. If you get stuck in any step, 
post again here and people can help you with that specific problem.

HTH,
M4

