From: Alexis <alexis@attla.net.ar>
Subject: Re: Connecting from Internet to a system behind a NAT on a LAN possible ?
Date: Sat, 21 Feb 2004 19:53:46 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1999421900.20040221195346@attla.net.ar>
References: <40374E6C.6050500@randodetente.org>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40374E6C.6050500@randodetente.org>
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
To: =?ISO-8859-15?B?TWFyYyBSZWNodOk=?= <mrechte@randodetente.org>
Cc: netfilter@lists.netfilter.org

Yes. with DNAT in the PREROUTING chain in the nat table.


ex fowarding tcp/25 connectios an the public address into 192.168.1.2
in the LAN


echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -P FORWARD ACCEPT
iptables -t nat -A PREROUTING -s local.ip.from.theisp -p tcp --dport
25 -j DNAT --to 192.168.1.2:25


and it should be working.



Hello Marc,

Saturday, February 21, 2004, 9:26:20 AM, you wrote:

MR> A LAN is equipped with an Internet gateway using NAT to share the one IP
MR> address assigned by the ISP. The problem is to be able from Internet to
MR> connect to one of the interfaces located on the LAN (which local IP
MR> addresses are unknown from Internet).

MR> Can netfilter help to solve such a problem ?

MR> Many thanks for your help.

MR> Marc.



-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar


