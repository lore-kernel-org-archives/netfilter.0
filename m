From: Jason Opperisano <opie@817west.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 18:17:51 -0500
Message-ID: <1103325470.3262.52.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
	<200412171801.40729.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412171801.40729.JALaramie@Loudoun-Fairfax.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-12-17 at 18:01, Jeffrey Laramie wrote:
> Agreed, but is that any reason to make it easier for them? I use similar rules 
> which BTW are out of Oskar's Tutorial. While I thankfully haven't seen it yet 
> on a Linux box (and with any luck I won't), on windows boxes it's not unusual 
> for programs to create or use interfaces and assign IPs to them and then use 
> these interfaces to query your network. AOL does this constantly and although 
> I believe they are trying to determine the most appropriate server to assign 
> to your connection, it's still unnerving to see public IPs on your LAN.  :-p

then the rules should have interface restrictions as well.  do or do not
do, there is no try.

-j

--
"Lisa, Vampires are make-believe, like elves, gremlins, and eskimos."
	--The Simpsons


