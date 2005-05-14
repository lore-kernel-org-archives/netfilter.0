From: "dave beach" <drbeach@rogers.com>
Subject: RE: IPSec masquerade with multiple clients
Date: Fri, 13 May 2005 21:33:31 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAAB2T+dxCw0GGsvq99+UE8QEAAAAA@rogers.com>
References: <017f01c557b3$c71ee3a0$5101a8c0@ALEPH>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <017f01c557b3$c71ee3a0$5101a8c0@ALEPH>
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
To: 'Leonid Zeitlin' <lz@csltd.com.ua>, netfilter@lists.netfilter.org

I had the same problem - class C private net behind both a hardware
broadband router and a dedicated IPTables firewall. My employer uses a
Nortel Contivity VPN remote access solution, which does not have NAT
traversal enabled on the Contivity box.

With my previous router (Linksys BEFSR41), there's a tech bulletin on the
Linksys site that states it only supports a single VPN passthrough
connection. So, I upgraded to a newer model that supports more than one
(because both my wife and I both need to do VPN passthrough from our
respective at-home work laptops). I couldn't get multiple connections
working through the IPTables firewall, so I "solved" it by leaving my wife's
laptop connected through the IPTables firewall (and thence out via the
broadband router), and plugging my laptop directly into a spare jack on the
back of the broadband router.

Both laptops can now happily connect to the mothership Contivity VPN box,
and all is goodness. Not what I would have preferred (which would have been
both laptops connecting through the IPTables box), but I can live with it.

Other work users report that with various other broadband routers (SMC,
particularly) they can connect multiple concurrent VPN passthrough sessions
to the Contivity box, even with NAT traversal disabled - but they're just
wiring multiple computers directly into the back of the routers. Why I
couldn't get it to work through IPTables remains a mystery to me.

Your mileage may vary.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Leonid Zeitlin
Sent: May 13, 2005 8:04 AM
To: netfilter@lists.netfilter.org
Subject: Re: IPSec masquerade with multiple clients


----- Original Message -----
From: "Georgi Alexandrov" <tehlists@hotpop.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, May 13, 2005 2:37 PM
Subject: Re: IPSec masquerade with multiple clients


> Leonid Zeitlin wrote:
>
> >Hi all,
> >I have the following problem. I have a local network behind a Linux
router
> >that does IP masquerade. All hosts on the LAN have 192.168.*.* 
> >addresses, and the Linux router has only one external IP address. I 
> >need IPSec VPN clients from the LAN to connect to an outside server. 
> >The client VPN software is Contivity VPN Client by Nortel Networks. 
> >If only one clients connects at a time, everything works fine. But 
> >once one client connects,
no
> >other client can do so. For the second client the connection cannot 
> >be established. Is there any way to have multiple clients connect to 
> >the external VPN server simultaneously? Any help will be appreciated.
> >
> >Thanks in advance,
> >   Leonid
> >
> >
> >
> >
> >
>
> This question is asked at least once a week in this list, please take 
> a look at the archives.
>
> regards,
> Georgi Alexandrov
>

Yes, the answer is usually "enable NAT Traversal". My question then is, does
anyone know if NAT Traversal can be enabled in Contivity VPN Client. I
profess ignorance in this subject.

Thanks,
   Leonid



