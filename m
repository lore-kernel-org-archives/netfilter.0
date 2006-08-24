From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Poor forwarding performance
Date: Thu, 24 Aug 2006 22:15:10 +0200 (CEST)
Message-ID: <16177.7801033624$1156450578@news.gmane.org>
References: <ca7df3760608241028n53544585rf25217b3053df384@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ca7df3760608241028n53544585rf25217b3053df384@mail.gmail.com>
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
To: Alejandro Flores <alejandrorflores@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Alejandro Flores">
> I'm having an horrible performance with the traffic flow from and net
> to another. I made some transfer tests and I can't get more than 5
> MB/s.

That smells like a duplex mismatch. Do you have the same horrible
performance without iptables connaction tracking?

M4


