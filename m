From: Jasbir Khehra <jasbir.k@gmail.com>
Subject: Re: REF: Blocking Yahoo
Date: Fri, 03 Nov 2006 19:47:22 +0530
Message-ID: <454B4F72.4000800@gmail.com>
References: <380-22006115365443640@zamnet.zm>
Reply-To: jasbir.k@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <380-22006115365443640@zamnet.zm>
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
To: lubasi <lubasi@zamnet.zm>
Cc: netfilter@lists.netfilter.org

lubasi wrote:

>Dear All,
>
>I'm new to this list and netfilter as a whole.
>
>I have setup rules on my iptables and when i block yahoo, only those
>using gaim IM client using yahoo are blocked but the native yahoo IM
>client is passing through my firewall. Whats wrong with my chains
>below. Thank you in advance.
>
>My chains
>
>
>#Block Yahoo Messnger
>/sbin/iptables -I FORWARD -s MYNETWORK/24 -d 216.155.193.0/22 -j DROP
>
>  
>
Yahoo IM protocol can tunnel through port 80 , I believe Gaim also has 
this feature( tweak the network settings ).
IMO best bet to block yahoo using netfilter is 
l7-filter.sourceforge.net, but this requires a kernel+iptables patch.
HTH,
Jasbir

