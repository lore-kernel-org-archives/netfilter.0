From: David Cannings <lists@edeca.net>
Subject: Re: transparent proxy
Date: Wed, 17 Mar 2004 14:21:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403171421.12463.lists@edeca.net>
References: <3C204966522884458700FF59D6EFB87A01CAFE@FORUS01.netpower.lan>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3C204966522884458700FF59D6EFB87A01CAFE@FORUS01.netpower.lan>
Content-Disposition: inline
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

On Wednesday 17 March 2004 12:33, Fredrik Emil Jensen wrote:
> Thank you Antony, finally it's working for me.  I have another question
> for the list; is it possible to use iptables to redirect any request on
> port 80 to a specific web address?
>
> I know you can use the rule, iptables -t nat -A PREROUTING -p tcp -s
> 192.168.1.0/24 -d 0/0 --dport 80 -j DNAT --to ip.address.xx.xx:80
>
> But my problem occurs when you have many different subnets and you want
> subnet1 to be redirected to http://test.domain.com/site1, subnet2 to be
> redirected to http://test.domain.com/site2 etc.
>
> Does anyone have any suggestions on how to do this with iptables, is it
> possible? Or do I still need to use squid and squidGuard!

That's application level, the request is inside the HTTP packet (which is 
inside the TCP packet, which is inside the IP packet, etc).  iptables 
cannot do this, you would have to use a proxy such as Apache or Squid.

David

