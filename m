From: Willi Dyck <wdyck@gmx.net>
Subject: Re: fetchmail from intern
Date: Sat, 22 Feb 2003 01:07:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030222000754.GE412@tekilla.homeip.net>
References: <20030217144358.CE83417C93@delta.meyer.home>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030217144358.CE83417C93@delta.meyer.home>
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
To: netfilter@lists.netfilter.org

On Mon, Feb 17, 2003 at 03:43:58PM +0100, Andreas Meyer wrote:
> Running fetchmail from the mailserver behind the firewall I have
> the problem to go to the WAN.

> iptables -t nat -A PREROUTING -p TCP --dport 110 -m state --state
> NEW,ESTABLISHED,RELATED -j DNAT --to 192.168.1.75:110

You might want to do SNAT or MASQUERADING in order to be able to access
the WAN.

> But writing
> 
> iptables -t nat -A PREROUTING -p TCP --dport 110 -m state --state
> NEW,ESTABLISHED,RELATED -j DNAT --to 0.0.0.0:110
> 
> I get a
> kernel: martian destination 0.0.0.0 from 192.168.1.3, dev eth0

What do you want your outbound packets to look like? 0.0.0.0 ?

-- 
wdyck at gmx dot net

