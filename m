From: "Sez" <sezmillenium@yahoo.es>
Subject: RE: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 15:00:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BOcHK-0005So-BG@vishnu.netfilter.org>
References: <200405141344.54206.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405141344.54206.Antony@Soft-Solutions.co.uk>
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

I have a microsoft server to l2tp/ipsec. And my firewall is a Linux. I
understand that if i create a server in micro$oft box, i can routing the
traffic with Linux with any problem (no recompile, multiple users, nat with
l2tp/ipsec).

Is it true?

Thanks!

 

-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Antony Stone
Enviado el: divendres, 14 / maig / 2004 14:45
Para: netfilter@lists.netfilter.org
Asunto: Re: Iptables do nat with Protocol 47 or GRE

On Friday 14 May 2004 1:15 pm, Sez wrote:

> And, with l2pt or ipsec, iptables work fine without path GRE???

IPsec does not use GRE.   IPsec uses protocols 50 and 51 - ESP and AH.

IPsec works fine over NAT in Tunnel Mode (not Transport Mode without serious
fiddling with things).

GRE is protocol 47.

L2TP is a UDP-based protocol (port 1701) as far as I know.

Regards,

Antony.

--
Your work is both good and original.  Unfortunately the parts that are good
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the
list;
                                                           please don't CC
me.


