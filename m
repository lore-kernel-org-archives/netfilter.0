From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Did MASQUERADE not work ?
Date: Wed, 10 Mar 2004 08:52:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040310075251.C9D5EF45@sterenborg.info>
References: <00c001c40644$19931970$6cfaa8c0@Defiant>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00c001c40644$19931970$6cfaa8c0@Defiant>
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
To: 'Kevork' <rxlm@comintec.com.ar>, netfilter@lists.netfilter.org

> Iptables script is the same as when it worked.
> MASQ line is:
> iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d 
> $internet -j MASQUERADE

What is "-d $internet" ?
If $internet is 0.0.0.0 (as it should be) then you don't need to specify it
as this is assumed.

Did you try SNAT :
iptables -t nat -A POSTROUTING -o <if_inet> \
  -s 192.168.250.0/24 -j SNAT --to-source <ip_inet>

Do you have a FORWARD rule in place that allows MASQ/SNAT, or do you have
FORWARD policy set to ACCEPT (which you should not do) ?

Do you have "echo 1 > /proc/sys/net/ipv4/ip_forward" ?


Gr,
Rob


