From: "Mr. Ritter" <netfilter@candlefire.org>
Subject: Re: REF: Blocking Yahoo
Date: Fri, 03 Nov 2006 08:50:42 -0700
Message-ID: <454B6552.1000509@candlefire.org>
References: <380-22006115365443640@zamnet.zm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <380-22006115365443640@zamnet.zm>
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
To: lubasi <lubasi@zamnet.zm>, netfilter@lists.netfilter.org

lubasi wrote:
> # Route all www traffic to port 3128 for http acceleration
> /sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
> 
> #Block Yahoo Messnger
> /sbin/iptables -I FORWARD -s MYNETWORK/24 -d 216.155.193.0/22 -j DROP

How about simply moving the Yahoo block rule above the squid proxy rule, 
then you don't have to worry about Yahoo/Gaim using http tunneling.

--
Ritter


