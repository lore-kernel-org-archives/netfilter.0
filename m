From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problem with forward/nat
Date: Sun, 7 Mar 2004 09:46:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403070946.05288.Antony@Soft-Solutions.co.uk>
References: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com> <200403070926.05098.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403070926.05098.Antony@Soft-Solutions.co.uk>
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

On Sunday 07 March 2004 9:26 am, Antony Stone wrote:

> I would recommend also that you change all your INPUT rules:
>
> For a single rule instead:
> > iptables -A INPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT

Sorry!   I did *not* mean to leave the "NEW" in that rule!!

It should read:

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

It's too early in the morning for me - I shouldn't be answering technical 
questions yet :-)

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


