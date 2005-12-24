From: samba <samba@embeddedinfotech.com>
Subject: Port Triggering
Date: Sat, 24 Dec 2005 16:27:21 +0530
Message-ID: <43AD2991.4060807@embeddedinfotech.com>
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

Hi,
Can someone please tell me how i can implement port trigerring using 
iptables.

Port Triggering :

Port triggering allows opening of inbound port(s) for some interval of time based on some outbound traffic that
originated from internal LAN. This rule gets triggered when the router sees traffic from the internal LAN to the internet. 

The outbound ports that triggers the rule and the inbound ports that needs to be opened by the firewall are configured by
the user.

Is such a feature supported by iptables and the netfilter framework ?

Thanks in advance for the reply.
samba




 

