From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT PREROUTING vs. filter FORWARD
Date: Sat, 21 Oct 2006 08:46:31 +0200
Message-ID: <4539C247.9020803@rtij.nl>
References: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>	
	<4429765974127559812@unknownmsgid>
	<8ca422820610201004w4fe2091bnbdb4fbba7a0b5b6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca422820610201004w4fe2091bnbdb4fbba7a0b5b6@mail.gmail.com>
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
To: Mike <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

Mike wrote:

> Martijn,
> The sciprt idea sounds quite clever and efficient!
> I would be very interested to see your method by script, if it is not
> a security risk, etc.
> Thank you very much for your response and idea.


It is pretty efficient. I write my firewall rules in perl. The loader 
executes this script and pipes the output into iptables-restore. It is 
not in a stage that I want to release it to the world yet, however.

M4

