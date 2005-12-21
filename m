From: lst_hoe01@kwsoft.de
Subject: Re: ICMP types to allow
Date: Wed, 21 Dec 2005 15:16:23 +0100
Message-ID: <20051221151623.138hvswootw80sw4@webmail.kwsoft.de>
References: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
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

Zitat von Derick Anderson <danderson@vikus.com>:

> I know that some networks just drop all ICMP to prevent traceroutes but
> recently I've been been seeing problems related to fragementation and
> MTU and wondering if dropping ICMP is causing some of that (since
> Fragementation Needed packets can't get through). On the flip side of
> that there's the Source Quench and Fragmentation Needed DoS attacks
> which have recently become mildly popular (I've gotten a few hits on
> Snort but not that many).
>
> I'd like to hear from the list what ICMP types firewall admins are
> allowing and why - what are the risks for allowing certain types vs. the
> risks of NOT allowing them?
>
> Thanks,
>
> Derick Anderson


We allow icmp type 8 (echo request) incoming against our firewall and 
all "related" and "established" icmp traffic, which should cover the 
MTU problem and should be save against blind spoofing.

Regards

Andreas



