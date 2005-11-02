From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables problem
Date: Wed, 02 Nov 2005 15:49:04 -0700
Message-ID: <43694260.6080204@pcraft.com>
References: <4367AEA5.7080501@pcraft.com>	<43a0cdcb0511011631k1bd1cfci@mail.gmail.com>
	<43681694.1040406@pcraft.com> <436868D1.4080508@gmail.com>
	<56523.193.173.147.3.1130918487.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56523.193.173.147.3.1130918487.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg wrote:

>The INPUT and OUTPUT chains are for local traffic.
>These kiosk hosts are probably *behind* iptables, so traffic will
>travel through the FORWARD chain.
>
>If you need external connections forwarded to hosts behind the
>firewall, you need DNAT rules to make it happen.
>  
>
    Yes, the kiosks are behind the firewall (iptables) and need 
unrestricted access to and from the internet, but only for FTP.

>In this case, the OP has 3 hosts to wich he wants to connect ("nothing
>from the outside can connect to them", outgoing connections are
>already working).
>FTP only uses port 21/tcp (and 20). It's to my knowledge not possible
>to forward 1 port to 3 hosts simultaneously (if that would do any
>good), so he'll need to assign different ports for the second and
>third host.
>Something like :
>21/tcp -> host 1
>41/tcp -> host 2
>61/tcp -> host 3
>(if these ports are free).
>  
>
    All right, so this is what I currently have in my iptables rules:

-A PREROUTING -i eth0 -p tcp -m tcp --dport 21 -j DNAT --to-destination 
192.168.1.xxx
-A PREROUTING -i eth0 -p tcp -m tcp --dport 20 -j DNAT --to-destination 
192.168.1.xxx

    ...and further down:

-A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp --dport 21 
--tcp-flags SYN,RST,ACK SYN -j ACCEPT
-A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp --dport 20 
--tcp-flags SYN,RST,ACK SYN -j ACCEPT


    In my logs, I see this:

kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx 
DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1587 DF 
PROTO=TCP SPT=1186 DPT=21 WINDOW=65338 RES=0x00 ACK PSH URGP=0

kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx 
DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1588 DF 
PROTO=TCP SPT=1181 DPT=21 WINDOW=65196 RES=0x00 ACK PSH URGP=0 

kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx 
DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1589 DF 
PROTO=TCP SPT=1184 DPT=21 WINDOW=65338 RES=0x00 ACK PSH URGP=0 


    The other problem is that, while I can change the FTP port on the 
kiosks, I can't change it on the other end (the receiving and sending) 
so I'm not sure how to handle that part.  They will always attempt to 
connect on the standard FTP port, which two of these machines won't be 
listening to since I would've changed them so they don't conflict with 
one another.  Or is that not so?


-- 
W | It's not a bug - it's an undocumented feature.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / Websmith             .     800.441.3873 x130
  Photo Craft Laboratories, Inc.            .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A.



