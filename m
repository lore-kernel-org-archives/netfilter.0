From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: questions about chain traversal, new ascii diagram
Date: Thu, 06 Jan 2005 21:12:12 -0500
Message-ID: <1105063932.7100.75.camel@localhost>
References: <BAY101-F23030A22FC86C1A88C1F93DF930@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F23030A22FC86C1A88C1F93DF930@phx.gbl>
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
To: "Curby ." <kirbysdl@hotmail.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Thu, 2005-01-06 at 19:20 +0000, Curby . wrote:
> ----Original Message Follows----
> >http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagramm.jpg
> >
> >What about the mangle decisions, do you also want to include them :D?
> 
> It looks reasonable, but if this is true then the article I mentioned was 
> wrong.  Perhaps there should be a disclaimer by the link on the netfilter 
> documentation page?
> 
> Does anyone know the answers to my other questions? Specifically, is it due 
> to style or technical reasons that people don't filter traffic in 
> PREROUTING, and instead put the same rules in both FORWARD and INPUT?
> 
> I think you were probably just being facetious, but I wouldn't mind knowing 
> when the mangle chains come into play.  If we have to jump to them 
> explicitly though, then I'll just RTFM. =)
<snip>
While it is not a good idea to put filtering rules in the nat table, it
is very common to put them in the PREROUTING chain of the mangle table.
In the ISCS network security management project
(http://iscs.sourceforge.net), we place all the "junk" filters in the
mangle table.

There are other targets that are only appropriate in the mangle table,
e.g., marking a packet (particularly useful with 2.6 ipsec traffic) or
changing TOS.
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


