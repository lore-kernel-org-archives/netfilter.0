From: Feizhou <feizhou@linuxmail.org>
Subject: Re: conntrack - UDP = good
Date: Thu, 24 Jun 2004 09:58:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DA3549.9000109@linuxmail.org>
References: <876ef97a04062309012fa66caf@mail.gmail.com> <200406231613.40133.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231613.40133.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:
> On Wednesday 23 June 2004 5:01 pm, Tobias DiPasquale wrote:
> 
> 
>>Hi all,
>>
>>Is there a way to get conntrack to _not_ track UDP connections (or
>>also ICMP)? It seems rather pointless to me and its certainly taking
>>up way too much memory on my box just for some DNS queries. Any ideas?
> 
> 
> This may help:
> 
> http://lists.netfilter.org/pipermail/netfilter/2003-October/047892.html

The raw table support is now an option in 2.6.6 and above.

Not sure about the iptables support that comes with your distro though.

