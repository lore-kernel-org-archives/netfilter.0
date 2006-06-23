From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: VPN (off-topic)
Date: Fri, 23 Jun 2006 09:13:10 -0400
Message-ID: <200606230913.10915.dyioulos@firstbhph.com>
References: <20060623_130008_007203.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060623_130008_007203.zottmann@ig.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday June 23 2006 9:00 am, zottmann wrote:
> Hi !!
>
> Sorry for this off-topic, but I guess this should be a good place
> to ask for advice ...
>
> We use iptables, and we are needing to install a vpn solution in
> order to build vpns with other companies that may be using various
> vpn solutions, so we need one that can build vpns based on
> standards, like ipsec.
>
> I have heard about OpenVPN and FreeSwan.
>
> Are these good solutions? Do they have any management resources,
> like graphical interfaces for setting up vpns and getting
> information about its use?
>
> Are there any other open source or free implementation of vpn that
> is better suited for use with iptables?
>
> Thanks in Advance,

We use OpenVPN (as well as iptables) in our shop, and it works great.  
Adding the rules to iptables for OpenVPN operability is simple.  The 
OpenVPN documentation is quite thorough, and the mailing list is very 
helpful.

HTH.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


