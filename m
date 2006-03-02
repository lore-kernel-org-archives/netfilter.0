From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: Dual-home and forward outgoing requests
Date: Thu, 02 Mar 2006 10:24:50 -0500
Message-ID: <44070E42.6000808@certicom.com>
References: <a46d47540603020533v6093ac9et4a1f3677e0f490cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a46d47540603020533v6093ac9et4a1f3677e0f490cc@mail.gmail.com>
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

Andy Lego wrote:
> Hello,
> 
> I have a dual-homed network. Is there any way to tell iptables to
> forward all requests for specific service, that come from one
> interface, to go back out on the same interface?
> 
> Right now I have simply:
> 
> -A POSTROUTING -o eth0 -j MASQUERADE
> -A POSTROUTING -o eth1 -j MASQUERADE
> 
> So, what am I missing?
> 
> Thank you.
> 
> --
> http://legoandy.com
> 
Not sure what you mean. Say your device is 10.0.1.5, do you mean that if someone
was to telnet to 10.0.1.5 you would forward it to 10.0.1.10 (10.0.1.0/24 is on
eth0)?

The simplest is to have ip_forwarding on. Then add DNAT and MASQUERADE rules.
Linux routing should take care of the rest.

iptables -A PREROUTING -t nat -p tcp -s 10.0.1.0/24 --dport 23 -j DNAT --to
10.0.1.10
iptables -A POSTROUTING -t nat -j MASQUERADE

