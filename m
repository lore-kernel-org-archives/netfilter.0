From: Jason Opperisano <opie@817west.com>
Subject: Re: tcpdump and Iptables
Date: Thu, 02 Sep 2004 14:06:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094148391.1994.2.camel@wolfpack.ljm.dom>
References: <41375ED1.5090400@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41375ED1.5090400@kdtc.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-02 at 13:56, CC wrote:
> Hi,
> 
> I think I've asked this before here, but I
> don't remember what the answer was.
> 
> If I have iptables running and I do a
> tcpdump -i eth0,   at what point is
> tcpdump listening to the connection?

tcpdump operates at the BPF layer, which is below netfilter.

if the the inbound interface is eth0; packets that will eventually be
dropped by netfilter will be captured by tcpdump.

if you're trying to see whether packets make it *through* the
firewall--tcpdump on the exiting interface.

-j

-- 
Jason Opperisano <opie@817west.com>


