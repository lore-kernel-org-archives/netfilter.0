From: "Gabor Csuri" <csucsu@dunasor.hu>
Subject: RE: mark connections based a quote
Date: Fri, 15 Nov 2002 15:24:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLBOMOLDNJFMPIGKLCECDCFAA.csucsu@dunasor.hu>
References: <FD8F124A387AD6119F7900A0D218B3210199A1@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3210199A1@hslex01.hsl-brabantzuid.nl>
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

Hi All,

 Thank you the answers, I got the solution in private mail.
There is an iptables patch exactly do what I wanted.

Connbytes patch is located at http://luxik.cdi.cz/~devik/connbytes/.

regards, Gabor.

> -----Original Message-----
> From: Rob Sterenborg [mailto:rsterenborg@xs4all.nl]
> Sent: Friday, November 15, 2002 2:44 PM
> To: 'Gabor Csuri'; netfilter@lists.netfilter.org
> Subject: RE: mark connections based a quote
> 
> 
> >  I need to restrict some connections into a bandwidth on my
> > local network.
> > The long downloads (and uploads) are very bad for our
> > 800k/128k bandwidth.
> > I thougth I would restrict the long downloads into a lower
> > bandwidth, but I
> > don't know how can I mark the long downloads.
> > Can I mark the packets which are a part of a long connection
> 
> I don't think netfilter/iptables can do what you want, but CBQ or HTB
> together with iproute2 can.
> In case of HTB (which I think is easier to configure), check out :
> http:luxik.cdi.cz/~devik/qos/htb/
> 
> Specifically, for bursts (short downloads at high speed) :
> http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm#burst
> You can allow higher bandwidth for short downloads, while larger will be
> throttled.
> 
> 
> Rob

