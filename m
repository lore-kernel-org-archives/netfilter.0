From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: redirect to 127.0.0.1 [corrected]
Date: Tue, 17 May 2005 15:06:46 -0500
Message-ID: <428A4ED6.20500@riverviewtech.net>
References: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
	<428A3E81.3030301@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428A3E81.3030301@riverviewtech.net>
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

In light of Jason's response about dealing with the kernel's martian code I think a rule like this needs to be added to the solution:

iptables -t mangle -A PREROUTING -d $SERVER -p tcp --dport 11000 -j ROUTE --iif lo --continue
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 0 -j DNAT --to-destination 127.0.0.1:11000
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 1 -j DNAT --to-destination 127.0.0.1:11001
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 2 -j DNAT --to-destination 127.0.0.1:11002
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 3 -j DNAT --to-destination 127.0.0.1:11003



Grant. . . .

