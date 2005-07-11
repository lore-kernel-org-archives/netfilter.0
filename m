From: Scott <gneamob@yahoo.com>
Subject: Re: dnatting
Date: Mon, 11 Jul 2005 08:24:29 -0700 (PDT)
Message-ID: <20050711152429.77154.qmail@web54306.mail.yahoo.com>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711151830.GA26670@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

You may need to install, additionally, a web proxy,
such as squid and tell iptables to use it as a
transparent proxy for all internal machines, like
this:

iptables -t nat -A POSTROUTING -s
192.168.10.0/255.255.255.0 -i ethX -p tcp -m tcp
--dport 80 -j DNAT --to-destination 192.168.10.1:3128

where ethX is the interface on the internal network.

-Scott

--- Payal Rathod <payal-netfilter@scriptkitchen.com>
wrote:

> Hi,
> I have a rule on my friend's broadband connection to
> redirect traffic 
> from outside to an internal machine like,
> 
> iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp
> --dport 80 -j DNAT  \
> --to-destination 192.168.10.10:80
> 
> But she complained that people from inside the
> network cannot do
> http://1.2.3.4 in their browser and see the site. Is
> she correct?
> What is wrong with my rule because I can see the
> site from outside?
> 
> Thanks in advance.
> With warm regards,
> -Payal
> 
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

