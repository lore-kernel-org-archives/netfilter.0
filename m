From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Internal machines can't resolve external addresses
Date: Wed, 12 Jun 2002 13:23:09 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <001601c211c0$79a5d7a0$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Yo just answered your own Question ... lol

no Internal MAchines will not be able to go out through your NAT box and
back in

thats just unethical and a big waste of Traffic ...

so do what i do and run a local Bind 9 DNS on your internal

LAN , and set it up so it forwards requests to your ISP's DNS server

or one / many of OpenNICS Servers ... (OpenNIC is a free Domian Name Server
Service )

then setup all your machines to use it as the DNS server for the Internet
(yes even the IPTABLES box if  ya want, even easier just Set up

Bind 9 on your Firewall Box and set bind to only answer to requests on your
Local LAN, and please if your going to do this make sure

you are running Bind9 (DNS Daemon) as a Sercure User/Group that has basiclly
no privliges ei (named)

last but not least you would the have to edit your /etc/reslove.conf on your
Firewall box and set the nameserver to your internal

Ethernet Card IP and for Secondary add  127.0.0.1 (localhost) ..... yay
... :D

you will find this runs great ... If you run into problems feel free to send
me an EMAIL ...  hard__ware@hotmail.com

im on my computer 24/7 (yes with no sleep so please dont piss me off  with
SPAM ... :P )


