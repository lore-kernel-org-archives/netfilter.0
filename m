From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Wed, 1 Dec 2004 20:00:48 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412011956430.22471-100000@gollum.grajagan.net>
References: <1101959160.22517.20.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101959160.22517.20.camel@hubcap.ljm.dom>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 1 Dec 2004 at 22:46 -0500, Jason Opperisano wrote:

JO> > no such luck :(. I should note that the VPN connections works fine when I 
JO> > hook the client up directly to my DSL line. btw - it looks like your 
JO> > script does not forward anything from one of my interfaces to the other.
JO> 
JO> yeah--precisely.  you seem obsessed with the desire to "port forward"
JO> esp traffic to your VPN client, which is absolutely not necessary.
JO> 
JO> look into configuring NAT-T with your VPN client, sometimes called "UDP
JO> Encapsulation" as your VPN server appears unwilling to accept esp
JO> packets that have traversed an intermediate NAT device.

hmm... how does a packet know it needs to go from my external NIC to my 
internal NIC if it comes through ESP? Maybe I am confused here... 

let's leave the VPN client/server out of the picture to simplify. If I 
send an ESP packet from somewhere to my external IP address I get the 
"protocol 50 unreachable" ICMP response. The underlying problem seems to 
be the primary cause of my troubles, no?

h.


