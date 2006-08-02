From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: How to configure iptables for a group of IPs
Date: Wed, 02 Aug 2006 14:05:26 +0200
Message-ID: <44D09506.6000807@freemail.hu>
References: <20060802110031.49705.qmail@web56603.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060802110031.49705.qmail@web56603.mail.re3.yahoo.com>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Tolga Onbay:
> If there is something like defining a range of IP
> addresses in iptables like 192.168.1.10-192.168.1.20,
> I can configure the IP addresses of workers to match
> this feature.
>   

iptables .... -m iprange --src-range 192.168.1.10-192.168.1.20

