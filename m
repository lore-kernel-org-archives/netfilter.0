From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: VPN question
Date: 14 Oct 2003 06:44:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066128266.1322.2.camel@valhalla>
References: <BAY4-F28WaRIYvVjIUl0000bcc5@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY4-F28WaRIYvVjIUl0000bcc5@hotmail.com>
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
To: patrick kuah <patrickkuah@msn.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-14 at 06:19, patrick kuah wrote:
> Hi all,
> 
> I have configured a SNAT rule in my iptables but after configuring, i can't 
> VPN to my server which reside on another network.

Do you see this traffic being dropped by your logs?

> Do i need to add rule for VPN traffic to flow through the SNAT? If yes, what 
> are the rule?

VPN is a generic term. What kind of VPN are you talking about? IPSec?
PPTP? SSL?

If you mean IPSec, you need to open UDP/500 to UDP/500 as well as
protocol 50. You also want to make sure that IPSec/IKE is only
negotiating ESP as a security service, not AH.

HTH,
C





