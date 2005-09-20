From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Squid +iptables + apache
Date: Tue, 20 Sep 2005 08:12:31 -0500
Message-ID: <200509200812.33357.rob0@gmx.co.uk>
References: <200509200157.11810.etobis@dc.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509200157.11810.etobis@dc.uba.ar>
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

On Monday 19 September 2005 23:57, Enrique Augusto Tobis wrote:
> To sum it up, almost everything is working as it should. But, if I
> try to access 192.168.0.3 from INSIDE the network, I get an error
> from squid...
>
> I activate the transparent proxy with
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 8080
>
> and forward the port 80 connections with
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
> 192.168.0.1:80

iptables -vt nat -I PREROUTING -i eth0 -d 192.168.0.3 -p tcp \
    --dport 80 -j ACCEPT

*Might* do it. My guess is that this router is seeing the packets to 
192.168.0.3 for some reason. My rule (-I to insert at top) will bypass 
your REDIRECT rule.

Edmundo's question is valid. Normally a host would not go through your 
firewall to reach another host on the same physical segment. So my 
guess might be wrong.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

