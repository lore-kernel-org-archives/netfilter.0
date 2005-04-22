From: Jason Opperisano <opie@817west.com>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 00:32:22 -0400
Message-ID: <20050422043222.GA2461@bender.817west.com>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 21, 2005 at 09:19:43PM -0700, Vic N wrote:
> A while ago I saw an iptables solution that was able to serve as an 
> effective anti-ddos solution.   I didn't get to see under the hood, but the 
> creator told me that the solution was essentially an iptables 
> implementation with no connection tracking built in.  Allegedly, the fact 
> that no connection tracking was used enabled the the iptables to deal with 
> a much higher volume of traffic w/o crashing.  He had also mentioned using 
> packet counting (to count packets as they passed through since there was no 
> way to keep track of them otherwise) and using tarpitting.
> 
> While I can't attest to what the person told me, I do know the firewall was 
> soaking up ddos traffic that was otherwise bringing servers to their knees 
> with the use of regular connection-based firewalling.
> 
> So my question is, is this the basic element of building a good anti-ddos 
> solution wtih iptables to address a *large* volume of ddos traffic to build 
> iptables w/o connection tracking?

that...or installing openbsd.

-j

--
"Psychiatrist: Does Stewie have a history of violence?
 Lois: Oh no, this is Stewie's first violent act.
 Stewie: Actually, my first violent act involved that ticking time bomb
 that I left in your uterus when I left. Happy 50th Birthday, Lois."
        --Family Guy

