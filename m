From: "Rio Martin." <rio@martin.mu>
Subject: Re: DNAT question..
Date: Thu, 24 Jul 2003 15:56:53 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307241556.53796.rio@martin.mu>
References: <200307241400.51653.rio@martin.mu> <3F1F9900.4080401@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1F9900.4080401@snapgear.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 24 July 2003 15:29, you wrote:
> Rio Martin. wrote:
> > Dear all,
> > I describe first about my network:
> > INTERNET --- eth0 [ NAT+Firewall Linux ] eth1 --- LAN
> > eth0 would be my public ip = 211.1.1.10
> > eth1 would be my private ip = 192.168.1.1
> > On NAT+Firewall Linux i applied this rule:
> > iptables -t nat -A PREROUTING -p tcp -d 211.1.1.10 --dport 80 -j DNAT
> > --to 192.168.1.2:80
> > This is rule for redirecting to local webserver.
> > I tried to test it from outside network (internet), surf to
> > http://211.1.1.10 and it succeed.
> > But from inside LAN network (192.168.1.3) i am unable to browse to
> > http://211.1.1.10
> You need to SNAT internal connections so that replies go via the
> firewall instead of directly to the client, otherwise the firewall
> cannot reverse the DNAT and the client drops the reply packet.
> Try this rule:
> iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 192.168.1.2
> --dport 80 -j SNAT --to 192.168.1.1

i dont know, i tried but it still wont connect to webserver.
Connection Refused.

Regards,
Rio Martin.
-- 
You can measure a programmer's perspective by noting his attitude on
the continuing viability of FORTRAN.
		-- Alan Perlis


