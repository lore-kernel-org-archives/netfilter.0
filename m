From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: How do I block www.yahoo.com
Date: Sun, 3 Sep 2006 14:33:24 +0200
Message-ID: <27697.7072739557$1157286848@news.gmane.org>
References: <20060903122559.99728.qmail@web56203.mail.re3.yahoo.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060903122559.99728.qmail@web56203.mail.re3.yahoo.com>
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

Hello,

I recommend the use of a http proxy server which allows access control ( for
example SQUID ). 

Only by using iptables - you would need to deny access to whole yahoo IP
range. When you use -d www.yahoo.com iptables resolves the www.yahoo.com
into one IP address which will be blocked then. But since Yahoo has more IP
addresses ( served in round-robin manner by DNS servers ) that wont help you
much. 

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Elvir Kuric
Sent: Sonntag, 03. September 2006 14:26
To: saki; netfilter@lists.netfilter.org
Subject: Re: How do I block www.yahoo.com

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



