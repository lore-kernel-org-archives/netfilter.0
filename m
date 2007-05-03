From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Proxy arping
Date: Thu, 3 May 2007 22:03:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705032202550.18504@yvahk01.tjqt.qr>
References: <4BE2588D-6B2F-4D89-A5DC-149A048545D6@paglayan.com>
	<463A389D.8050206@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <463A389D.8050206@rtij.nl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org


On May 3 2007 21:31, Martijn Lievaart wrote:
>
> The usual way is to add static arp entries.

Do that for a /16 and you're smelling the boundaries.


> # (untested code)
> for i in `seq 2 254` do
>   arp -Ds 192.168.50.$i eth2 pub
> done
>
> HTH,
> M4
>

Jan
-- 

