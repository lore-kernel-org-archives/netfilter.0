From: Jason Opperisano <opie@817west.com>
Subject: Re: clampmss only partially working on 2.6 kernelmode pppoe?
Date: Sat, 12 Feb 2005 09:08:41 -0500
Message-ID: <1108217321.4462.34.camel@hubcap.ljm.dom>
References: <afcf620205021122413dd5dd6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <afcf620205021122413dd5dd6d@mail.gmail.com>
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

On Sat, 2005-02-12 at 01:41, Joris wrote:
> Hi,
> 
> 
> I have linux 2.6.11-rc2 masquerading a pppoe connection (mtu: 1492)
> trough the kernel mode pppoe implementation.
> 
> I loaded the ipt_tcpmss and ipt_TCPMSS (what's the difference?) kernel
> modules, and have the following iptables rule running:
> iptables -I FORWARD -o ppp0 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
> --clamp-mss-to-pmtu
> 
> Most internet hosts seem to be ok, but (don't laugh, it's for a family
> member's fade-out only!) hotmail still is a pita. (to be specific:
> after logging in, the inbox page served by
> by18fd.bay18.hotmail.msn.com never gets trough). Some hotmail submit
> 
> 
> Has someone experienced something similar?
> 
> Is there a more precise test method (eg, sending a packet of a certain
> size to a certain host or something, or is there something specific I
> could look for in a network dump?)

tcpdump the external interface of the firewall for icmp type 3 code 4
packets.

keep in mind that "--clamp-mss-to-pmtu" relies on the fact that PMTU
discovery works along the path of your communication--this is not always
a valid assumption these days.

-j

--
"Okay, retrace your steps. Woke up, fought with Marge, ate Guatemalan
 insanity peppers, then I... Oh..."
	--The Simpsons


