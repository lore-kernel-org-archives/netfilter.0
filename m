From: Oleg <xsov@mail.ru>
Subject: Re: Fixup protocol
Date: Fri, 14 Apr 2006 08:14:24 +0400
Message-ID: <200604140814.24600.xsov@mail.ru>
References: <cc86d0010604131641r157d57eu1b0cda9962b7d410@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc86d0010604131641r157d57eu1b0cda9962b7d410@mail.gmail.com>
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

> I'm searching for solution about the Cisco PIX fixup protocol
> (application inspection) in Linux OS.
> This solution ensures the secure use of applications and services, by
> enabling Adaptative Security Algorithm.
Take a look at the unclean module, it supports TCP, UDP, ICMP, IP.

-- 
Best regards, Oleg


