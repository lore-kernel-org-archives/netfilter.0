From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables: hide the real web server from users
Date: Wed, 14 Feb 2007 11:59:29 -0600
Message-ID: <45D34E01.8050900@riverviewtech.net>
References: <533163.22377.qm@web33303.mail.mud.yahoo.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <533163.22377.qm@web33303.mail.mud.yahoo.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Tim Perton wrote:
> Dear Grant,
> thank you very much for your quick reply.

You are welcome.

> I agree to the 3 conditions/caveats in your previous
> email. I have already tried an example on this.
> Let's say I want to connect to www.google.com
> (216.239.59.103) so System B is www.google.com

Ok.

> According to your example I issue the following
> commands (after stop/start iptables to be fresh):
> 
> iptables -A INPUT -p tcp -m tcp --dport 1099 -j ACCEPT

What filtering do you have in place?  If you do not have default 
policies of ACCEPT, you will also need to add rules to your 
filter:FORWARD chain to allow this traffic to pass through.  I.e.

iptables -A FORWARD -i eth0 -o eth0 -d 216.239.59.103 -p tcp --dport 80 
-j ACCEPT

iptables -A FORWARD -i eth0 -o eth0 -s 216.239.59.103 -p tcp --sport 80 
-j ACCEPT

> iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p
> tcp --dport 1099 -j DNAT --to-destination
> 216.239.59.103:80
> 
> iptables -t nat -A POSTROUTING -o eth0 -d
> 216.239.59.103 -p tcp --dport 1099 -j SNAT --to-source
> a.b.c.d

These commands look ok to me.

> I am trying http://a.b.c.d:1099  or with telnet
> a.b.c.d 1099 (Trying a.b.c.d... telnet: Unable to
> connect to remote host: Connection refused)

I think you will have better luck playing with telnet to start with. 
Keep in mind that just because you enter "http://a.b.c.d..." in your web 
browser, you are doing more than connecting to that address.  You are 
also asking for a page off of the domain a.b.c.d.  So for testing, I'd 
stick with telnet, or set up a temporary hosts entry for the test domain.



Grant. . . .

