From: "Ray Anderson" <rsa@prideindustries.com>
Subject: RE: Forwarding HTTP question
Date: Sat, 5 Jul 2003 06:43:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c342fb$5b45c730$fb09a8c0@viper11>
References: <1057382564.2822.22.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1057382564.2822.22.camel@alpha.newkirk.us>
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
To: 'Joel Newkirk' <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

And don't forget to ALLOW the packets in the first place.  Made me crazy the
first time I did that....Put in the FORWARD rule, but no ACCEPT rule.  

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport   80 -j allowed
#HTTP

-=Ray

-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us] 
Sent: Friday, July 04, 2003 10:23 PM
To: Guilherme Viebig
Cc: *netfilter
Subject: Re: Forwarding HTTP question


On Fri, 2003-07-04 at 09:41, Guilherme Viebig wrote:
> My Firewall has two interfaces
> 
> eth0 200.123.234.111
> eth1 192.168.0.1
> 
> I have an internal webserver on 192.168.0.33
> 
> How can I setup iptables to forward incoming traffic by eth0 to port
80 go
> to 192.168.0.33:80 ?

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to
192.168.0.33

j



