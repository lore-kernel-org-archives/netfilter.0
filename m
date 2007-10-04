From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack ctstate - multiple ISP links
Date: Thu, 04 Oct 2007 12:33:02 +0200
Message-ID: <4704C15E.9090203@plouf.fr.eu.org>
References: <4704A472.5080609@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704A472.5080609@darkstar.nom.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Paulo Andre a =E9crit :
> How would I go about getting ctstate installed on my system, currentl=
y=20
> running iptables 1.3.8.

All you need is a kernel with the 'conntrack' match enabled=20
(CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy|m on recent kernels or=20
CONFIG_IP_NF_MATCH_CONNTRACK on older ones). Support for the 'conntrack=
'=20
match has been included in the kernel since version 2.4.20 and in=20
iptables since version 1.2.7a.

> Apparently I need this to get multiple isp links=20
> working correctly on a FW. Packets entering interface eth2/eth3 all=20
> still leaving eth1, default GW.

Can you elaborate ?
