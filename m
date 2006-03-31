From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Fri, 31 Mar 2006 08:43:42 -0500
Message-ID: <442D320E.7070301@SCampbell.net>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
	<442D2C8F.1020505@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442D2C8F.1020505@SCampbell.net>
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
To: netfilter@lists.netfilter.org

Steven M Campbell wrote:
> We know from the message that we fell off of the end of the FORWARD 
> chain (because the --log-prefix "FORWARD blocked: " is the only one to 
> match the message....
> 
>

One other thought to this, if I were to presume the ${variables} and ...ip's then I would presume that the RELATED rules should allow these ack's to go through.  The only reason I know of for them not do (again, assuming all the addressing is really ok) would be that the conntrack table has filled up.

To see the maximum connnections that can be tracked:

# cat /proc/sys/net/ipv4/ip_conntrack_max
32760

To see how many you are using at a given moment

# wc  -l /proc/net/ip_conntrack
16 /proc/net/ip_conntrack


This from my house and there really isn't all that much going on, I would expect far larger counts, you may need to up ip_conntrack_max.  This really out in the SWAG arena because I can't see the details of your installation.

