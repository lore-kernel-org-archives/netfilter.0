From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: attempting to transparently proxy with this script to no avail
	(nfcan: addressed to exclusive sender for this address)
Date: Tue, 1 Mar 2005 20:07:23 -0500
Message-ID: <20050302010723.GI14303@salty>
References: <BAY17-F386CBFC183CD40C68DFE19DC590@phx.gbl>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
In-Reply-To: <BAY17-F386CBFC183CD40C68DFE19DC590@phx.gbl> (from
	+nfcan+jimlaur+f8d0e213b6.securadd#hotmail.com@spamgourmet.com
	on Tue, Mar 01, 2005 at 17:03:12 -0500)
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

On 2005.03.01 17:03, joe z - securadd@hotmail.com wrote:
> this script runs everything fine just the redirect doesn't. the proxy works  
> fine when browser pointed at it.
>

...

> iptables -t nat -A PREROUTING -m tcp -p tcp --dport 80 -j REDIRECT --to-port  
> 8080

Try this instead:

iptables -t nat -A PREROUTING -m tcp -p tcp --dport 80 -j DNAT --to-port 8080

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

