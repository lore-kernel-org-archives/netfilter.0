From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT question
Date: Fri, 11 Mar 2005 10:46:36 -0500
Message-ID: <1110555996.4767.30.camel@hubcap.ljm.dom>
References: <200503111541.j2BFfAK8006512@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503111541.j2BFfAK8006512@mail1.firstbhph.com>
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

On Fri, 2005-03-11 at 10:41, Dimitri Yioulos wrote:
> Sorry for any confusion I may be causing.  Here's a little more info.:
> 
> I've aliased my Web and mail server public addresses to eth0:0 and eth0:1
> (eth0 being the external interface).  I think I've read that this isn't the
> optimal set-up, but it does work.  That shouldn't matter, should it?
> 
> The key here may be in omitting a NAT postrouting rule (sorry if the
> terminology is incorrect).  Here's what I have:
> 
> IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 80 \
> -j DNAT --to-destination $DMZ_HTTP_IP
> IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_IP --dport 25 \
> -j DNAT --to-destination $DMZ_SMTP_IP
> IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SMTP_IP --dport 25 \
> -j DNAT --to-destination $DMZ_SMTP_IP
> IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_IP --dport \
> 110 -j DNAT --to-destination $DMZ_SMTP_IP
> IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SMTP_IP --dport \
> 110 -j DNAT --to-destination $DMZ_SMTP_IP
> IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
> 
> in that order.  I will change the last rule to include -s $INSIDE_NET.  I
> also notice that I don't have the outbound one-to-one NAT for web or mail
> servers. So, if I add: 
> 
> IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s $WEB_SRV_PRIV_IP \
> -j SNAT --to-source $WEB_SRV_PUB_IP 
> 
> and
> 
> IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s $MAIL_SRV_PRIV_IP \
> -j SNAT --to-source $MAIL_SRV_PUB_IP
> 
> just after the outbound many-to-one NAT for inside net as above, will I be
> good?

yes.

> Thanks so much for your time.

no prob.

-j

--
"It takes two to lie. One to lie and one to listen."
	--The Simpsons


