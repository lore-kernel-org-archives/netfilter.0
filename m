From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: QoS
Date: Mon, 2 Dec 2002 16:18:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019A0B@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321561586@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321561586@hslex01.hslbz.local>
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
To: 'Andreas Wright' <learnvoip@yahoo.co.uk>, netfilter@lists.netfilter.org

> I would like to know how I can prioritize packets coming from
> a specific source( a known IP address in the network) during
> routing by using iptables and iproute2.

You can do this using iproute2 and CBQ or HTB (where I prefer the latter
because it's easier to configure and works very well).
CBQ and HTB are both in kernel 2.4.20 (which you may have to recompile).


Rob


