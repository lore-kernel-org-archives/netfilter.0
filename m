From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: captive web system using DNAT and SNAT
Date: Thu, 05 May 2005 21:27:41 -0500
Message-ID: <427AD61D.2050709@riverviewtech.net>
References: <1115323918.21170.65.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115323918.21170.65.camel@localhost.localdomain>
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

> # catch all redirects to registration server
> iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
> --to-destination ${REGISTRATION_SERVER}
> 
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
> --to-source ${EXTERNAL_ADDRESS}
> 
> iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
> --to-destination ${REGISTRATION_SERVER}
> 
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
> --to-source ${EXTERNAL_ADDRESS}

Did you mean to post the same rules twice?  Or am I really just missing something?

> what i want to do is if i type in ${REGISTRATION_SERVER} in my address
> bar on the client system, then i dont want the firewall to do any DNAT
> or SNAT. what is the best way to accomplish this?

Try changing your DNAT rule to be like the following:

iptables -t nat -A PREROUTING -i eth1 -p tcp -d ! ${REGISTRATION_SERVER} -dport 80 -j DNAT --to-destination ${REGISTRATION_SERVER}

As this will DNAT any traffic that is not going to your ${REGISTRATION_SERVER} directly.



Grant. . . .

