From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 16:08:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064243316.6070.85.camel@angua.localnet>
References: <1063985328.28941.37.camel@angua.localnet>
	 <1064084662.28506.42.camel@tux.rsn.bth.se>
	 <1064224385.6070.8.camel@angua.localnet>
	 <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se>
	 <1064242324.6070.77.camel@angua.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064242324.6070.77.camel@angua.localnet>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-09-22 at 15:52, Nigel Metheringham wrote:
> On Mon, 2003-09-22 at 13:00, Martin Josefsson wrote:
> > Could you please apply the attached patch and reproduce it again?
> > It's just a small patch that enables a little debugging for this.
> 
> Very odd - I am seeing ICMPs generated:-
> # /usr/sbin/tcpdump -n -i eth0 icmp
> tcpdump: listening on eth0
> 15:26:12.146557 192.168.50.119 > 172.16.28.33: icmp: 10.0.2.2
> unreachable - need to frag (mtu 1450) [tos 0xc0]
> 
> but no extra chatter in dmesg despite ensuring dmesg -n is turned up. 
> Checking the module object file shows the extra log messages in there,
> so its not me doing something completely silly.
> 
> Putting a 
>   iptables -t mangle -A FORWARD -p tcp --syn -j TCPMSS \
> 	--clamp-mss-to-pmtu
> 
> in appears to fix things for me.

Took a closer look.
If I put that mangle rule in then:-
      * I see no ICMP packets on the wire between the originating box
        and the linux g/w (tested in 2 places to make sure I don't have
        any packet sniffing/netfilter interactions).  Previously I saw
        ICMP need frag packets as quoted above
      * those icmp_reply log messages appear to fire on each and every
        packet

   icmp_reply: outer SRC -> 192.168.50.119
   icmp_reply: inner DST -> 192.168.50.119 1500

	Nigel.

-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


