From: Gianni Pucciani <gp.puccio@tin.it>
Subject: Re: opening connection for Tomcat
Date: Fri, 09 Apr 2004 08:28:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407642A3.1040700@tin.it>
References: <40756C19.3010606@tin.it> <1081446600.2453.63.camel@katala.sterenborg.info> <4075B24D.1020601@tin.it> <200404082253.44301.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404082253.44301.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:
> On Thursday 08 April 2004 9:13 pm, Gianni Pucciani wrote:
> 
> 
>>Ok, I've fixed the problem: it seems that the address 0.0.0.0 is no good.
> 
> 
> You are certainly very unlikely to receive packets from that address, as it 
> does not exist.

Well, I'm not a firewall guru, but I think that 0.0.0.0 address is often 
used to indicate "every address", isn't it?

Gianni
> 
> Regards,
> 
> Antony.
> 



