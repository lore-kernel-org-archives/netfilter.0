From: Jason Opperisano <opie@817west.com>
Subject: RE: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 17:48:18 -0500
Message-ID: <1103582898.13782.1.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10412201617430.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412201617430.18976-100000@darkstar.sysinfo.com>
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

On Mon, 2004-12-20 at 16:19, R. DuFresne wrote:
> If I'm reading all this correctly then if set as both INPUT and FORWARD
> rules the FORWARD rules would become redundant and never be hit as the
> INPTU rules would be caught first and deal with what becomes of the
> packets, yes?

the FORWARD rules would never be hit because the packet never traverses
the FORWARD chain.

-j

--
"What's the point of going out, we're just going to end up back
 here anyway?"
	--The Simpsons


