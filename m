From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Netfilter or DNS issue?
Date: Wed, 09 Feb 2005 13:18:18 -0500
Message-ID: <420A53EA.50704@SCampbell.net>
References: <200502081314.AA721338@mail.cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200502081314.AA721338@mail.cybercorpinc.com>
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
To: netfilter@lists.netfilter.org

Glen Spidal wrote:

>Greetings all,
>
>I have constructed a wirewall based off of the tutorial at frozentux.  The problem I'm having is that I have two DNS servers with the second being a slave to the first.  I can DIG other domains from the slave DNS server except for my own.  IT appears that the slave DSN server is not getting updated for the primary one. Here's my script:
>
>  
>
Without finding it specifically in your firewall script I would offer 
this hint:  the zone transfers happen using TCP while the queries use 
UDP.  Most likely port tcp/53 is being blocked between the servers.


