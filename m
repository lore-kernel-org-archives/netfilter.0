From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 1 May 2004 19:05:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405011905.30495.Antony@Soft-Solutions.co.uk>
References: <409310DE.2020004@isoar.ca> <200405010819.30079.Antony@Soft-Solutions.co.uk> <4093E190.8020308@isoar.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4093E190.8020308@isoar.ca>
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

On Saturday 01 May 2004 6:42 pm, Andrew E. Mileski wrote:

> Antony Stone wrote:
> > On Saturday 01 May 2004 3:52 am, Andrew E. Mileski wrote:
> >>I'm observing lost packets when a gateway doing NAT also locally hosts
> >>a server for DNS or NTP.  I believe this the result of the ambiguous
> >>conditions that can exist when routing server-to-server packets coming
> >>into the gateway.
> >
> > Show us your rules and explain what is ambiguous about them?
>
> There is only one rule needed if all other defaults are ACCEPT:
>
> This one is on my network:
> iptables -t nat -A POSTROUTING -s ! $WAN_IP -o $WAN_IFC -j SNAT
> --to-source $WAN_IP

What is $WAN_IP, and what are the IP addresses on the machine on which this 
rule is running?

I still don't really understand why you need a SNAT rule on a machine which is 
running the service locally?

Please give a clear explanation of where the client is, where the server is, 
and why you want a SNAT rule in the system.   Also, please explain what is 
"ambiguous" about all this, as you described it - I don't understand what you 
mean by that in this context.

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


