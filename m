From: "Stuart J. Browne" <stuart@promed.com.au>
Subject: RE: Redirecting Traffic Locally
Date: Wed, 29 Oct 2003 12:24:20 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008a01c39dbb$60b51070$2288e7c0@promed.com.au>
References: <3F9F1163.9070008@riovia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9F1163.9070008@riovia.net>
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
To: "'Paul J. Caritj'" <pcaritj@riovia.net>, netfilter@lists.netfilter.org

>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Paul 
>J. Caritj
>Sent: Wednesday, 29 October 2003 11:01
>To: netfilter@lists.netfilter.org
>Subject: Redirecting Traffic Locally
>
>
>Gents,
>Hopefully this is an easy question :)
>
>I have a firewall with a built in webserver. I want all traffic going 
>through this firewall, not to (or from) a proscribed list of IPs to be 
>redirected to the Site hosted on the firewall itself (its a signup 
>page). At present, I'm using redirection of this form:
>
>iptables -t nat -A UNREGISTERED -s 0/0 -d 0/0 -j DNAT --to-destination 
>XXXXXXX;

Have you tried using 'REDIERCT' instead of 'DNAT' ?

iptables -t nat -A UNREGISTERED -j REDIRECT --to <localport>

>
>A rule in the PREROUTING chain bounces traffic to the UNREGISTERED 
>chain. The system works fine when XXXXXXX is outside the network. 
>However, I cannot DNAT to the firewall itself. Thoughts, anyone?

Stuart


