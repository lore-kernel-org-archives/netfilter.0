From: Marcin Sura <slacklist@op.pl>
Subject: Re[2]: Counting traffic - another question
Date: Tue, 27 Jul 2004 15:52:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <74231959.20040727155207@op.pl>
References: <1304297675.20040727143400@op.pl>
 <200407271359.13020.Antony@Soft-Solutions.co.uk>
Reply-To: Marcin Sura <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407271359.13020.Antony@Soft-Solutions.co.uk>
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

Tuesday, July 27, 2004, 2:59:13 PM, you wrote:

> No need to MARK the packets (unless you want the MARKs for something else?),

Yes, I need MARKs for traffic shaping. Sorry, I forgot to mention this.

> and you can specify input & output interface in the FORWARD table to identify
> which way through your firewall the packets are going.

 $IPTABLES -t mangle -A FORWARD -i $LOCAL_IF -o $INET_IF  -j statsout
 $IPTABLES -t mangle -A FORWARD -i $INET_IF -o $LOCAL_IF -j statsin



-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


