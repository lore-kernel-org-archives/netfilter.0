From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 00:22:46 -0500
Message-ID: <42688A26.9000705@riverviewtech.net>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>
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
To: Vic N <vic778@hotmail.com>
Cc: netfilter@lists.netfilter.org

> A while ago I saw an iptables solution that was able to serve as an 
> effective anti-ddos solution.   I didn't get to see under the hood, but 
> the creator told me that the solution was essentially an iptables 
> implementation with no connection tracking built in.  Allegedly, the 
> fact that no connection tracking was used enabled the the iptables to 
> deal with a much higher volume of traffic w/o crashing.  He had also 
> mentioned using packet counting (to count packets as they passed through 
> since there was no way to keep track of them otherwise) and using 
> tarpitting.
> 
> While I can't attest to what the person told me, I do know the firewall 
> was soaking up ddos traffic that was otherwise bringing servers to their 
> knees with the use of regular connection-based firewalling.
> 
> So my question is, is this the basic element of building a good 
> anti-ddos solution wtih iptables to address a *large* volume of ddos 
> traffic to build iptables w/o connection tracking?
> 
> Thanks,

Yes this is possible and (I think) fairly easy to do.  As I have never done this I can not tell you for sure, but this is what I would do if I were to do such a thing.

I will presume that you are wanting to drop all traffic to a specif port on an IP address for the sake of this discussion.

iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 5678 -j NOTRACK
iptables -t filter -A FORWARD -d 1.2.3.4 -p tcp --dport 5678 -j TARPIT

This will cause any traffic that comes in that is distend to 1.2.3.4 on port 5678 to  NOT be tracked with the connecting tracking sub system and to subsequently be redirected to the TARPIT target.



Grant. . . .

