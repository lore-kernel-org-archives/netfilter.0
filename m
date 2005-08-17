From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtered address in can login
Date: Wed, 17 Aug 2005 00:06:11 -0500
Message-ID: <4302C5C3.4090605@riverviewtech.net>
References: <1124203482.8177.18.camel@localhost>
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
To: netfilter@lists.netfilter.org

The only thing that comes to mind is that 168.79.113.141 might be getting in under the "--state RELATED" rule if you had an outgoing connection to that IP it would possibly be able to get back in.



Grant. . . .

vladimir wrote:
> Hi, I have iptables-1.2.7a and 2.4.26 kernel and there is something
> strange.
> I have the following rule:
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -s 0/0 --protocol tcp --destination-port 80 -j ACCEPT
> iptables -A INPUT -s IP_ADDR  --protocol tcp --destination-port 22  -j
> ACCEPT
> iptables -A INPUT -p tcp --syn -j DROP
> 
> So I expect that only  the specified IP_ADDR can ssh to port 22 in my
> server.
> But in /var/log/secure I see that some other IP's for example
> 168.179.113.141 try to login to ssh  with different user names to my
> server.
> However, then I try ssh to that server not from IP_ADDR I can not, as
> expected.
> Please tell me how this 168.179.113.141 bypass my firewall.
> Thank you very much, 
> Vladimir


