From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: mark connections based a quote
Date: Fri, 15 Nov 2002 14:43:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B3210199A1@hslex01.hsl-brabantzuid.nl>
References: <FD8F124A387AD6119F7900A0D218B321487EAB@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321487EAB@hslex01.hsl-brabantzuid.nl>
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
To: 'Gabor Csuri' <csucsu@dunasor.hu>, netfilter@lists.netfilter.org

>  I need to restrict some connections into a bandwidth on my
> local network.
> The long downloads (and uploads) are very bad for our
> 800k/128k bandwidth.
> I thougth I would restrict the long downloads into a lower
> bandwidth, but I
> don't know how can I mark the long downloads.
> Can I mark the packets which are a part of a long connection

I don't think netfilter/iptables can do what you want, but CBQ or HTB
together with iproute2 can.
In case of HTB (which I think is easier to configure), check out :
http:luxik.cdi.cz/~devik/qos/htb/

Specifically, for bursts (short downloads at high speed) :
http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm#burst
You can allow higher bandwidth for short downloads, while larger will be
throttled.


Rob


