From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: mac-filtering is not working (nfcan: addressed to exclusive
	sender for this address)
Date: Thu, 17 Mar 2005 18:19:24 -0500
Message-ID: <20050317231924.GG3730@salty>
References: <2239.1111100113@www54.gmx.net>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
In-Reply-To: <2239.1111100113@www54.gmx.net> (from
	+nfcan+jimlaur+7b5f1cc311.Port17#gmx.net@spamgourmet.com on Thu,
	Mar 17, 2005 at 17:55:13 -0500)
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

On 2005.03.17 17:55, Manuel Schmitz - Port17@gmx.net wrote:
> Hello,
> 
> I am desperately trying to establish mac-filtering on my debian-router.
> 
> - All default chains are empty, policy set to "ACCEPT".
> - I execute
> 
>   iptables -A FORWARD -m mac --mac-source $MY_MAC -j ACCEPT
> 
>   and then set the FORWARD-Policy to "DROP". Now I expect the chain to
>   drop all packages exept these coming from $MY_MAC. Am I right?
> - It does not work. It drops ALL traffic. So why?

How do you know that *all* packets are dropped?
Why would changing the default policy affect a working rule?
Have you done iptables -L -nvx and examined the counts?

The rule is for one direction only - from $MY_MAC to the world,
there is no provision for traffic to $MY_MAC.

A rule like this would handle most reply traffic:
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

For a really good reference on iptables in general, check out
http://iptables-tutorial.frozentux.net/


-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

