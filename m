From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: questions about chain traversal, new ascii diagram
Date: Fri, 07 Jan 2005 22:08:39 +0000
Message-ID: <41DF0867.2060505@dsl.pipex.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curby ." <kirbysdl@hotmail.com>
Cc: netfilter@lists.netfilter.org

Curby . wrote:
> ----Original Message Follows----
> 
>> http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagramm.jpg 
>>
>>
>> What about the mangle decisions, do you also want to include them :D?
> 
> 
> It looks reasonable, but if this is true then the article I mentioned 
> was wrong.  Perhaps there should be a disclaimer by the link on the 
> netfilter documentation page?
> 
> Does anyone know the answers to my other questions? Specifically, is it 
> due to style or technical reasons that people don't filter traffic in 
> PREROUTING, and instead put the same rules in both FORWARD and INPUT?

Respecting johns answer - as I don't do much firewall stuff, but I 
thought it was because there are no filter tables in pre/post.

http://www.docum.org/docum.org/kptd/

> 
> I think you were probably just being facetious, but I wouldn't mind 
> knowing when the mangle chains come into play.  If we have to jump to 
> them explicitly though, then I'll just RTFM. =)

AIUI use mangle if you want to mark/change(mangle) packets eg TOS bits.


> 
> Thanks again!
> 
> --Curby
> 
> 
> 
> 



