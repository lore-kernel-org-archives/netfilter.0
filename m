From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Preventing port scanning
Date: Wed, 7 Apr 2004 20:09:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404072009.18163.Antony@Soft-Solutions.co.uk>
References: <20040407185754.596353C97@sterenborg.info>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040407185754.596353C97@sterenborg.info>
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

On Wednesday 07 April 2004 7:57 pm, Rob Sterenborg wrote:

> > Is it possible to prevent people from port scanning my
> > firewall to see whats open?
>
> You mean : "iptables -P INPUT DROP" ?

I'd recommend "iptables -F INPUT" with that choice, sir :)

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


