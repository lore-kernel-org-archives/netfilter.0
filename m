From: "Diana Asnani" <sakal_woman@hotmail.com>
Subject: same prob again...cannot ping 202.184.41.41
Date: Wed, 21 Jun 2006 15:03:16 +0800
Message-ID: <BAY19-F233ECF40C109704F4C0AAC9E840@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

this time is about iptables...previously, i posted about routing issues and 
i got quite a lot of response on that...

ok, i still could not ping 202.184.41.41 from my IP, 192.168.202.1...i could 
not add this "route add -net 202.184.41.0/24 gw 192.168.202.1" in my routing 
table because my default gateway is set as 192.168.202.14 in the vlan 
configuration....and yes ipv4 forwarding is enabled in /etc/sysctl.conf...I 
could always ping 192.168.206.1 because we are in the same vlan...but with 
my gateway as 192.168.202.14 because its connected to the 
vlan...192.168.206.1 is in the same PC with 202.184.41.41...

the PC router 202.184.41.41/192.168.206.1 ( the PC router ) did NAT and 
added this in the iptables:
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 202.184.41.41

is there anything  else that i should do to make the PC 192.168.202.1 to 
ping 202.184.41.41?? I'm really devastated with this problem...hope you guys 
could help....


Diana

_________________________________________________________________
Get your mobile ringtones, operator logos and picture messages from MSN 
Mobile http://msn.smsfactory.no/


