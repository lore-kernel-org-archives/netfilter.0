From: Walther@gehag-dsk.de
Subject: Re: 1:1 NAT
Date: Tue, 21 Jan 2003 18:00:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF2B77F626.D8E69574-ONC1256CB5.005D08E8-C1256CB5.005D1B0C@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

hi,

from outside to inside:

iptables -t nat -A PREROUTING -d 208.15.232.12 -j DNAT --to 192.168.1.167

the other way around:

iptables -t nat -A POSTROUTING -s 192.168.1.167 -j SNAT --to 208.15.131.12

you should specify the input and output interface as well like this:

iptables -t nat -A PREROUTING -i <external-interface> -o 
<internal-interface> -d 208.15.232.12 -j DNAT --to 192.168.1.167

and 

iptables -t nat -A POSTROUTING -i <internal-interface> -o 
<external-interface> -s 192.168.1.167 -j SNAT --to 208.15.232.12

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04




"Mike" <mikeeo@msn.com>
Sent by: netfilter-admin@lists.netfilter.org
21.01.2003 17:00

 
        To:     <netfilter@lists.netfilter.org>
        cc: 
        Subject:        1:1 NAT


Can anyone point me to some docs on setting up 1:1 NAT on netfilter?

What I am trying to do is like how its done on cisco PIX i.e
"static (inside,outside) 208.15.232.12 192.168.1.167 netmask 
255.255.255.255
0 0"

That way I don't have to do IP alias on my ethernet card.

Thanks,

Mike






