From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Vijay - port 25 to be blocked (nfcan: addressed to exclusive
	sender for this address)
Date: Tue, 28 Dec 2004 13:05:43 -0500
Message-ID: <20041228180543.GA30059@salty>
References: <200412281624.iBSGOEHc027426@gourmet.spamgourmet.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200412281624.iBSGOEHc027426@gourmet.spamgourmet.com> (from
	+nfcan+jimlaur+38cfe066fc.vijay#calsoftinc.com@spamgourmet.com
	on Tue, Dec 28, 2004 at 11:22:46 -0500)
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

On 2004.12.28 11:22, Vijay Kumar - vijay@calsoftinc.com wrote:
> Hi,
> 
> I want to allow my internal network to only connect to some specific email
> servers.
> Apart from these mail server  I want to block port 25 and 110 from my
> internal network to anywhwere. I am doing the following :
> 
> iptables -I INPUT -I eth0 --dport 25 -d  !<ip addr of mail server>  -j
> REJECT
> 
> This does not seem to block the port 25 traffic. Where am I going wrong?

The INPUT rules only apply to packets destined for the firewall computer.
Try this in FORWARD instead.

Another thing, a default drop policy might be simpler to administer.
Then only specifically allowed packets would be forwarded.
This approach more closely matches your intention, stated above.
Also, the approach above is hard to extend to multiple mail servers.

If you do this though, it is a good idea to log unexpected dropped
packets and analyze them to see what is being blocked.

> 
> Kindly help.
> 
> Regards,
> Vijay Kumar
>
-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

