From: Jason Opperisano <opie@817west.com>
Subject: Re: limiting outgoing connections
Date: Tue, 22 Mar 2005 06:39:13 -0500
Message-ID: <1111491553.4267.28.camel@hubcap.ljm.dom>
References: <20050322061913.21052.qmail@web30801.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050322061913.21052.qmail@web30801.mail.mud.yahoo.com>
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

On Tue, 2005-03-22 at 01:19, Linux Query wrote:
> Hi All!
> 
> I want to limit each clients outgoing connections.
> Will the following be ok ?
> 
> iptables -A FORWARD -i $internal_interface -s $ip -m
> limit --limit 10/s -j ACCEPT
> iptables -A FORWARD  -i $internal_interface -s $ip -j
> DROP
> 
> What is a good limit figure ?

it would be saner to use the connlimit match from PoM, or the newer
hashlimit match for this.

-j

--
"Please do not offer my god a peanut"
	--The Simpsons


