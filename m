From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 16:21:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181621.51556.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC657@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC657@csrees-exchsrvb.csrees.usda.gov>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 18 February 2004 4:07 pm, Martinez, Michael wrote:

> Antony,
>
> Being an iptables newbie ... How would I log all rejected packets?

Just before the line which says 

iptables -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited

you insert one which says

iptables -A RH-Firewall-1-INPUT -j LOG

If you want to be a bit sophisticated about it:

iptables -A RH-Firewall-1-INPUT -j LOG --log-level=info --log-prefix="Reject:"

That way, the logs will go to /var/log/messages and will have "Reject:" in 
them so you can easily identify what they mean.

Regards,

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


