From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: forwarding traffic to different hosts
Date: Fri, 27 Aug 2004 10:09:43 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040827090943.GG22322@metastasis.org.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F0@asimail2.alphanumeric.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512F0@asimail2.alphanumeric.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Aug 26, 2004 at 08:21:00PM -0400, Jason Opperisano wrote:

> > iptables -t nat -I PREROUTING --source 207.155.252.12 -p tcp --dport 777
> > -j DNAT --to-destination 198.81.129.101

>   iptables -t nat -I POSTROUTING -p tcp --dport 777 -s 207.155.252.12 \
>     -d 198.81.129.101 -j SNAT --to-source 198.81.129.100

Thanks... but I wanted to keep the original source.  Sorry, udp is
really what I've got in mind here, I was just using tcp because it's
easier to test with "telnet 198.81.129.100 777" than it is to fire up a
program to create a UDP packet.

What I'm looking for is for queries to one DNS server from certain IP
addresses to be redirected to another... but without any interaction
with the BIND daemon itself.

-- 
mors omnia vincit

