From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: NAT support for peer-to-peer games
Date: Tue, 21 Sep 2004 23:45:48 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <75F05565CA465594D2BA1C62@[10.169.6.246]>
References: <00cf01c49fb1$da5492e0$e310f43e@manowar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00cf01c49fb1$da5492e0$e310f43e@manowar>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

--On Tuesday, September 21, 2004 11:04 AM +0300 "Serguei I. Ivantsov" 
<manowar@gsc-game.kiev.ua> wrote:

> How to implement the scheme described below using netfilter?

Note that the Linux-based Linksys WRT54G consumer router has "port 
triggering", which opens an inbound forwarding when an outbound packet 
matches a pattern. You could look at the implementation to see how Linksys 
did it. The code can be downloaded from Linksys' site.



