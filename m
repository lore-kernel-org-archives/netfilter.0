From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: Setting TOS in POSTROUTING mangle table
Date: Wed, 06 Oct 2004 10:12:45 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <40E3223FC8318D76659A6579@[10.169.6.246]>
References: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
	<1097078302.5214.10.camel@wolfpack.ljm.dom>
	<1097079300.2976.14.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097079300.2976.14.camel@anduril.intranet.cartel-securite.net>
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

--On Wednesday, October 06, 2004 6:15 PM +0200 Cedric Blancher 
<blancher@cartel-securite.fr> wrote:

> For Kenneth : if you still want to use TOS, I would reset it to 0 in
> POSTROUTING chain, as some silly guys drop packets with non null TOS
> value.

What "silly guys" do that? Sounds rather anti-social. I can see ignoring 
the QoS request and dumping the packet in the default queue, but not 
dropping the packets.

Doesn't ssh set the Minimize-Delay value?



