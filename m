From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: Connections and connlimit problem,
Date: Mon, 5 Apr 2004 20:10:59 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040406031059.31775.qmail@web14007.mail.yahoo.com>
References: <1278290250.20040405114706@fnet.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1278290250.20040405114706@fnet.pl>
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
Content-Transfer-Encoding: 7bit
To: nexor@fnet.pl, netfilter@lists.netfilter.org

--- nexor@fnet.pl wrote:
> cat
>
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
> 
> returns value:
>  432000
> 
> Isn't that too much ?

  Too much or too less really depends upon your
specific scenario. For this purpose you are provided
with sysctls to alter the various timeouts.
Specifically
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established


=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! Small Business $15K Web Design Giveaway 
http://promotions.yahoo.com/design_giveaway/

