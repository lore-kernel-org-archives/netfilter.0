From: Jason Opperisano <opie@817west.com>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 10:09:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095689352.1898.30.camel@wolfpack.ljm.dom>
References: <200409201357.i8KDvZNg022820@outbound3.mail.tds.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409201357.i8KDvZNg022820@outbound3.mail.tds.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-20 at 09:57, nutbrownhares@tds.net wrote:
> With all due respect, I initially asked a technical question: given a data file, how does one block ranges from that file.  I didn't ask if people agreed or disagreed with why we want to do this.   The "why" isn't relevant to the discussion.  I'm also not interested in whether it is or is not 100% effective; I know it isn't.  It will still eliminate 95% of the traffic I want to stop.  So far I've seen a lot of political opinions.  Does anyone have a technical answer?
> 

true that.

FILE="/path/to/file"

for ADDR in `cat $FILE`; do
  iptables -A mychain -s $ADDR -j DROP
done

the above assumes that $FILE contains a list of IP addresses or
IP/PREFIX values, one per line.  it also assumes that "mychain" exists,
and that you want to block the addresses in $FILE by source.  adjust as
needed for your exact situation.

-j

-- 
Jason Opperisano <opie@817west.com>


