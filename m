From: "Curby ." <kirbysdl@hotmail.com>
Subject: Re: questions about chain traversal, new ascii diagram
Date: Thu, 06 Jan 2005 19:20:01 +0000
Message-ID: <BAY101-F23030A22FC86C1A88C1F93DF930@phx.gbl>
References: <41DD7A15.6050405@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DD7A15.6050405@lopsch.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lopsch@lopsch.com, netfilter@lists.netfilter.org

----Original Message Follows----
>http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagramm.jpg
>
>What about the mangle decisions, do you also want to include them :D?

It looks reasonable, but if this is true then the article I mentioned was 
wrong.  Perhaps there should be a disclaimer by the link on the netfilter 
documentation page?

Does anyone know the answers to my other questions? Specifically, is it due 
to style or technical reasons that people don't filter traffic in 
PREROUTING, and instead put the same rules in both FORWARD and INPUT?

I think you were probably just being facetious, but I wouldn't mind knowing 
when the mangle chains come into play.  If we have to jump to them 
explicitly though, then I'll just RTFM. =)

Thanks again!

--Curby



