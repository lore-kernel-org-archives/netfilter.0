From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: How do I block www.yahoo.com
Date: Sun, 3 Sep 2006 05:25:59 -0700 (PDT)
Message-ID: <20060903122559.99728.qmail@web56203.mail.re3.yahoo.com>
References: <20060903105127.33678.qmail@web36605.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060903105127.33678.qmail@web36605.mail.mud.yahoo.com>
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
To: saki <sakimumustafa@yahoo.com>, netfilter@lists.netfilter.org

Hi,  try this 


iptables -A FORWARD -p tcp -s 10.0.1.3 -d
www.yahoo.com -j DROP

Regards

Elvir

--- saki <sakimumustafa@yahoo.com> wrote:

> Hello Guruz,
> I want to block traffic from host 10.0.1.3 to
> www.yahoo.com through my Gateway server.
> 
> I implimented this command :
> #iptables -A FORWARD -o eth0 -s 10.0.1.3 -d
> www.yahoo.com -j DROP
> But could not block traffic. Any idea?
> 
> Best Regards,
> Saki
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam
> protection around 
> http://mail.yahoo.com 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

