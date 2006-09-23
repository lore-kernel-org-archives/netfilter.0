From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: iptables rtsp port forwarding
Date: Sat, 23 Sep 2006 21:13:50 +0200
Message-ID: <7656.94543156332$1159038879@news.gmane.org>
References: <20060923190620.58841.qmail@web56206.mail.re3.yahoo.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060923190620.58841.qmail@web56206.mail.re3.yahoo.com>
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

Just a little notice. -i is used for interface like -i eth0 and NOT for
destination address. Maybe the example on DNAT from Elvir will help you. If
not try the rtsp helper for iptables.

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Elvir Kuric
Sent: Samstag, 23. September 2006 21:06
To: sundar; netfilter@lists.netfilter.org
Subject: Re: iptables rtsp port forwarding

Hi, 
try this 

iptables -t nat -A PREROUTING -s any/0 -d
your_static_ip_addrese -p tcp --dport 554 -j DNAT
--to-destination host_ip_in_internal_network:554

Regards

PS: I am not sure about this rtsp protocol, how
iptables "see" it. Maybe someone else know more



--- sundar <sundar@cynaptix.com> wrote:

> Hi,
> 
> I am new to Linux IPTABLES.
> 
> I have a windows box ( for Windows Streaming Media
> Server) behind the
> firewall (Iptables). I would like to redirect the
> external calls to my
> windows box for streaming video. But i am not able
> to configure it since my
> player says "your server may not support rtsp
> protocol"
> 
> iptables -t nat -A PREROUTING -i xx.252.1225.27 -p
> tcp --dport 554 -j DNAT
> --to-dest 192.168.1.200:554
> 
> 
> please help me in resolve this issue
> 
> thanks & regards
> sundar
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 



