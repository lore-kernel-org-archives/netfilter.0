From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables don't block traffic
Date: Thu, 22 Apr 2004 15:46:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221546.14351.Antony@Soft-Solutions.co.uk>
References: <4087CE5F.5030503@riafinancial.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087CE5F.5030503@riafinancial.com>
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

On Thursday 22 April 2004 2:53 pm, Oscar Arranz wrote:

>     I have a Red Hat box running as a firewall in my network. It's
> working fine, but now I'm doing tests in order to block certain Internet
> traffic. I've added the following rules which should drop packets from
> my PC to a known public IP (a web server):
>
> iptables -A FORWARD -s 192.138.35.110 -d 193.110.128.200 -j DROP
>
>     But the packets are not droped because I still can connect to the
> web server.
>
>     The default rule for FORWARD chain is DROP
>
>    Any ideas?

You say you have added the above rule.

But, what have you added it *to*?

In other words, what other rules do you also have running on the machine?

That information would help us greatly in answering your question.

Regards,

Antony

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


