From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: outbound policy for tcp 80 (nfcan: addressed to exclusive
	sender for this address)
Date: Sat, 19 Nov 2005 22:38:28 -0500
Message-ID: <20051120033828.GA19571@salty>
References: <BAY102-F20600188C76B3E66662EBAE510@phx.gbl>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY102-F20600188C76B3E66662EBAE510@phx.gbl> (from
	+nfcan+jimlaur+957286d880.props666999#hotmail.com@spamgourmet.com
	on Sat, Nov 19, 2005 at 17:39:47 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.19 17:39, P theodorou - props666999@hotmail.com wrote:
> I have restricted all the connections apart from port 53, 443 and 80 on the  
> forward chain. My computer uses eth1 with eth0 beeing the firewall computer.
> 
> Unfortunately when testing the outbound performance of the firewall with  
> leak testers etc.. (little applications on the web) i discover that they use  
> port 80 to transmit info to remote hosts. Fine and logical . How can i avoid  
> this using iptables rules. I do need though Internet access.

As far as I know, you can NOT do what you want with iptables rules.
The usual approach to what you want to do is to use a proxy server.

http://www.squid-cache.org/

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

