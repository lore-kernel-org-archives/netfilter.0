From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: PPTP port forwarding
Date: Thu, 19 Feb 2004 12:04:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191204.57391.Antony@Soft-Solutions.co.uk>
References: <4034A3CF.20307@able.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4034A3CF.20307@able.be>
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

On Thursday 19 February 2004 11:53 am, Wim Ceulemans wrote:

> Hi
>
> We have noticed a problem with PPTP forwarding not working as it should.
>
> We have a system on kernel 2.4.24 with latest pom and iptables 1.2.9.
> There is a port forwarding PPTP to a windows 2000 server behind the
> firewall.
>
> We noticed that when someone connects with PPTP the connection is closed
> after 3 to 4 minutes. This problem only occurs if there is a router in
> nat mode between the firewall and the internet. If the public ip is on
> the firewall then this problem does not occur.

You cannot operate PPTP across a NATted connection without a special helper 
module (hence your need for pom as stated above).

If the other nat-mode router does not have a suitable helper for PPTP then you 
can't use this combination.

Regards,

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


