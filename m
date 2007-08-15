From: Warpme <warpme@o2.pl>
Subject: Re: error - but I don't know where....
Date: Wed, 15 Aug 2007 14:38:06 +0200
Message-ID: <46C2F3AE.2020505@o2.pl>
References: <42a76351.4ca18173.46c17ceb.6b792@o2.pl>
	<46C18BC1.3010600@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050907030003080402070207"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C18BC1.3010600@freemail.hu>
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
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050907030003080402070207
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

Gaspar,

Thanx for trying help !
It looks like I found problem. Probably somewhere in file was non-ASCII=20
chars which are not visible in my editor and causing problem.
I rewrite manually script and now works as expected :-)
I also change little bit approach: default policy for FORWARD chain is=20
now DROP.
I'm allowing forwarding only new connections from LAN to WAN and accept=20
only already established
connections from WAN to LAN:
iptables -A FORWARD -i $WAN_intf -o $LAN_intf -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $LAN_intf -o $WAN_intf -m state --state=20
NEW,ESTABLISHED,RELATED -j ACCEPT
=20

BTW: I have some comments to Your hints (see inline):

br

G=E1sp=E1r Lajos wrote:
> warpme =EDrta:
>> Hi *
>>
>> I just try setup firewall. Config is following:
>>
>> Desktop               Firewll  (192.168.1.1) ------Eth0  =20
>> Eth1(91.189.74.10)---------ISP
>>
>> Script below is working OK for all LAN hosts, but not for for=20
>> firewall PC itself (i tested it with i.e. ping www.ibm.com)
>> Commenting line "iptables -P INPUT DROP" allows to ping from=20
>> firewall, but it effectivelly turning off firewall....
>> It is probably simple error - but I can't find where it is...
>> Can somebody verify thid script and tell me what is wrong ?
>>
>> thx in advance
>> =20
>> #Config area=20
>> BEGIN--------------------------------------------------------------
>>
>> LAN_intf=3Deth0
>> LAN_subnetwork=3D192.168.1.0/255.255.255.0
>>
>> WAN_intf=3Deth1
>> WAN_ip=3D91.189.74.10
>>
>> Open_WAN_TCP_ports=3D20,21,80,500,1352,4500
>> Open_WAN_UDP_ports=3D500,1352,4500,5060
>> Open_WAN_RTP_port_range=3D7070:7080
>>
>>
>> #Config area=20
>> END----------------------------------------------------------------
>>
>>
>>
>>
>> #--Flushing all iptables=20
>> tables-------------------------------------------------
>> iptables -F
>> iptables -X iptables -t nat -F
>> iptables -t nat -X
>> iptables -t mangle -F
>> iptables -t mangle -X
>>
>>
>>
>>
>> #--Setting up SNAT for outgoing to WAN DATA=20
>> connections------------------------
>> iptables -t nat -A POSTROUTING -s $LAN_subnetwork -o $WAN_intf -j=20
>> SNAT --to-source $WAN_ip=20
> I would write like this:
>
> iptables -t nat -A POSTROUTING ! -s $WAN_ip -o $WAN_intf -j SNAT=20
> --to-source $WAN_ip
I'm understand advantage of such approach is that any non WAN_ip host=20
will be NAT'ed. But for non-LAN addressed hosts it will require=20
additional entries in routing table for packets received from WAN and=20
destinated to LAN host. Effectively  it will require  touch to firewall=20
- and by this I'm considering this as no beneficial.
>>   #--Allowing self access by loopback=20
>> interface----------------------------------
>> iptables -A INPUT -i lo -p all -j ACCEPT
>>
>>  =20
> "-p all" not needed...  And I would rather set up the OUTPUT rule than=20
> the INPUT rule because the "lo" interface only accepts connections=20
> from itself... if a new connection is made then first step is to send=20
> OUT something to the other host... :D
> iptables -A OUTPUT -o lo -j ACCEPT
Well, default iptables policy for all chains is ACCEPT, so this rule is=20
redundant.
>
>>
>> #--Allowing local access to=20
>> LAN------------------------------------------------
>> iptables -A INPUT -i $LAN_intf -p all -j ACCEPT
>>
>>  =20
> no need for "-p all"
Right !
>
>>
>> #--Allowing WAN incoming traffic form already established=20
>> connections----------
>> iptables -A INPUT -i WAN_intf -m state --state ESTABLISHED,RELATED -j=20
>> ACCEPT
>>
>>
>> #--Allowing WAN incoming traffic for desired=20
>> services--------------------------
>> #Open WAN TCP ports
>> iptables -A INPUT -p tcp -i $WAN_intf -m multiport --dport=20
>> $Open_WAN_TCP_ports -j ACCEPT
>>
>> #Open WAN UDP ports
>> iptables -A INPUT -p udp -i $WAN_intf -m multiport --dport=20
>> $Open_WAN_UDP_ports -j ACCEPT
>>
>> #Open VoIP UDP port ranges
>> iptables -A INPUT -p udp -i $WAN_intf --dport=20
>> $Open_WAN_RTP_port_range -j ACCEPT
>>
>>  =20
> For "ping" you need the following line:
> iptables -A INPUT -p icmp -j ACCEPT
Well - it is not needed when only outgoing pings are allowed (my case).
I think incoming pings should be rather disabled - it will  help to=20
protect host from potential DoS via ping flood.
>> #--Drop all other incoming connection. Only above will be=20
>> allowed-------------
>> iptables -P INPUT DROP
>>   =20
>>
>>  =20
>
>
>


--------------050907030003080402070207--

