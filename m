From: James MacLean <macleajb@ednet.ns.ca>
Subject: Re: Private traffic seen on public NATed interface - Linux 2.6.10-11
 tested
Date: Wed, 16 Mar 2005 08:49:04 -0400
Message-ID: <42382B40.1060108@ednet.ns.ca>
References: <423737E2.4050201@ednet.ns.ca> <42374547.7030204@fastwebnet.it>
	<42374B1B.4090901@ednet.ns.ca> <4237EC2D.4050807@fastwebnet.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020401010603010306090308"
In-Reply-To: <4237EC2D.4050807@fastwebnet.it>
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
To: Francesco Ciocchetti <primero@fastwebnet.it>, NetFilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------020401010603010306090308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Francesco Ciocchetti wrote:

> James MacLean wrote:
>
>> There is a session properly NATed between the client and the server. 
>> It just happens that some traffic in that session escapes from being 
>> NATed on it's way from the client (private IP space) to the server. 
>> How far it gets we do not know :).
>
>
> the problem is that some traffic can't excape from session :)
> I mean, the NAT table in netfilter is match only once per session. The 
> first packet is SNATted or DNATted , then all sequent packets of the 
> same connection does not touch the nat table , instead it is NATTED 
> based on connection tables.

Understood. And please excuse my lack of technical knowledge about the 
whole ip_conntrack experience :). We here are long time users and have 
never seen this situation before. Especially on multiple boxes. So I 
thought it was best to get the info out to this list in case there is 
more to it then bad configuration on our part ;(. If it was only 
occurring on one box, we'd kick it around more, but it appears to be a 
little more pronounced ;).

> I have a 2.6.11 firewall , that was a 2.6.10 before, and i never had 
> such an experience ... my packets never escaped from session table :)
>
Ok. But then explain how _any_ traffic can get through unNATed via a 
table where all private IPs are SNATed according to the rules. This is 
what we can not understand. Even adding an SNAT to the very top of the 
POSTROUTING chain didn't help.

We only tripped over this by accident. Otherwise, we'd still not have 
any clue that this was happening.

> I would try to flush iptables rules and try with just a few rules with 
> NAT to check if it does work or not ... then insert your rules by step 
> until you find where your problems lives.

Appreciate your thoughts. These sites are a bit to busy to probably do 
it that way, but we'll see if we can get a controlled environment to 
test in.

Some more dump, just for fun :)...

08:30:11.100766 IP 10.0.5.243.1270 > 63.250.195.12.http: F 
3707121597:3707121597(0) ack 502138606 win 64970
08:30:17.054926 IP 142.177.51.51.36703 > 63.250.195.12.http: S 
978075472:978075472(0) win 5840 <mss 1460,sackOK,timestamp 1145498148 
0,nop,wscale 2>
08:30:17.136969 IP 63.250.195.12.http > 142.177.51.51.36703: S 
1839730991:1839730991(0) ack 978075473 win 65535 <mss 1460,nop,wscale 
1,nop,nop,timestamp 1702037157 1145498148>
08:30:17.136998 IP 142.177.51.51.36703 > 63.250.195.12.http: . ack 1 win 
1460 <nop,nop,timestamp 1145498230 1702037157>
08:30:17.137710 IP 142.177.51.51.36703 > 63.250.195.12.http: P 
1:552(551) ack 1 win 1460 <nop,nop,timestamp 1145498230 1702037157>
08:30:17.221654 IP 63.250.195.12.http > 142.177.51.51.36703: F 
521:521(0) ack 552 win 33304 <nop,nop,timestamp 1702037165 1145498230>
08:30:17.221695 IP 142.177.51.51.36703 > 63.250.195.12.http: . ack 1 win 
1460 <nop,nop,timestamp 1145498314 1702037157>
08:30:17.221777 IP 63.250.195.12.http > 142.177.51.51.36703: P 
1:521(520) ack 552 win 33304 <nop,nop,timestamp 1702037165 1145498230>
08:30:17.221799 IP 142.177.51.51.36703 > 63.250.195.12.http: . ack 522 
win 1728 <nop,nop,timestamp 1145498315 1702037165>
08:30:17.222489 IP 142.177.51.51.36703 > 63.250.195.12.http: F 
552:552(0) ack 522 win 1728 <nop,nop,timestamp 1145498315 1702037165>
08:30:17.304268 IP 63.250.195.12.http > 142.177.51.51.36703: . ack 553 
win 33304 <nop,nop,timestamp 1702037174 1145498315>
08:30:32.472154 IP 10.0.4.10.2107 > 63.250.195.12.http: F 
3949942874:3949942874(0) ack 724796989 win 63967
08:30:34.730636 IP 10.0.4.10.2107 > 63.250.195.12.http: F 0:0(0) ack 1 
win 63967
08:30:39.345472 IP 10.0.4.10.2107 > 63.250.195.12.http: F 0:0(0) ack 1 
win 63967
08:30:48.577198 IP 10.0.4.10.2107 > 63.250.195.12.http: F 0:0(0) ack 1 
win 63967
08:31:07.039327 IP 10.0.4.10.2107 > 63.250.195.12.http: F 0:0(0) ack 1 
win 63967
08:31:43.960191 IP 10.0.4.10.2107 > 63.250.195.12.http: F 0:0(0) ack 1 
win 63967

This traffic happens to include both interfaces, but the last spurt from 
10.0.4.10 shows up on the public side of the interface. This box runs 
squid incase you were wondering why there was not a direct handoff per 
packet, but other boxes with this problem are not running squid.

May I suggest someone else even try it at home :), or on a half busy 
box? We _are_ honestly seeing this at different sites with different 
rules, but with the common SNAT for private IP space.

We are just dumping traffic to watch using tcpdump: tcpdump -i <public 
interface> -n net 10.0.0.0/8 or net 192.168.0.0/16

thanks again,
JES

--------------020401010603010306090308--

