From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Qos using htb and transparent squid proxy
Date: Wed, 29 Jan 2003 18:14:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030129181403.44c34faf.arnt@c2i.net>
References: <FD8F124A387AD6119F7900A0D218B321685F37@hslex01.hslbz.local>
	<1043835971.4709.19.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043835971.4709.19.camel@rayw.knowledgefactory.co.za>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

On 29 Jan 2003 12:26:11 +0200, 
Raymond Leach <raymondl@knowledgefactory.co.za> wrote in message 
<1043835971.4709.19.camel@rayw.knowledgefactory.co.za>:

> On Wed, 2003-01-29 at 12:02, Rob Sterenborg wrote:
> > > ip basis while going through the transparent proxy. I think 
> > > the proxy is doing all the downloading (as it should be) and 
> > > therefore does not obey the bandwidth limits imposed on the 
> > > requesting user.
> > 
> > But in squid you should be able to throttle the bandwidth when you
> > use delay pools.
> 
> Thanks for all the help so far Rob. Yes, delay pools can be used to
> some extent, but I need to throttle according to the source ip before
> it gets SNATed, i.e the internal IPs. I need squid to download at the
> rate that the client is allowed.
> 
> Ray
> 

..over at 'http://ipcop.org/', we have the wee beginnings 
of this in ipcop-1.3alpha4 or some such, in development.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



