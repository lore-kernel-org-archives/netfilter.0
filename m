From: Jason Opperisano <opie@817west.com>
Subject: Re: bad ftp speeds through nat
Date: Mon, 22 Nov 2004 13:41:24 -0500
Message-ID: <20041122184124.GA31191@bender.817west.com>
References: <0e7301c4d0c1$74ba04b0$49caa8c0@caris.priv>
	<0e7801c4d0c2$9dc80220$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0e7801c4d0c2$9dc80220$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Mon, Nov 22, 2004 at 02:39:36PM -0400, Peter Marshall wrote:
> It looks like it is slow with any type of file transfer through the firewall
> .. not just ftp ...

does "netstat -ni" on the firewall show any interface errors?  any
possibility of a speed/duplex mismatch between the firewall's interfaces
and the switches it's connected to (mii-tool/ethtool can help here)?

is your firewall a P-75 that might not be capable of filtering more than
300 Kbps (semi joking...)?

-j

--
"This has purple stuff inside - purple is a fruit."
        --The Simpsons

