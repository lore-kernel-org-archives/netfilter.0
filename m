From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: SMTP HTTP port allow
Date: Wed, 27 Aug 2003 09:13:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4CAE84.9010808@Loudoun-Fairfax.com>
References: <20030827065256.47173.qmail@web20708.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030827065256.47173.qmail@web20708.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


ads nat wrote:

> I am implimenting iptables for first time.
> I want to allow all my LAN users to send emails to SMTP (port no. 
> 25) all destination with following code. :
>  
> ***
> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> ***

That looks fine. If you want to test a specific rule, replace ACCEPT 
with LOG and test it. Use --log-prefix to identify these entries. In 
your case:

iptables -A FORWARD -p tcp --dport 25 -j LOG --log-prefix 
"dport_25_packet: "

>  
> I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to 
> upload contents to webserver on ip 207.106.22.35 (outside of LAN) with 
> following code.
>  
> ***
> iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d 
> 207.106.22.35 --dport 80 -j ACCEPT
> ***
>  
> I would loke know whether It works or not.
> Tell me whether my code is O.K. also where can i check logs.

iptables uses the kernel system log. In my Redhat system that can be 
found as /var/log/messages.

> Thanks
> ------------------------------------------------------------------------
> Do you Yahoo!?
> Yahoo! SiteBuilder 
> <http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com> - 
> Free, easy-to-use web site design software 



