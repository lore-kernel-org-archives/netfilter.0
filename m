From: KOVACS Krisztian <piglet@sch.bme.hu>
Subject: Re: ip_send() function
Date: Thu, 13 May 2004 15:45:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040513134532.GA22290@sch.bme.hu>
References: <ASERV1QzBxhJTANZwwP000003e2@aserv1.sea.uni-linz.ac.at>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ASERV1QzBxhJTANZwwP000003e2@aserv1.sea.uni-linz.ac.at>
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
Content-Transfer-Encoding: 7bit
To: Markus Zeilinger <mz@sea.uni-linz.ac.at>
Cc: netfilter <netfilter@lists.netfilter.org>


  Hi,

On Thu, May 13, 2004 at 01:56:03PM +0200, Markus Zeilinger wrote:
> I am currently writing a paper for my studies about netfilter and Linux
> Firewalling. In this case I also write a chapter about packet handling
> through the Linux network stack.
> Several papers and also in Harald Welte's "The journey of a packet through
> the linux 2.4 network stack" mention a function ip_send() in the process of
> packet forwarding. According to Harald this function is defined in
> /include/net/ip.h. But I cannot find a definition there, and surprisingly I
> was not able to find the ip_send() function anywhere in the kernel source. I
> searched through Kernel 2.6.6, 2.4.6 and 2.4.0 but did not find any tracks
> of a ip_send() function!?!

  http://lxr.linux.no/source/include/net/ip.h#L162

  Use LXR, it can help a lot!

-- 
 KOVACS Krisztian


