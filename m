From: Philip Craig <philipc@snapgear.com>
Subject: Re: PPTP Nat Module
Date: Wed, 10 Dec 2003 13:24:03 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD691D3.9060708@snapgear.com>
References: <200312092139.12609.iptables@vortech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312092139.12609.iptables@vortech.net>
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
To: Joshua Jackson <iptables@vortech.net>
Cc: netfilter@lists.netfilter.org

Joshua Jackson wrote:
> My iptables firewall rules include a default policy of DROP for INPUT and 
> FORWARD, ACCEPT for OUTPUT. The first line in the rules includes an ACCEPT 
> for the INPUT chain for established and related connection. There is also a 
> rule allowing any traffic for all protocols to any host which originates from 
> the protected network on the internal interface.

Do you an ACCEPT for the FORWARD chain for established and related connections?

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


