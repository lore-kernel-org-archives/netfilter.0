From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: chance to impress the suits
Date: Thu, 27 Feb 2003 13:48:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030227134810.7728c8d5.arnt@c2i.net>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
	<200302270201.04762.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302270201.04762.netfilter@newkirk.us>
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

On Thu, 27 Feb 2003 02:01:04 -0500, 
Joel Newkirk <netfilter@newkirk.us> wrote in message 
<200302270201.04762.netfilter@newkirk.us>:

> On Wednesday 26 February 2003 06:57 pm, Jason wrote:
> >
> > iptables -A FORWARD -p tcp -i lan -m state --state NEW -m iplimit
> > --iplimit-above 1 -j REJECT

..<snip>

> Definitely the FORWARD chain, OUTPUT is for connections from the 
> firewalling box itself.  Make sure this appears before any ACCEPT
> rules in your FORWARD chain, too.  Have you tried:
> 
> iptables -A FORWARD -i eth0 -p tcp --syn --dport 80 -m iplimit 
> --iplimit-above 500 -j REJECT
> 
> This is almost precisely the format of the example rule for iplimit...
> I noticed you used "-i lan" above - is that a typo?  You have to
> specify a valid interface name, which my version presumes is eth0 for
> traffic from the LAN.
> 

.." -i $lan "?  AFAICT, above rule is valid if "lan" is a substitute
for an ip address etc, for a variable, you will want to declare it, 
some people like CAPS, for, say, " -i $LAN ", YMMV.

..you don't mention _why_ your suits want this.  Using un-throttled
802.11 links with some _cheap_ routers that rebooted! every time 
they got 256 simultaneous connections for a client, I started with 
throttling, then capping connections, and ended up wrapping all his
isp clients in vpn/poptop tunnels.  Poptop, because some people 
still runs Wintendo 95, and my client like this business too.  

..yup, my first client is an isp.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


