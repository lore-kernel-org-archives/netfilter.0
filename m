From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sat, 21 Sep 2002 08:25:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0a3801c26172$51f71af0$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Oskar Andreasson <blueflux@koffein.net>, Andrei Ivanov <andrei.ivanov@ines.ro>
Cc: netfilter@lists.netfilter.org

> On Fri, 20 Sep 2002, Andrei Ivanov wrote:
> 
> > 
> > What amazes me is that iptables doesn't know to match packets by a tos 
> > value other then the ones in ip.h... this really SUCKS.
....that appears to be a "political policy" slipped into the software...

There are 160 bits in the IPv4 header, all can be considered for routing purposes.
Some of those bits are more useful than others, especially those controlled via the DNS.

128-bit DNS AAAA Record Flag Day Formats
2002:[IPv4]:[SDLL.OFFF.FFFF.TTTT]:[64-bit IPv8 or IPv16 Persistent Address]
[YMDD]:[IPv4]:[SDLL.OFFF.FFFF.TTTT]:[64-bit IPv8 or IPv16 Persistent Address]
1-bit to set the Reserved ("Spare") bit in Fragment Offset [S]
1-bit to set the Don't Fragment (DF) bit [D]
2-bits to select 1 of 4 common TTL values (255, 128, 32, 8) [LL]
1-bit for Options Control [O]
7-bits to set the Identification Field(dst) [FFFFFFF]
4-bits to set the TOS(dst) Field [TTTT]
Default SDLL.OFFF.FFFF.TTTT = 0000.0000.0000.0000
FFF.FFFF.TTTT = GGG.SSSS.SSSS
http://www.ntia.doc.gov/ntiahome/domainname/130dftmail/unir.txt


Jim Fleming
2002:[IPv4]:000X:03DB:...IPv8 is closer than you think...IPv16 is even closer...
http://www.netfilter.org/
http://www.analogx.com/contents/dnsdig.htm
http://ipv8.dyndns.tv
http://ipv8.yi.org
http://ipv8.dyns.cx
http://ipv8.no-ip.com
http://ipv8.no-ip.org
http://ipv8.no-ip.biz
http://ipv8.no-ip.info
http://ipv8.myip.us
http://ipv8.dyn.ee
http://ipv8.community.net.au
http://ipv8.ods.org

----- Original Message ----- 
From: "Oskar Andreasson" <blueflux@koffein.net>
To: "Andrei Ivanov" <andrei.ivanov@ines.ro>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, September 20, 2002 2:46 PM
Subject: RE: Iptables bandwidth limit


> 
> First of all, the limitation was created since you should not use other 
> TOS values than specified in the RFC's. You may get extremely strange 
> problems if you start doing random TOS matches on packets. 
> 
> Anyways, iptables _is_ actually able to do irregular TOS matching with the
> ftos patch applied to the kernel (I _think_ it may still be in
> patch-o-matic, but I don't know for sure). It should also be available 
> somewhere on the www.paktronix.com site.
> 
> Have a nice day,
> 
> 
> 
> On Fri, 20 Sep 2002, Andrei Ivanov wrote:
> 
> > 
> > What amazes me is that iptables doesn't know to match packets by a tos 
> > value other then the ones in ip.h... this really SUCKS.
> > 
> > On Fri, 20 Sep 2002, Rob Sterenborg wrote:
> > 
> > > > You can almost do this with the limit module, but you should 
> > > > better use
> > > > HTB or CBQ (QOS) which are really done for this.
> > > > 
> > > I first accomplished it with CBQ, but later I switched to HTB which is a lot
> > > easier to configure.
> > > 
> > > 
> > > Rob
> > > 
> > 
> > 
> > 
> 
> -- 
> ----
> Oskar Andreasson
> http://www.frozentux.net
> http://iptables-tutorial.frozentux.net
> http://ipsysctl-tutorial.frozentux.net
> mailto:blueflux@koffein.net
> 
> 
> 
> 
> 


