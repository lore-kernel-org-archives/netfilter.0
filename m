From: Jason Opperisano <opie@817west.com>
Subject: Re: travelling the tables and chains...
Date: Tue, 5 Apr 2005 00:28:28 -0400
Message-ID: <20050405042828.GA1197@bender.817west.com>
References: <4250A5A6.6040509@lorenzutti.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4250A5A6.6040509@lorenzutti.com.ar>
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

On Sun, Apr 03, 2005 at 11:25:42PM -0300, Guido Lorenzutti wrote:
> Hi people, i would like to clean up my firewall script by creating new 
> chains in the filter table. Like this:
> 
> iptables -N FORWARD_WAN_TO_LAN
> 
> Then, call the traffic in the FORWARD chain:
> 
> iptables -A FORWARD -i $WAN -o $LAN -j FORWARD_WAN_TO_LAN
> 
> Now how can i discriminate the DNATed packets from that rule? It's OK if 
> i MARK them in the PREROUTING chain and create a rule BEFORE in the 
> FORWARD chain to check if the packet im MARKed then -j DNATED_WAN_TO_LAN?
> 
> Any better ideas?

MARK-ing is a pretty decent general-purpose way of keeping track of
where a packet has been.  in your case--if you need to find all DNAT-ed
packets, you could use the more specialized:

  "-m conntrack --ctstate DNAT"

to match a DNAT-ed packet.

-- 
"Baby needs to suck ash. Baby needs to suck ash. Not ass, you pervert. 
 Save it for the interns."
	--Family Guy

