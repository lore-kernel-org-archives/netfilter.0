From: Jason Opperisano <opie@817west.com>
Subject: Re: Network number getting mangled
Date: Tue, 1 Mar 2005 17:05:00 -0500
Message-ID: <20050301220459.GA31857@bender.817west.com>
References: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Mar 01, 2005 at 04:47:25PM -0500, Daniel J. Brennan wrote:
> Hello Netfilter,
> 
> I have a Fedora Core 1.0 linux box (iptables-1.2.9-1.0) NATing traffic
> from a private network onto a valid public network. The private network
> IP address space essentially mirrors the public IP address space. For
> example the public space is XX.XX.168.0/18, hence the private space
> looks like 10.0.168.0/18. 
> 
> The problem I have is related to the netmask value. The netmask /18 is
> actually mangling the third octet of the network number. For example if
> I append a rule:
> 
> 	iptables -A INPUT -i eth0 -p icmp -s 10.0.168.0/18 -j ACCEPT
> 
> A listing of the INPUT Chain shows the corresponding rule with the
> network as 10.0.128.0/18. This doesn't seem to occur if the netmask is
> /22. If I set the netmask to /20 the network number then looks like
> 10.0.160.0/20. I have no idea how this can happen. Is this a bug or am I
> misconfiguring something. The pertinent portions of the configuration
> are included below along with the output from "iptables -L -v"

mangling?  um--no...  the iptables command is nice enough to correct
your poor math for you: 10.0.168.0/18 is nonsense--the network ID for
10.0.168.0/18 is: 10.0.128.0 (the broadcast being 10.0.191.255).

just as if i typed in 10.25.25.25/24 it would correct my incoherence to:
10.25.25.0/24

your example of 10.0.168.0/22, actually does define a network
ID--10.0.168.0 - 10.0.171.255

as to what value you actually want--i have no idea.

say what you mean and mean what you say.

-j

--
"You heard me, I won't be in for the rest of the week... I told you,
 my baby beat me up... oh it is not the worst excuse I ever thought up."
        --The Simpsons

