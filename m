From: Rudi Starcevic <tech@wildcash.com>
Subject: Policy Accept + Allow Multiple IP's
Date: Mon, 15 Nov 2004 16:51:57 -0800
Message-ID: <41994F2D.70105@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I have an Iptables firewall with a default policy of accept.

I want to allow only certain IP's ssh access.

So far I have this rule which allows 1 ip:

iptables -A INPUT -p tcp --dport 22 -s ! xxx.xxx.xxx.xxx -j DROP

I'm not sure how to list more that 1 allowable IP.

This is a production box I've inherited so I'm hoping to work with I already
have but may need to look at changing the default policy to drop or 
something.

Please advise, many thanks.
Regards Rudi




