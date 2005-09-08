From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: firewall iptables based ?
Date: Wed, 7 Sep 2005 21:59:48 -0500
Message-ID: <200509072159.49067.rob0@gmx.co.uk>
References: <NHBBLNDNFKDMKNNKGOMMMEOEMDAA.gregoriandres@yahoo.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NHBBLNDNFKDMKNNKGOMMMEOEMDAA.gregoriandres@yahoo.com.ar>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 2005-September-07 21:39, LinuXKiD wrote:
> which open source firewall iptables based
> you recommend ?
>
> I've checked smoothwall and shoreline, but on
> freshmeat.net I've see many more !

I have not seen one I really liked. I know Monmotha's is good; I used 
that before I learned iptables(8) myself. But it and most others seem 
far too complex for my liking.

Read and understand the Packet Filtering HOWTO (and NAT HOWTO if you 
need NAT) and start with those examples. It's very simple and secure. 
The real benefit is that you will understand WHY it's secure.

I used to have a fancy script which did a lot with little configuration 
by the user, but it proved to be too much to maintain. Lately I am just 
editing iptables-save(8) rules files for iptables-restore(8).
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

