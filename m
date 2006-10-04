From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: redirect all HTTP traffic
Date: Wed, 04 Oct 2006 12:15:42 +0200
Message-ID: <452389CE.9060902@eccotours.co.za>
References: <452387A9.3010906@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452387A9.3010906@eccotours.co.za>
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

Brent Clark wrote:
> $IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -t filter -A FORWARD -i eth1 -o eth1 -p tcp --dport 80 -m state 
> --state NEW -j ACCEPT

sorry my forward was wrong.

Should have been 3128 as opposed to 80

Thanks
Brent


