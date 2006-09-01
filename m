From: longraider <longraider@gazeta.pl>
Subject: Re: DNAT for two external NIC
Date: Fri, 01 Sep 2006 10:35:03 +0200
Message-ID: <44F7F0B7.5010001@gazeta.pl>
References: <054a01c6cd90$641aa3d0$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <054a01c6cd90$641aa3d0$0100a8c0@newlife>
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

Ming-Ching Tiew wrote:

>>Maybe you need to disable rp_filter (reverse path filtering) on the
>>interface that has not the default route.
>>
>>sysctl -w net/ipv4/conf/eth2/rp_filter=0
> 
> Isn't this a bug in rp_filter ? In multipath routing, it's often the system
> will have multiple routing tables. The rp_filter seems to only look at
> the main routing table.
> 

It looks at different tables (according to ip rule). I've recently
posted a problem with the same solution. The problem was with the fwmark
in the ip rules.

http://lists.netfilter.org/pipermail/netfilter/2006-August/066553.html

-- 
mati



