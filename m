From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: iptables, voip, mac match
Date: Fri, 11 Oct 2002 05:49:40 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210110549010.29137-100000@localhost.localdomain>
References: <065501c270fc$e3f10c10$583a29c4@ghome>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <065501c270fc$e3f10c10$583a29c4@ghome>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gavin <gavin@raha.com>
Cc: netfilter@lists.netfilter.org

On Fri, 11 Oct 2002, Gavin wrote:

> hello,
> 
> just reporting a funny one:
> 
> One of our clients was trying to use a VOIP application through a linux
> gateway (iptables-1.2.3). The client had a MAC address of a:b:c:d:e:f and an
> IP address of 1.2.3.4
> 
> When I used this rule on the gateway (FORWARD policy DROP):
> iptables -A INPUT -i eth1 -m mac --mac a:b:c:d:e:f -j ACCEPT

                                   --mac-source ???

>      -     the client could not establish an audio channel to his VOIP
> server


rday


