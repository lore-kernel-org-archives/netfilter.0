From: Jason Opperisano <opie@817west.com>
Subject: Re: conntrack has problems with syn-ack-psh set
Date: Sat, 1 Jan 2005 12:50:16 -0500
Message-ID: <20050101175016.GA10480@bender.817west.com>
References: <41D0B008.1030400@cascadiabhc.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41D0B008.1030400@cascadiabhc.org>
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

On Mon, Dec 27, 2004 at 04:59:52PM -0800, Shaun Savage wrote:
> I am have a problem getting iptables to work with a bain dead linksys 
> printserver.  After is receives a syn packet it send a syn-ack-psh 
> packet.  Is psh allowed here?  The conntrack can't find a match and the 
>  packet is INVALID.  NO connection.

SYN-ACK-PSH is not a valid response to a SYN packet.  you will never
get iptables (or any stateful firewall) to recognize this as a valid
connection.  you will have to allow this communication without relying on
"-m state."

-j

