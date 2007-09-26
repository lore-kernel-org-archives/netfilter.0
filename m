From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering based on domains
Date: Wed, 26 Sep 2007 09:05:44 -0500
Message-ID: <46FA6738.1090102@riverviewtech.net>
References: <200709251542.17186.S.Illes@westminster.ac.uk> <6407D8226F45114A973E9E4005AE9E5C380D9E@ns1.apd-hp.de> <46F9B90B.7020205@riverviewtech.net> <Pine.LNX.4.58.0709260628030.23333@mail3.jubileegroup.co.uk>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0709260628030.23333@mail3.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/26/07 00:30, G.W. Haywood wrote:
> Either way, I don't think it will do what the OP wants.

(with my head slanted sideways with a confused look on my face)
Hugh???

> I think he'll have to do something in user space, or (probably 
> better) do it a different way.  Obviously the performance hit of a 
> DNS lookup for every connection could be serious.

I have never used GeoIP my self so I can't say for sure, but it was my 
(mis)understanding that GeoIP was intended to associate IP ranges with 
specific countries.  Thus the OPs request may seems to be a perfect 
match for GeoIP.  But seeing as how I have never used it my self, I 
don't know how it is implemented.  I have not really given it any thought...

If you know any more about GeoIP please enlighten me.  TIA



Grant. . . .
