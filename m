From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: public IP behind NAT system
Date: Fri, 3 Oct 2003 18:47:37 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003131737.GA1700@linux.local>
References: <200310022320.10454.libolt@libolt.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200310022320.10454.libolt@libolt.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike McLean <libolt@libolt.net>
Cc: netfilter@lists.netfilter.org

On Thu, Oct 02, 2003 at 11:20:10PM -0700, Mike McLean wrote:
> Hi,
> 
> I have a situation where I've setup a system that has one public IP and does 
> NAT for a network of computers with private IPs.  However I wish to setup a 
> couple of machines behind this NAT system with public IPs like the following:
> 
> 
> outside router --> NAT system --> other systems with public IPs.

Something like,
iptables -t nat -A PREROUTING -d <ext ip> -j DNAT --to <int ip>

might help.

-Payal

> 
> I am wondering if this is possible and feasable with netfilter.  I don't want 
> netfilter to NAT any packets sent to the public IPs that aren't on the NAT 
> system.
> 
> Any help is greatly appreciated,
> 
> Mike
> 
> 

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

