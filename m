From: Gabriel <jarod125@yahoo.com>
Subject: Re: ICMP packets
Date: Tue, 20 Sep 2005 07:30:43 -0700 (PDT)
Message-ID: <20050920143043.418.qmail@web60917.mail.yahoo.com>
References: <BAY102-F140CB05B42680BA717BE36AE950@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F140CB05B42680BA717BE36AE950@phx.gbl>
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
To: netfilter@lists.netfilter.org

--- P theodorou <props666999@hotmail.com> wrote:

> Im new into iptables world
> 
> now regarding icmp packets . Is it
> applicable to drop inbound echo requests (so otherts
> cannot see me )
> 
> but i will be able to send  icmo echo request to WEB and
> receive
> replies too .
> 
> Sorry if it looks very basic but im confused
> 
> Thanks

This rule should do the trick:
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP

It won't allow outgoing echo replies (pongs), but will
allow outgoing echo requests (pings) and their replies.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

