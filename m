From: Jason Opperisano <opie@817west.com>
Subject: Re: eth1 answers SYN/ACK to SYNs dedicated for eth0. Why?
Date: Wed, 15 Dec 2004 18:38:53 -0500
Message-ID: <1103153933.13025.10.camel@hubcap.ljm.dom>
References: <006401c4e2fa$cdd164d0$3001a8c0@cpcss>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006401c4e2fa$cdd164d0$3001a8c0@cpcss>
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

On Wed, 2004-12-15 at 18:07, Stoycho Sleptsov wrote:
> Hi.
> 
> I am new to iptables , so excuse me in advance for any strange
> terminologies.
> 
> I have the following configuration:
> an external IP assigned to eth0.
> 192.168.0.1 assigned to eth1.
> ip_forward set to 1.
> sshd waiting on 22.
> 
> iptables:
> 
> *filter
> :INPUT DROP
> :FORWARD DROP
> :OUTPUT ACCEPT
> 
> -A INPUT -i eth1 -j ACCEPT

change that to:

  -A INPUT -i eth1 -d $ip_of_eth1 -j ACCEPT

and packets that arrive on eth1 destined for eth0's IP address won't be
accepted anymore.
 
-j

--
"I saw weird stuff in that place last night. Weird, strange, sick,
 twisted, eerie, godless, evil stuff. And I want in."
	--The Simpsons


