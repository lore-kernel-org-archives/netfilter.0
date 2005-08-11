From: "Tim Evans" <tkevans@tkevans.com>
Subject: Re: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 08:34:18 -0400
Message-ID: <20050811123418.M4053@tkevans.com>
References: <5AD6E09C3CB0BE4E83BDABFBF560EA0002C2B1B9@usanbrmbx01.ds.liz.com>
	<876ef97a05081105228ecd1d8@mail.gmail.com>
Reply-To: tkevans@tkevans.com
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a05081105228ecd1d8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Toby DiPasquale <codeslinger@gmail.com>, Ruiyuan Jiang <Ruiyuan_Jiang@liz.com>, netfilter@lists.netfilter.org

On Thu, 11 Aug 2005 08:22:33 -0400, Toby DiPasquale wrote

> No, iptables can only be used with Linux because it relies on the
> netfilter framework in the Linux kernel. Solaris' kernel lacks
> netfilter, therefore it cannot make use of iptables. You might be 
> able to get a command-line tool with the same interface as iptables for
> Solaris, however; look around.

Recent Solaris versions include 'ipfilter'.  Main site for ipfilter is
http://www.ipfilter.org/




--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |    


