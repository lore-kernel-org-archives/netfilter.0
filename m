From: Jason Opperisano <opie@817west.com>
Subject: Re: Passive FTP Problem in NAT.
Date: Wed, 15 Sep 2004 11:43:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095263030.1899.70.camel@wolfpack.ljm.dom>
References: <1095261204.9082@wormhole.atom.is>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095261204.9082@wormhole.atom.is>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-15 at 11:13, svavar@atom01.is wrote:
> Hi.
> 
> Could someone help me or give me advice regarding NAT on a FTP server located in my DMZ.
> 
> This is my setup :
> 
> My Firewall(Linux 2.4.22-1) :
> |
> - eth0 = Public Interface (x.x.x.66 / 26 )
> |
> - eth1 = DMZ Interface (172.16.100.254 / 24 )
> |
> - eth2 = My Internal Network ( 192.168.1.1 / 24 )
> 
> 
> I have a FTP server located on my DMZ Network. The server is listening on a non-standard ftp port. It listens on port : 2121.

bingo.  the standard modprobe commands won't work in your situation. 
try:

        modprobe ip_conntrack_ftp ports=21,2121
        modprobe ip_nat_ftp ports=21,2121

to force the helper to watch your specific port.

-j

-- 
Jason Opperisano <opie@817west.com>


