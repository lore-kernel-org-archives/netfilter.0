From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall + tcpdump
Date: Tue, 30 Mar 2004 15:37:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301537.54461.Antony@Soft-Solutions.co.uk>
References: <40698161.1020502@n-dsi.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40698161.1020502@n-dsi.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 30 March 2004 3:17 pm, Peggy Kam wrote:

> Hi,
>
> Does tcpdump dumps traffic on a network in front or behind a firewall?

Not sure quite what you by "in front or behind", however I can tell you that 
tcpdump works "closer to the wire" than netfilter, so it will see all traffic 
hitting the interface, whether netfilter allows it or not.

> If it dumps traffic in front of a firewall, would anyone kindly suggest
> a way to test the firewall?

Um, test it by sending packets which should be allowed, and making sure they 
are, then sending ones which should be blocked, and making sure they are?

Or have I misunderstood the question?   How would you propose to use tcpdump 
to test the firewall anyway?

Regards,

Antony.


-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


