From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allow only certain ip addresses
Date: Thu, 10 Jun 2004 18:49:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406101849.17226.Antony@Soft-Solutions.co.uk>
References: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 10 June 2004 6:39 pm, Jonathan Villa wrote:

> I want to allow connections on ports 3306, 22, and 80 for a group of ip
> address.
>
> Some will be from the block, others are dispersed.
>
> My assumption is this
>
> 1. create an array of the single ip addresses.
> 2. loop throught the array printing an iptables command which will allow
> access on those ports to the loop index.
> 3. hardcode the ip block xx.xxx.xx.0/24

Looks like a good solution to me.

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


