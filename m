From: "=?iso-8859-1?q?Carlos_Fa=C4=BFanha?=" <carlos.facanha@uol.com.br>
Subject: Question on PREROUTING and INPUT chains
Date: Mon,  4 Nov 2002 18:46:15 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <H52KD3$II79GwJU6pjw8ZNZc1oYk1taD6_z_kdUix49OEr@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have a Linux box used as NAT server and firewall. All 
requests on its port 80 are forwarded to a local webserver 
inside my network. I want to block access to all services 
including http from a specific external host.

I'm using the following rule to block the host

iptables -A INPUT -i $extint -s $hostip -j DROP

and this one to do the NAT

iptables -t nat -A PREROUTING -p tcp --dport 80 -d $extip -j 
DNAT --to $webserverip:80

The problem is that the host is blocked from accessing all 
services but http. I've already checked if there are any 
rules before that ACCEPT the request. It seems that prerouted 
packets are bypassing the INPUT chain.

Is it correct? If not, what am I doing wrong?

TIA

Carlos Fa=E7anha
carlos.facanha@uol.com.br

 
---
UOL, o melhor da Internet
http://www.uol.com.br/


