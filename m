From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Re: Change outbound ICMP source
Date: Mon, 10 Apr 2006 17:20:35 -0500
Message-ID: <443ADA33.4010304@gmail.com>
References: <443A9DA4.30801@gmail.com>	<Pine.LNX.4.64.0604102004520.26404@darkstar.sysinfo.com>
	<443ABD8A.7080002@gmail.com> <443AD851.1050006@hin.de>
Reply-To: nathaniel.d.hall@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <443AD851.1050006@hin.de>
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
To: sven@hin.de
Cc: netfilter@lists.netfilter.org

sven@hin.de wrote:

>>That doesn't achieve what I want.  If a TCP connection is rejected at
>>the firewall, then blocking ICMP at the upstream router will block the
>>host-unreachable from going out, not make it seem as if the router is
>>the source.
>>    
>>
>
>You want to do SNAT?
>
Yes, but it isn't SNAT because it isn't being routed.  It would be on
the OUTPUT chain since it is originating from the firewall.

-- 
Nathaniel Hall, GSEC GCFW GCIA


