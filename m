From: Jason Opperisano <opie@817west.com>
Subject: Re: inconsistency in iptables and ifconfig traffic counters?
Date: Wed, 5 Jan 2005 12:12:55 -0500
Message-ID: <20050105171255.GA24858@bender.817west.com>
References: <000901c4f346$6bc96ec0$3200a8c0@jeroen>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c4f346$6bc96ec0$3200a8c0@jeroen>
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

On Wed, Jan 05, 2005 at 05:48:43PM +0100, Jeroen van den Hoed wrote:
> Shouldn't the iptable rules above count ALL the traffic coming in and going
> out of eth0? And if these rules are correct, then why is this report lower
> than the report of ifconfig?

no.  someone else asked this recently:

  http://marc.theaimsgroup.com/?l=netfilter&m=110291893801688&w=2

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
        --The Simpsons

