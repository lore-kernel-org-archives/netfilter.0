From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: tracking usage by mac address
Date: Mon, 30 Aug 2004 16:12:44 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e50408300612d148797@mail.gmail.com>
References: <41329413.3080407@shaw.ca> <1093865668.2761.6.camel@scaramouche>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093865668.2761.6.camel@scaramouche>
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

You can use ip_conntrack this way

iptables -t nat -A PREROUTING -i $LANIF -s $LANIPCLIENT1 -m mac
--mac-source $CLIENT1_MAC_ADDRESS -j ACCEPT
iptables -t nat -A PREROUTING -i $LANIF -s $LANIPCLIENT2 -m mac
--mac-source $CLIENT2_MAC_ADDRESS -j ACCEPT
......
iptables -t nat -A PREROUTING -i $LANIF -j DROP

Then

iptables -A FORWARD -s $LANIPCLIENT1 -i $LANIF -o $INETIF #upload
iptables -A FORWARD -d $LANIPCLIENT1 -d $LANIF -o $INETIF #download

and to see the traffic, use
iptables -L FORWARD -nv
and look for those 2 rules. You can add a -j LOG target, or whatever.
This way you will see the client's download based on his mac, because
you allow beginning streams only with those macs

On Mon, 30 Aug 2004 13:34:58 +0200, Torsten Luettgert
<t.luettgert@pressestimmen.de> wrote:
> On Mon, 2004-08-30 at 04:42, Henry Baxter wrote:
> > Ultimately I am hoping to track the bandwidth usage of about 50 client
> > computers through my router based on their MAC address. I understand
> > that by simply writing a rule that does nothing to the packet, such as
> > 'iptables -A FORWARD -m <mac address>' I can parse the netfilter log and
> > find out what I need. This seems rather convoluted though - getting
> > netfilter to create a basically human readable log file, and then
> > parsing it.
> 
> You could also use ULOG and the ulog-acctd from
> http://alioth.debian.org/projects/pkg-ulog-acctd/
> 
> (if you want to use this on RedHat/Fedora, I could send you my RPM
> I made from it)
> 
> This also generates a somewhat user-readable log file which you'd need
> to parse, but it can aggregate several packets (thus reducing the size
> of the log file) and generate a Cisco-compatible traffic log file.
> Parsers for that should not be hard to find.
> 
> Greetings,
> Torsten
> 
> 


-- 
Bla bla

