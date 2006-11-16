From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: NAT with two external IP numbers
Date: Thu, 16 Nov 2006 17:32:06 +0100
Message-ID: <7e67d4983f901ba3347a12c19f4fe4ce@former03.de>
References: <455C5B7A.5040702@crc.dk>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455C5B7A.5040702@crc.dk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mogens Kjaer <mk@crc.dk>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi Mogens,

> Give the linux box two IP numbers externally,
> e.g. 130.226.184.38 and 130.226.184.39, register
> 130.226.184.38 with the journal, change the
> internal IP numbers so that:
>
 > [...]
>
> /sbin/iptables -t nat -A POSTROUTING -s 172.20.0.0/17 -o eth0 -j 
> MASQUERADE
> /sbin/iptables -t nat -A POSTROUTING -s 172.20.128.0/17 -o eth0:1 -j 
> MASQUERADE

eth0:1 is not a real interface so no packets can go out there. It would 
be
good if iptables would throw an error, but probably it's hard for the 
software
to tell what are 'real' interfaces.

You must use the SNAT target to achieve what you want:
/sbin/iptables -t nat -A POSTROUTING -s 172.20.0.0/17 -o eth0 -j SNAT 
--to 130.226.184.38
/sbin/iptables -t nat -A POSTROUTING -s 172.20.128.0/17 -o eth0 -j SNAT 
--to 130.226.184.39

(Please note that both rules use eth0 as that's the interface where the 
packets
go out).

Hope that helps,
Baltasar


