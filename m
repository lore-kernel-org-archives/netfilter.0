From: Jason Opperisano <opie@817west.com>
Subject: Re: How to use netfilter to do static IP mapping?
Date: Fri, 24 Sep 2004 02:57:37 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096009057.9581.68.camel@wolfpack.ljm.dom>
References: <20040924032402.415.qmail@web51803.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040924032402.415.qmail@web51803.mail.yahoo.com>
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

On Thu, 2004-09-23 at 23:24, Patrick Dung wrote:
> Dear All
> 
> This is what I want:
> 
> eth0 as internet (1.1.1.1)
> eth1 as dmz (10.1.1.1)
> 
> dmz has a web (10.1.1.2) and dns (10.1.1.3) server
> with private IP.
> The netfilter fw will do the static IP (public to
> private) IP mapping.
> Avaliable public IP (example):
> 1.1.1.1 (eth0), 1.1.1.2 (for web), 1.1.1.3 (for dns)
> 
> Now I have these rules:
> 
> iptables -t nat -A PREROUTING -i eth0 -d 1.1.1.2 -p
> tcp --dport 80 -j DNAT --to 10.1.1.2:80
> iptables -t nat -A PREROUTING -i eth0 -d 1.1.1.3 -p
> udp --dport 53 -j DNAT --to 10.1.1.3:53
> 
> The problem is that there is no response from 1.1.1.2
> and 1.1.1.3.
> Do I need other special setting (proxy arp?)

yup.  on netfilter machine:

  ip address add 1.1.1.2 dev eth0
  ip address add 1.1.1.3 dev eth0

 remember to use 10.1.1.[23] in your filter rules and not 1.1.1.[23].

-j

-- 
Jason Opperisano <opie@817west.com>


