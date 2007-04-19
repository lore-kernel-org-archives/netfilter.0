From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: Re: DNAT not working
Date: Thu, 19 Apr 2007 13:18:51 -0400
Message-ID: <20070419171851.GA18649@tranquility.scriptkitchen.com>
References: <20070418162604.GA10834@tranquility.scriptkitchen.com>
	<462656A8.3090003@rtij.nl>
	<20070419033123.GB22763@tranquility.scriptkitchen.com>
	<46274F3D.8040407@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46274F3D.8040407@freemail.hu>
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
Content-Transfer-Encoding: 7bit
To: G?sp?r Lajos <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

On Thu, Apr 19, 2007 at 01:15:09PM +0200, G?sp?r Lajos wrote:
> 2. You did not wrote but I assume you have a dynamically assigned IP 
> connection. (Line 22.) If it is true then I would specify in this line 
> the output interface: "-A POSTROUTING -s 10.10.0.0/255.255.255.0 -o 
> ???ppp+??? -j MASQUERADE"

No it is a fixed ip.

> 3. Line 23: ???? Why do you DNAT an outgoing connection back to you 
> ???  Maybe you do not need that line at all...

I removed that - but still does not work.

Any ideas?

With warm regards,
-Payal


