From: Jason Opperisano <opie@817west.com>
Subject: Re: ftp connection tracking on multiple ports
Date: Thu, 28 Oct 2004 08:41:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098967289.3029.3.camel@hubcap.ljm.dom>
References: <1403218a0410280318a6ed55b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a0410280318a6ed55b@mail.gmail.com>
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

On Thu, 2004-10-28 at 06:18, Mohamed Eldesoky wrote:
> Dear all,
> 
> I have a server that runs FTP on two ports, port 21 and port 45 (for
> strange reasons)
> Now, i want conntrack to track the connections of both ports and their
> data ports !!
> 
> I did that in my firewall script
> /sbin/modprobe ip_conntrack_ftp ports=21,45
> $IPTABLES -A linweb_chain -p tcp -m multiport --destination-port
> 80,21,45 -j ACCEPT
> 
> Is that all I need ??

iptables -A linweb_chain -m helper --helper ftp -j ACCEPT

-j

-- 
Jason Opperisano <opie@817west.com>


