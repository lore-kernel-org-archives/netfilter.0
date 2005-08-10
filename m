From: "Alessandro O. Ungaro" <x-arnie@ccpbr.org>
Subject: Re: iptables -F
Date: Wed, 10 Aug 2005 14:21:57 -0300
Message-ID: <42FA37B5.8000301@ccpbr.org>
References: <8d48b6ba05080916184604d299@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8d48b6ba05080916184604d299@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Shannon,

when you use the iptables command and no specify the table, it assumes 
that the table is filter, so "iptables -t filter -F" is the same as 
"iptables -F". That's why you need to specify the table to flush the 
nat, like flush mangle, etc...

best regards,

x-arnie

Shannon Roddy wrote:
> Can someone help me out here?  I figured that iptables -F would flush
> all tables including the nat table, but it appears to not flush it.  I
> have to explicitly use iptables -t nat -F to fllush the NAT rules.
> 
> Thanks,
> Shannon
> 
> 
> 


