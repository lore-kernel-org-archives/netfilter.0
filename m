From: Jason Opperisano <opie@817west.com>
Subject: Re: Active and Passive FTP
Date: Tue, 17 May 2005 15:27:58 -0400
Message-ID: <20050517192758.GA2088@bender.817west.com>
References: <00c701c55afd$4568d0d0$1701a8c0@info2000256>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00c701c55afd$4568d0d0$1701a8c0@info2000256>
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
To: netfilter@lists.netfilter.org

On Tue, May 17, 2005 at 06:27:08PM +0200, Robert Becskei wrote:
> Hello everyone ,
> 
> my clients access the internet like this
> 
> client --- proxy server --- eth0 firewall eth1 ----internet
> 
> in squid.conf I told squid to always direct allow ftp...
> 
> in iptables I've did the following modifications...

you are making this much more complicated than it actually is:

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --syn --dport 21 -j ACCEPT

-j

--
"Peter: Wow, it's like I died and went to heaven, then God realized it
 wasn't my time yet, so He sent me back to a brewery."
        --Family Guy

