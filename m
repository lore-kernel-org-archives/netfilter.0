From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 09:34:11 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4152DEE3.6010007@pbl.ca>
References: <415290B1.5030401@imag.fr>	<20040923103428.GK27327@metastasis.org.uk>	<20040923110943.14715.qmail@arcoscom.com>	<20040923112331.GL27327@metastasis.org.uk>
	<1095948833.1750.9.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095948833.1750.9.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Jason Opperisano wrote:
> find me a response to a client resolver request that doesn't fit in a
> single UDP packet, and i'll stop seeing red every time i see someone
> recommend allowing TCP 53 from any IP to their DNS server (*).

Theoretically (since I don't know of any such implementation), it is 
perfectly legal to have resolver library that first tries TCP, and than 
UDP :-P

Of course, such approach would be waste of network resources (sending 
one UDP datagram one way, and another the other way is usually at least 
as fast as only establishihg new TCP connection without sending any data 
through it).

Anyhow, I don't see why are you going red when you see TCP port 53 open? 
  If it is possible for random internet site to fetch zone from DNS 
server, it is misconfiguration of DNS server, not of the firewall.  OSI 
layers and all that stuff, you know ;-).  If your DNS server does not 
allow you to restrict who can do zone transfers, that you should 
seriously consider switching to different DNS server that does.  It is 
the same as if you were to restrict one directory on HTTP server to only 
certain range of IP addresses, and than blame it on firewall when you 
misconfigure HTTP server.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

