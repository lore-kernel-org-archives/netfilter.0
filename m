From: Marcin Sura <slacklist@op.pl>
Subject: Re[4]: Counting traffic - another question
Date: Tue, 27 Jul 2004 23:57:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8310579748.20040727235745@op.pl>
References: <1304297675.20040727143400@op.pl>
 <200407271359.13020.Antony@Soft-Solutions.co.uk>
 <1368880926.20040727155717@op.pl>
 <200407271526.15564.Antony@Soft-Solutions.co.uk>
Reply-To: Marcin Sura <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407271526.15564.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

Witam

Tuesday, July 27, 2004, 4:26:15 PM, you wrote:

> No, don't put the "-j statsout" or "-j statsin" at the end.   The rule I
> suggested previously is actually complete:

> iptables -A FORWARD -t mangle -i eth0 -o ppp0 -p tcp --dport ssh


-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


