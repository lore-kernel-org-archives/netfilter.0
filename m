From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: INPUT or FORWARD;;
Date: Tue, 21 Dec 2004 01:44:40 -0500
Message-ID: <200412210144.40359.Alistair@nerdnet.ca>
References: <Pine.LNX.4.05.10412201617430.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412201617430.18976-100000@darkstar.sysinfo.com>
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

On December 20, 2004 04:19 pm, R. DuFresne wrote:
> If I'm reading all this correctly then if set as both INPUT and FORWARD
> rules the FORWARD rules would become redundant and never be hit as the
> INPTU rules would be caught first and deal with what becomes of the
> packets, yes?

 Mind the snippage:
 INPUT is for *THIS MACHINE*
 
 FORWARD is for THOSE OTHER MACHINES farther on down the network path.

 Does that help clarify the concept a bit?  Anything local to this pysical 
machine, be it IP address, interface, or port ... so long as it is local to  
this host is passed through INPUT.  FORWARD is for those packets that are 
destined for other machines, that is need to be routed from a wire we see to 
another wire we see, to get to other machines.

 Alistair.
 

