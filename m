From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Anyone using DNAT on the OUTPUT chain?
Date: Mon, 10 Jun 2002 15:25:59 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101426.g5AEQ7U08597@vulcan.rissington.net>
References: <BC6421B0F2CC4C43897842092E0E00A94C14A1@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <BC6421B0F2CC4C43897842092E0E00A94C14A1@TX1EX1NT.dyncorp.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Monday 10 June 2002 3:11 pm, Kellogg, Chris wrote:

> ACK!  Talk about a serious brain cramp - I completely forgot that the
> OUTPUT chain is for outbound connections sourced from the NetFilter box.

You've used IPchains before, haven't you :-) ?

> Any ideas on alternative methods to do what I'm trying to do?

Nope - sounds like a sensible way of doing it to me - so long as you get the 
names of the chains right :-)

I think you want to put rules in your PREROUTING chain to ACCEPT packets 
addressed to the machines you want to allow access to, followed by a DNAT 
rule to redirect anything else to your "Acceptable Usage Policy" webserver.

Then you need rules in your FORWARD chain to allow access to those specific 
machines, including the AUP webserver, and not allow anything else that 
somehow tries to sneak past.

You shouldn't need anything at all referring to http in your INPUT or OUTPUT 
chains to make this work - just the usual stuff for ICMP, DNS, SSH for admin, 
etc.

The other way you could do this is with a transparent proxy server, of 
course, but if you've got a small enough list of webservers you're allowing 
people access to, I don't think that's necessary.

 

Antony

