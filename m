From: "Sven Bolt" <sven_bolt@fastmail.fm>
Subject: Re: AW: Some webpages inaccessible through IPTables
Date: Sat, 08 Feb 2003 10:15:04 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030208181504.86BBB1900A@www.fastmail.fm>
References: <NFBBLIMCOLBEDAIPJPDMCEBLCHAA.alex@aiesec.uni-rostock.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <NFBBLIMCOLBEDAIPJPDMCEBLCHAA.alex@aiesec.uni-rostock.de>
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
To: Alexander Noack <alex@aiesec.wiwi.uni-rostock.de>, Netfilter List <netfilter@lists.netfilter.org>

Hey great
it now, although kind of slow on these pages, works. Thanks alot.
Any recommendet readings on that MTU-stuff?


On Sat, 8 Feb 2003 17:06:57 +0100, "Alexander Noack"
<alex@aiesec.wiwi.uni-rostock.de> said:
> Hi Sven,
> 
> > The sites are accessible from the gateway itself so it's
> > not an MTU issue. What else could it be?
> 
> Well then it IS most likely an MTU issue
> 
> > I use an iptables-gateway 1.2.6a on debian with
> > kernel 2.4.18 with just
> >
> > echo 1 > /proc/.../ip_forward
> > and iptables --table at -A POSTROUTING -j MASQUERADE
> 
> put a line like
> 
> iptables -I FORWARD -p tcp -d ! $your_internal_net --tcp-flags SYN,RST
> SYN -j TCPMSS --clamp-mss-to-pmtu
> 
> in your forward chain (you need to have that TCPMSS target compiled in
> your kernel).
> You could also go and change the MTU on each client...
> 
> Ciao,
> Alex
> 
> 
-- 
  Sven Bolt
  sven_bolt@fastmail.fm

-- 
http://fastmail.fm - I mean, what is it about a decent email service?

