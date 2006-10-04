From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: redirect all HTTP traffic (nfcan: addressed to exclusive sender
	for this address)
Date: Wed, 4 Oct 2006 08:34:23 -0400
Message-ID: <20061004123423.GA22147@salty>
References: <452387A9.3010906@eccotours.co.za>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <452387A9.3010906@eccotours.co.za> (from
	+nfcan+jimlaur+beeeb246f4.bclark#eccotours.co.za@spamgourmet.com
	on Wed, Oct 04, 2006 at 06:06:33 -0400)
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

On 2006.10.04 06:06, Brent Clark - bclark@eccotours.co.za wrote:
> Hey all
> 
> Ive been trying to redirect all HTTP traffic to my newly built proxy  
> (squid).
> 
> But I cant seem to get it working.
> 
> This is what I have
> 
> $IPT -t nat -A PREROUTING -i eth1 -s 192.168.111.0/24 -p tcp --dport 80 -j  
> DNAT --to 192.168.111.9:3128
> $IPT -t nat -A POSTROUTING -o eth1 -s 192.168.111.0/24 -j SNAT --to  
> 192.168.111.10
> 
> and
> 
> $IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -t filter -A FORWARD -i eth1 -o eth1 -p tcp --dport 80 -m state --state  
> NEW -j ACCEPT

The prerouting rule changed the destination port from 80 to 3128.
Try accepting new traffic on 3128 in the filter table.

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

