From: Chris Born <ragable@attbi.com>
Subject: RE: Telnet not being let through
Date: Tue, 17 Sep 2002 22:27:01 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.1.6.0.20020917222230.00b3cca8@mail.attbi.com>
References: <771DD65729F96D41B132C6189EE644552FE7BA@sydexch1.cs_au.com.
 au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <771DD65729F96D41B132C6189EE644552FE7BA@sydexch1.cs_au.com.
 au>
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
Content-Transfer-Encoding: 7bit
To: Kevin Saenz <ksaenz@citistreet.com.au>, netfilter@lists.netfilter.org

Thanks, that fixed the problem. I assumed that the rule would only block IP 
spoofing, as the place I got the rule from indicated so. Seemed logical to 
me and not quite sure how a TCP telnet packet would get matched up to that one.

/sbin/iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 0.0.0.0/0 -j 
drop-and-log-it

-Chris Born

At 02:07 PM 9/18/2002 +1000, you wrote:
>I think your problem is that you drop-and-log-it
>before accepting anything substantial. IPTables works
>top down unless your forward to other rules.
>Basically what happens is if the rules don't apply to
>the rules before drop-and-log-it then they are getting logged.
>Usually your very last rule should be drop and log.
>
>Have you tired the Iptables tutorial by Oskar Andersen?
>His examples are very good.



