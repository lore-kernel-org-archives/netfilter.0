From: Eric Leblond <eric@inl.fr>
Subject: Re: Very basic question
Date: Fri, 24 Sep 2004 13:09:39 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096024177.6704.9.camel@coati>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-24 at 12:28, coding@digital-data.co.uk wrote:
> Hi,
> 
>             I am very new to trying to use iptables and was wondering if
> someone could help me out with what I should do to solve my current problem.

> Ie forward all incoming traffic on eth2 going to address 213.249.230.206 to
> 192.168.10.2 on eth1.

only one is enough 

> iptables -t nat -A PREROUTING -i eth2 -s 213.249.230.206 -j DNAT --to
> 192.168.10.2

traffic to 213.249.230.206 thus -d not -s :
iptables -t nat -A PREROUTING -i eth2 -d 213.249.230.206 -j DNAT --to
192.168.10.2
-- 
Eric Leblond <eric@inl.fr>
INL


