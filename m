From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: redirect to 127.0.0.1 [corrected]
Date: Tue, 17 May 2005 16:48:31 -0500
Message-ID: <428A66AF.1040604@riverviewtech.net>
References: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>	<428A3E81.3030301@riverviewtech.net>	<428A4ED6.20500@riverviewtech.net>
	<20050517203211.GA2367@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050517203211.GA2367@bender.817west.com>
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

> just 'cause i'm feelin' picky today...  "--state NEW" in -t nat is
> redundant, as only "--state NEW" packets ever traverse -t nat.

Ok, let's try for version 0.3.  :P~

iptables -t mangle -A PREROUTING -d $SERVER -p tcp --dport 11000 -j ROUTE --iif lo --continue
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m nth --every 4 --packet 0 -j DNAT --to-destination 127.0.0.1:11000
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m nth --every 4 --packet 1 -j DNAT --to-destination 127.0.0.1:11001
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m nth --every 4 --packet 2 -j DNAT --to-destination 127.0.0.1:11002
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m nth --every 4 --packet 3 -j DNAT --to-destination 127.0.0.1:11003



Grant. . . .

