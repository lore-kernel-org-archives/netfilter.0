From: lst_hoe01@kwsoft.de
Subject: Re: 1. Switch Flooding 2. Chains traversal
Date: Wed, 14 Sep 2005 11:42:14 +0200
Message-ID: <20050914114214.srlhfxt1l1pck04w@webmail.kwsoft.de>
References: <acf1defa050913213555e04129@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <acf1defa050913213555e04129@mail.gmail.com>
Content-Disposition: inline
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

Zitat von venkata subramanian <venkatasubramanian@gmail.com>:

> Hi,
> 1. Switch Flooding
>       We have a nice problem in our organisation. Due to viruses,
> some windows machine or the other starts flooding the network with
> packets. And, in the end, one of our switches comes down making us to
> manually restart the switch.
>       I don't (intuitively) see how iptables can help in this
> scenario.... But, I want to know whether any solution exists to this?
> If I make all the machine's gateway as a linux system, and rate limit
> the packets there will it help?

Use a better switch. We once had a cheap 3Com (4300-48 Ports) which had 
the same
behavior with ping-flood to many invalid IP-Adresses. I guess it was a error
with the ARP handling. Once the switch was replaced by a 4400-48 (which is
really 3Com not re-branded crap) the problem was gone.
Best solution is of course to fix the virus-machines in your network.

Regards

Andreas



