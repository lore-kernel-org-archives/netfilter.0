From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: MARKing FTP traffic
Date: Sat, 29 Oct 2005 23:50:33 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510292348320.15219@filer.marasystems.com>
References: <43619010.4000204@logix.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43619010.4000204@logix.cz>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Michal Ludvig <michal@logix.cz>
Cc: netfilter@lists.netfilter.org

On Fri, 28 Oct 2005, Michal Ludvig wrote:

> 1) In "active" mode the packet sent to the server contains "PORT
> 192.168.0.137,<port>" which isn't translated to 192.168.0.160 in the
> SNAT rule and the server responds with "500 Illegal PORT command."

You need to load the ip_nat_ftp module for this to work..

> 2) In "passive" mode both sides negotiate random ports but such a
> connection isn't cought by the MARK rule and is sent over eth0 with src
> address 192.168.0.137. Obviously the ftp server responds with "425
> Security: Bad IP connecting."

CONNMARK can help you with this. So can the helper match. CONNMARK is 
probably easier..

> I have finally found a hlaf-working dirty solution:
> # iptables -t mangle -A OUTPUT -p tcp -d 192.168.157.21 \
>       -m state --state RELATED -j MARK --set-mark 6
> However this would affect all RELATED connections, not only FTP ones
> (well, that's likely not a huge problem but still :-) and it works with
> active ftp only which could be a serious problem.

Note: The above rule only matches the very first packet on a related 
connection (i.e. the initial SYN of an FTP data channel).

Regards
Henrik

