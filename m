From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: 'Lending an internet connection'
Date: Mon, 30 Sep 2002 14:48:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209301348.g8UDmAL04089@vulcan.rissington.net>
References: <20020928191437.NJRG6699.mta01-svc.ntlworld.com@there> <55436.64.86.49.17.1033325579.squirrel@www.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <55436.64.86.49.17.1033325579.squirrel@www.icafe.co.tz>
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

On Sunday 29 September 2002 7:52 pm, Mitesh P Choksi wrote:

> Alternatively, use proxy arp on eth0 for the public IP and then put a host
> route on the eth1.
>
> eth0 will take up all ethernet packets due to the proxy arp.
> routing table will route the packets to eth1 and subsequently to win
> machine.
>
> proxy-arp howto and bridging howto could be answers to your setup.

That would allow him to forward *all* packets through the Linux machine to 
the Windows machine, but he wants to keep TCP port 22, 25 and 80 on the Linux 
machine....

How would he keep those protocols on the Linux box and send everything else 
through to the Windows box ?

How would the Linux box be able to reply to the external clients ?   What 
'real' IP address would he use on eth0, alongside the proxy arp for the 
public IP we're talking about ?

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

