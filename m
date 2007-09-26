From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Filtering based on domains
Date: Wed, 26 Sep 2007 06:30:32 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0709260628030.23333@mail3.jubileegroup.co.uk>
References: <200709251542.17186.S.Illes@westminster.ac.uk>
 <6407D8226F45114A973E9E4005AE9E5C380D9E@ns1.apd-hp.de> <46F9B90B.7020205@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F9B90B.7020205@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi there,

On Tue, 25 Sep 2007, Grant Taylor wrote:

> On 9/25/2007 4:26 PM, info wrote:
> > Have a look for gepip  which allows acces rules per country (it's in
> > pom-ng)
>
> I think you may mean geoip.

Either way, I don't think it will do what the OP wants.

I think he'll have to do something in user space, or (probably better)
do it a different way.  Obviously the performance hit of a DNS lookup
for every connection could be serious.

--

73,
Ged.
