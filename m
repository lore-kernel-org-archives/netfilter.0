From: Jason Opperisano <opie@817west.com>
Subject: Re: No internet connection
Date: Thu, 09 Sep 2004 12:25:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094747145.15528.21.camel@wolfpack.ljm.dom>
References: <20040909144044.27300.qmail@web50208.mail.yahoo.com>
	<1094742137.14416.3.camel@wolfpack.ljm.dom>
	<20040909160053.GN8419@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040909160053.GN8419@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 12:00, Nick Drage wrote:
> > for the sake of the list archives:
> > 
> >   # DHCP server -> client
> >   iptables -A INPUT -p udp --sport 67 --dport 68 -j ACCEPT
> > 
> >   # DHCP client -> server
> >   iptables -A OUTPUT -p udp --sport 68 --dport 67 -j ACCEPT
> 
> Not wishing to be paranoid, buuuuuuuuutttttttt..... couldn't you
> usefully restrict those by source and destination IP?

i dunno.  assuming you know the IP address of the DHCP server in
advance...it could be this:

   iptables -A OUTPUT -p udp -s 0.0.0.0/32 --sport 68 \
     -d 255.255.255.255/32 --dport 67 -j ACCEPT

   iptables -A OUTPUT -p udp --sport 68 \
     -d $DHCP_SRV --dport 67 -j ACCEPT

   iptables -A INPUT -p udp -s $DHCP_SRV --sport 67 \
     --dport 68 -j ACCEPT

with some scripting, you could programatically add in the IP of the FW
to those rules and re-run the iptables script every time the address
changes...

i guess i was trying to show the building blocks of what it takes to
allow a firewall to be a DHCP client...paranoia is left as an exercise
for the reader...  ;-)

-j

-- 
Jason Opperisano <opie@817west.com>


