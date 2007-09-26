From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering based on domains
Date: Wed, 26 Sep 2007 09:12:16 -0500
Message-ID: <46FA68C0.1040607@riverviewtech.net>
References: <200709251542.17186.S.Illes@westminster.ac.uk> <6407D8226F45114A973E9E4005AE9E5C380D9E@ns1.apd-hp.de> <46F9B90B.7020205@riverviewtech.net> <Pine.LNX.4.58.0709260628030.23333@mail3.jubileegroup.co.uk> <46FA6738.1090102@riverviewtech.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46FA6738.1090102@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/26/07 09:05, Grant Taylor wrote:
> I have never used GeoIP my self so I can't say for sure, but it was my 
> (mis)understanding that GeoIP was intended to associate IP ranges with 
> specific countries.  Thus the OPs request may seems to be a perfect 
> match for GeoIP.  But seeing as how I have never used it my self, I 
> don't know how it is implemented.  I have not really given it any 
> thought...
> 
> If you know any more about GeoIP please enlighten me.  TIA

I just did some quick reading on GeoIP and found that it uses a local 
database rather than using DNS lookups.  So, this probably would be a 
viable solution for the OP.

Of course this presumes that the OP is wanting to restrict access to / 
from the source / destination IP address domain and not the domain of 
pages being served by the web server.  For this, the OP would need some 
sort of layer 7 filtering, say a filtering proxy server, ala Squid.

Again, if I'm wrong, or misunderstood something please let me know.



Grant. . . .
