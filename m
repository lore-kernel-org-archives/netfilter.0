From: Nikolai Alexandrov <voyager123bg@gmail.com>
Subject: Re: Filtered address in can login
Date: Tue, 16 Aug 2005 20:34:59 +0300
Message-ID: <430223C3.1090509@gmail.com>
References: <1124203482.8177.18.camel@localhost>
Reply-To: voyager123bg@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1124203482.8177.18.camel@localhost>
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
To: vladimir@fetchbook.info
Cc: netfilter@lists.netfilter.org

Are you sure your default POLICIES are ok? I mean...
do you have somewhere:
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
... your script ...
iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

You should also consider adding rules for the DNS to work.


vladimir wrote:

>Hi, I have iptables-1.2.7a and 2.4.26 kernel and there is something
>strange.
>I have the following rule:
>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A INPUT -s 0/0 --protocol tcp --destination-port 80 -j ACCEPT
>iptables -A INPUT -s IP_ADDR  --protocol tcp --destination-port 22  -j
>ACCEPT
>iptables -A INPUT -p tcp --syn -j DROP
>
>So I expect that only  the specified IP_ADDR can ssh to port 22 in my
>server.
>But in /var/log/secure I see that some other IP's for example
>168.179.113.141 try to login to ssh  with different user names to my
>server.
>However, then I try ssh to that server not from IP_ADDR I can not, as
>expected.
>Please tell me how this 168.179.113.141 bypass my firewall.
>Thank you very much, 
>Vladimir
>  
>

