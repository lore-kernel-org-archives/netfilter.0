From: Jason Opperisano <opie@817west.com>
Subject: Re: Blocking forwarding of packets in WLAN
Date: Thu, 14 Oct 2004 10:27:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014142730.GA3211@bender.817west.com>
References: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 14, 2004 at 03:48:50PM +0200, Claudio Lavecchia wrote:
> Prototype for my function is then: 
> 
> void block_forwarding(char * MAC_address); 
> 
> Is this feasible someway using iptables? Can anyone give me a precise hint
> on how to do that? I would be truly grateful if someone could help me. 

can't help you with the C code aspect of it, but if at some point you
get to the part where you need the actual iptables command to block
forwarding of a packet by MAC address, it's:

  iptables -A FORWARD -m mac --mac-source $MACADDR -j DROP

where $MACADDR is in XX:XX:XX:XX:XX:XX form.

-j

-- 
Jason Opperisano <opie@817west.com>

