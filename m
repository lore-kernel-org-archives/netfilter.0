From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 13:20:41 -0600
Message-ID: <474DBF89.8000609@riverviewtech.net>
References: <C372F9CA.21D9%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C372F9CA.21D9%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

(Please do not start a new thread by replying to an old one.)

On 11/28/07 11:56, James Lay wrote:
> A curious question I have been asked from a client...any way to block 
> web-based proxies with iptables?  Wondering what it would take.

Well, IPTables can filter packets based on source IP of the proxies if 
they are known.  You could also use some sort of layer 7 match looking 
for some sort of header indicating that a proxy was in use.  However 
this would be very easy to circumvent and very much a catch up game on 
the IP blocking.

If you are really serious about doing this I would suggest that you do 
something that functioned based on the number of connections from a 
given source IP with in a time frame knowing that it is likely that 
proxies will possibly have a higher hit count than single systems. 
However this will also catch NATing gateways for companies.  So you will 
have to deal with white listing too.



Grant. . . .
