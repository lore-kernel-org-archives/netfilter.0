From: tmp123@bavirtual.org
Subject: Re: Performance issues
Date: Thu, 15 Sep 2005 13:02:22 GMT
Message-ID: <432970de.272.18b0.29670@bavirtual.org>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>  From what you explain i would guess for PMTU issues. Any
> chance that  some other
> rule (in FORWARD chain) is blocking ICMP on this device?
> 
> Regards
> 
> Andreas
> 

Hi Andreas,

Thanks for getting back to me. No, for testing purposes I
made sure that the NAT rule is the only rule in the entire
system, and the default policies are set to ACCEPT etc.

Regards,
Ferry van Aesch



