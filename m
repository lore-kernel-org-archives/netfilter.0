From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Mon, 9 Aug 2004 11:55:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091155.10375.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408090932.13099.Antony@Soft-Solutions.co.uk> <20040809103942.GA15462@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809103942.GA15462@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Monday 09 August 2004 11:39 am, Payal Rathod wrote:

> On Mon, Aug 09, 2004 at 09:32:13AM +0100, Antony Stone wrote:
> > I think you should specify the output interface in your MASQUERADE rules,
> > so that only packets going out of the Internet interface get SNATted -
> > otherwise packets going between your internal LAN and the DMZ are going
> > to get SNATted too, which is not really what you want.
>
> Does this look OK?
>
> -A POSTROUTING -s 192.168.0.0/255.255.0.0 -o eth2 -j MASQUERADE
> -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth2 -j MASQUERADE

Yes (so long as eth2 is your external interace :)

> > This may be because you say you have a Squid proxy running on the
> > firewall itself.   If you were just doing standard HTTP, the ruleset you
> > have posted looks like you should have access to TCP dport 80 on the DMZ
> > from the LAN.
>
> Yes I do have squid running on firewall machine itself.
>
> > What URL are you using to access the mail server from the LAN?
>
> Direct IP. http://<public Ip>/mail

That is the problem then.

Squid is trying to connect to a public IP on the same box as Squid is running 
on, but that IP should be DNATted to a private IP somewhere else.

DNAT in PREROUTING only works for packets being routed through the machine.   
Squid is a local process sending packets out through OUTPUT, therefore you 
need to DNAT in the OUTPUT nat table to let Squid connect to this address.

> > There is a default ACCEPT policy, there are also some ACCEPT rules (and
> > no DROP rules), and the -m state rule is included twice....
>
> People here suggested to me that default ACCEPT policy was OK.

Yes.   I wasn't saying default ACCEPT is wrong - I was simply saying that if 
you have a default ACCEPT, there's no point in having extra ACCEPT rules with 
no DROP rules (so the only thing that can possibly happen to any packet is to 
be ACCEPTed).

A simple ruleset is easier to understand and easier to maintain, so don't put 
in rules which will never do anything useful.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


