From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: deny telnet&ftp except 2 station
Date: Mon, 3 Feb 2003 04:20:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030203042026.5352d124.arnt@c2i.net>
References: <000001c2c9b5$5e967f20$190da8c0@iomco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2c9b5$5e967f20$190da8c0@iomco.com>
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

On Sat, 1 Feb 2003 09:17:12 +0330, 
"zeinali" <zeinali@iomco.com> wrote in message 
<000001c2c9b5$5e967f20$190da8c0@iomco.com>:

> dear sir
> recently i installed redhat 8.0 and i setuped squid but im going to
> deny any telnet and ftp to my linux box except 2 ip address like
> 192.168.13.24 & 192.168.13.25  but i don't know how can i do it with
> IPTABLES 1.26a 
> if possible pls kindly help me


..like 'iptables -A $incoming -p any 192.168.13.24 \
--destination-port 23 -j ACCEPT'

...where "$incoming" is either INPUT or FORWARD etc, chk 
Oskars Andreasson's excellent Iptables Tutorial 1.1.16
http://iptables-tutorial.frozentux.net/chunkyhtml/index.html 

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



