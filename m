From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: client on local network
Date: Sun, 28 Mar 2004 12:13:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403281213.26394.Antony@Soft-Solutions.co.uk>
References: <web-269324379@mail01.infosat.net> <200403281202.54896.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403281202.54896.Antony@Soft-Solutions.co.uk>
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

On Sunday 28 March 2004 12:02 pm, Antony Stone wrote:

> On Sunday 28 March 2004 11:49 am, IT Clown wrote:
> > Hi
> >
> > I have just finished reading netfilter howto and im just
> > over halfway with Oskar Andreasson's tutorial.Here is my
> > rule again does this look correct?
>
> You should be using the "-m state --state ESTABLISHED,RELATED" match in
> your INPUT chain to allow in replies to packets which went out, but not to
> allow new connections from outside (especially to any service on the
> firewall).
>
> See Chapter 4 of Oskar's tutorial.

Here is an example, to allow browsing *from* the local machine, but no access 
from anywhere else *to* the local machine.

# Set default DROP policies
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow out the packets we want
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT

# Allow the replies back in again
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Done.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


