From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Natted packets
Date: Tue, 09 Jan 2007 11:13:51 +0100
Message-ID: <45A36ADF.1090506@netfilter.org>
References: <45A2BB09.90405@eternet.cc>
	<Pine.LNX.4.61.0701082259240.23737@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701082259240.23737@yvahk01.tjqt.qr>
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

Jan Engelhardt wrote:
>> Is it possible to know if a packet passing through my router is (s)natted?
> 
> I think `-m conntrack --ctstate SNAT` should do that.
> 
>> And the original (s)natted IP?
> 
> For userspace there's a getsockopt() call that you can use to find out.

That getsockopt() interface is deprecated. If you're in userspace,
better use the libnetfilter_conntrack library. It has a function to
check if a conntrack has been snatted.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

