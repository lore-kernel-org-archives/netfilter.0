From: Tommy W <tommy@svearike.sytes.net>
Subject: Re: Simulating a "bad" connection.
Date: Fri, 4 May 2007 23:42:26 +0200
Message-ID: <200705042342.26764.tommy@svearike.sytes.net>
References: <200705042201.21985.tommy@svearike.sytes.net>
	<Pine.LNX.4.61.0705042310550.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705042310550.18504@yvahk01.tjqt.qr>
Content-Disposition: inline
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On Friday 04 May 2007 23:11, you wrote:
> On May 4 2007 22:01, Tommy W wrote:
> >Hi,
> >I was just wondering if someone knows of a good way to simulate a "bad"
> >network?.
> >I want high latency AND/OR high packet loss.
> >
> >I was thinking along the lines
> >iptables -I INPUT -m random --average 90 -j DROP
> >
> >but then I get libipt_random.so doesn't exist.
>
>   -m statistic --mode random
>
> It might not exist yet either.

Thanks for the tip, although I did not have that either :\
Is it included in a newer version of netfilter/iptables ?

/Tommy

