From: Jason Opperisano <opie@817west.com>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 10:44:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095950647.1750.30.camel@wolfpack.ljm.dom>
References: <415290B1.5030401@imag.fr>
	<20040923103428.GK27327@metastasis.org.uk>
	<20040923110943.14715.qmail@arcoscom.com>
	<20040923112331.GL27327@metastasis.org.uk>
	<1095948833.1750.9.camel@wolfpack.ljm.dom>  <4152DEE3.6010007@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4152DEE3.6010007@pbl.ca>
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

On Thu, 2004-09-23 at 10:34, Aleksandar Milivojevic wrote:
> Theoretically (since I don't know of any such implementation), it is 
> perfectly legal to have resolver library that first tries TCP, and than 
> UDP :-P
> 
> Of course, such approach would be waste of network resources (sending 
> one UDP datagram one way, and another the other way is usually at least 
> as fast as only establishihg new TCP connection without sending any data 
> through it).
> 
> Anyhow, I don't see why are you going red when you see TCP port 53 open? 
>   If it is possible for random internet site to fetch zone from DNS 
> server, it is misconfiguration of DNS server, not of the firewall.  OSI 
> layers and all that stuff, you know ;-).  

it comes from the days of BIND offering up remote root exploits more
often that i care to remember.  not allowing TCP 53 through the firewall
allowed one to get a least a couple of winks over the course of a night.

> If your DNS server does not 
> allow you to restrict who can do zone transfers, that you should 
> seriously consider switching to different DNS server that does.  

just adding layers to the onion.

-j

-- 
Jason Opperisano <opie@817west.com>


