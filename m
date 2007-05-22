From: Robert LeBlanc <robert@leblancnet.us>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 12:39:16 -0600
Message-ID: <C27894F4.1C28B%robert@leblancnet.us>
References: <465336C4.5060600@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465336C4.5060600@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 5/22/07 12:30 PM, "Grant Taylor" <gtaylor@riverviewtech.net> wrote:

> On 05/22/07 12:07, Robert LeBlanc wrote:
>> Thanks, I wasn't aware of this option as I haven't done much with
>> bridging since I had lots of trouble with trying to bridge and NAT on
>> the same network (use allow the same physical network after my linux
>> gateway to carry my public network and the NATed private network). I
>> will have to look into it again, this option may have been a cause of
>> some of my issues.
> 
> *nod*  Bridging Routers can be interesting critters to work with.
> 
> Brouters are usually used to allow globally routable systems IP
> addresses to be used in front of and behind a firewall (of sorts).  I.e.
> a small block of IP addresses that the brouter uses for its external IP
> address as well as internal public servers use IP addresses from to be
> directly accessible from the net with out any sort of NAT.
> 
> (INet) --- (Cable / DSL modem) --- (BRouter) --- (Server(s)
>                                               --- (Workstation(s))
> 
> To pull this off usually you bridge the internal and external NICs
> together and multi home the bridge interface for your internal and
> external IP addresses.  I.e. bri0 = A.B.C.D and bri0:1 = 192.168.144.254
> are your IP addresses.
> 
> In this case, you only bridge traffic to / from the A.B.C.x network and
> route any thing else.  You can even serve DHCP on the internal LAN with
> out a problem.
> 
> In this scenario, you can use either EBTables or IPTables to do your
> filtering.  The only thing you need to remember is to not bridge (DROP
> in the brouting table / BROUTE chain) any internal traffic and force it
> to be routed.  Another way to say it is to only bridge traffic to / from
> your globally routable IP addresses.  Remember that you will need to
> pass some ARP traffic too.
> 
> 
> 
> 
> Grant. . . .
> 

That is what I did, I think there was a slight mis-configuration and my NAT
was dropping traffic like crazy. It would only happen after a period of time
though, no error messages that I could see. I had three separate internal
nets and the 192.168.1.x would not work, but 192.168.2.x would more then the
other one. I never did try out 192.168.3.x because I had so many issues with
the first two. I'll have to look into it again someday. I just moved my
servers out in front of my gateway for the time being.

 
Robert LeBlanc
BioAg Computer Support
Brigham Young University
leblanc@byu.edu
(801)422-1882



