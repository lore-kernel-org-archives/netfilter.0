From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: block yahoo messenger
Date: Wed, 26 Feb 2003 15:50:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019BE7@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B3217255B6@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3217255B6@hslex01.hslbz.local>
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

> hi all,
> does anyone have an idea about blocking "yahoo messenger" 
> using iptables? thanks afshin

Maybe it's quite rude to block 4 /24 nets, but Messenger kept connecting
in these ranges and on different ports (5050, 23, 80) so I just did this
:

iptables -A FORWARD -d 216.136.223.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.224.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.227.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.233.0/24 -j REJECT --reject-with
tcp-reset

Of course you are welcome to find out exactly what servers Messenger
using to block them individually ; I didn't take the time to do that.


Gr,
Rob


