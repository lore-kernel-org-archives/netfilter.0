From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: 1:1 NAT
Date: 22 Jan 2003 08:02:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043218930.657.77.camel@tux.rsn.bth.se>
References: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
	 <1043212908.1541.67.camel@rayw.knowledgefactory.co.za>
	 <1043217751.668.75.camel@tux.rsn.bth.se>
	 <1043218220.1543.78.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043218220.1543.78.camel@rayw.knowledgefactory.co.za>
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
To: raymondl@knowledgefactory.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2003-01-22 at 07:50, Raymond Leach wrote:
> On Wed, 2003-01-22 at 08:42, Martin Josefsson wrote:
> > On Wed, 2003-01-22 at 06:21, Raymond Leach wrote:
> > > There is a patch-o-matic patch called SAME which does 1:1 NAT.
> > > 
> > > iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j SAME
> > > 196.4.160.0/24
> > 
> > No it doesn't.
> > 
> > you are thinking of NETMAP not SAME.
> OK. Sorry ... what does SAME do?

It makes sure a client always gets the same ipaddress after NAT. No
loadbalancing like SNAT.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

