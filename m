From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: Mon, 04 Aug 2003 14:32:48 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2DF000.8010606@mega-bucks.co.jp>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C030@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C030@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

George Vieira wrote:
>
> it's being dropped because you have allowed TCP port 80 on
219.118.175.0/24 ONLY.. looking at your logs it shows the IP as
DST=203.179.86.66 which isn't to that network..

Maybe you misread the iptables' out output since the formatting is off,
but the rule for 219.118.175.0/24 is for SSH. The port 80 rule is:

ACCEPT tcp  --  eth0   *  0.0.0.0/0 203.179.86.66  state
NEW,RELATED,ESTABLISHED tcp dpt:80

> HOW BIG is your network???

Only 16 IP addresses. I hate to show my ignorance but the the SSH rule
which uses the 219.118.175.0/24 is to allow SSH access from another
network with 8 IP address. The range is 219.118.175.240-248 but I didn't
know how to write that as a / netmask so I used 0/24 :(

Jc


