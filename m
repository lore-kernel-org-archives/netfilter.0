From: Leandro Rodrigo Saad Cruz <leandro@ibnetwork.com.br>
Subject: a couple of questions about PPTP
Date: 14 Nov 2002 15:49:16 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037296161.20600.14.camel@zacarias>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all, I'm trying to setup a VPN gateway to route PPTP traffic, but I
have some questions :

(My box is running linux 2.4.19)

1) Do I have to use the MASQUERADE target to route PPTP traffic or using
SNAT is ok ?

2) I think linux 2.4.19 supports 1 PPTP client through the gateway, so I
don't heave to apply the patch from
http://www.impsec.org/linux/masquerade/ip_masq_vpn.html in order to
enable PPTP, I just have to enable GRE options and netfilter om my
kernel. Right ?

3) What has to be done in order to masquerade more that one PPTP client
through the VPN gateway ? is the patch from
http://www.impsec.org/linux/masquerade/ip_masq_vpn.html intented to do
this ?

I've read Linux VPN Masquerade and some other docs but I still don't
have my mind clear about the way PPTP masq should be done.

Thanx for your help !


-- 
Leandro Rodrigo Saad Cruz
IT - Inter Business Tecnologia e Servicos (IB)
http://www.ibnetwork.com.br
http://jakarta.apache.org/ojb


