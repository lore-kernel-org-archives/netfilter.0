From: Jason Grindlay <jasong@sslnz.com>
Subject: Need help diagnosing iptables MASQ rule issues...
Date: Wed, 09 Jul 2003 10:47:11 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F0B49EF.7030306@sslnz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I've got a Debian 3.0 (Custom kernel 2.4.20 with iptables compiled as a 
module) box that acts as a internet gateway for a LAN, it uses Iptables 
to MASQ internet traffic through an adsl modem.  It's all working 
perfectly (Web, Email, IM, etc ) except one application (FileMaker Pro 5 
on a Mac Powerbook using TCP/IP) which refuses to run even though all 
other programs on that PC work and it worked on the old Router that was 
used before the Linux server was installed (and it works from other 
internet connected offices).

I'm at a bit of a loss as to why it's not running, any ideas on how to 
get it running would be greatlly appreciated.

The FileMaker client in question connects to the remote IP of a server 
on the internet (this PC can connect to that server from any other 
location *but* from behind this Linux router so I think we can say the 
server is ok)  My iptables rules are;

(ppp0 is ADSL Internet connection)

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT
iptables -P INPUT DROP

As far as I've seen and understand this should let anything trying to 
connect from the LAN go out to the internet and whatever is connected to 
reply to the computer that started the connection.

However FileMaker doesn't work under this configuration, when you try to 
start a connect it just hangs for about 5minutes and then reports that 
it can't connect.

I've done a tcpdump on an attempted connection, listening to the LAN 
interface. I searched for the client IP (192.168.168.30) with the 
following results;

13:20:42.341083 192.168.168.30.49156 > 255.255.255.255.5003:  udp 15 (DF)
13:20:44.569266 192.168.168.30.49156 > 255.255.255.255.5003:  udp 15 (DF)
13:21:01.020017 192.168.168.30.49157 > 
219-88-72-214.adsl.xtra.co.nz.5003:  udp 15 (DF)
13:21:01.138752 219-88-72-214.adsl.xtra.co.nz.5003 > 
192.168.168.30.49157:  udp 45 [tos 0x20]
13:21:03.569793 192.168.168.30.49157 > 
219-88-72-214.adsl.xtra.co.nz.5003:  udp 15 (DF)
13:21:03.680958 219-88-72-214.adsl.xtra.co.nz.5003 > 
192.168.168.30.49157:  udp 45 [tos 0x20]
13:21:06.574901 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:21:08.466002 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:21:11.466908 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:21:17.096939 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:21:28.158600 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:21:50.064763 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:22:33.918109 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:23:28.766642 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)
13:24:23.660547 192.168.168.30.49155 > 10.0.0.202.5003: S 
168555040:168555040(0) win 32768 <mss 1460,wscale 0,nop> (DF)


Now I'm no expect on network protocols of how tcpdump reads data being 
MASQed but as far as I read it this is happening;

FileMaker does a broadcast to port 5003 (it's server port) looking for 
local servers. (At start up)

It then tries to connect to the IP address it is given which is 
correctlly routed out through the ADSL IP (it's a dynamic IP so the 
address in the tcpdump output will be assigned to another ISP user by 
now - just in case you get any ideas about hacking me)
Data comes back from the server through the MASQ gateway to the client.

FileMaker then thinks is connected/gets data back from the server (which 
as far as I understand is actually a PC on a LAN (10.0.0.202) behind the 
  router whose remote IP we connect to (port 5003 is forwarded by that 
router to the FileMaker server)  I think this is the point where 
comunication breaks down - I think FileMaker stops trying to connect to 
the Internet IP of the server and tries to connect to it's private LAN 
IP which since it is on a totally different network doesn't work and the 
client sits there trying and trying to reach the server untill it hits a 
timeout.

Am I reading the data right do you think? (I'd just like to confirm I'm 
not jumping to conclusions)

What really puzzles me is why FileMaker suddenlly seems to jump to 
trying to connect to 10.0.0.202 - as far as I understand NAT the fact 
that the server is behind a firewall/nat gateway on the other end should 
be transparent to the client - it should never know it's not talking to 
the router itself.   *AND* the user of FileMaker roams around several 
offices at the rest the setup is the same but with just an off the shelf 
adsl router etc and with no special setup it works perfectlly there....

Any comments/suggestions?  Anybody seen anything like this before?

p.s.  If the client is trying to connect to the private IP of a remote 
server would it be possible to tell Linux to get those packets and 
forward them (stripped to look like they are addressed correctlly) to 
the remote router ip?  I was thinking giving the lan interface a second 
IP of 10.0.0.202 and then forwarding port 5003 to the NET ip of the 
filemaker router, would that work?

-- 
Regards
Jason Grindlay
SSLnz
Phone:  04-473-4666
Fax:    04-472-9450
Mobile: 021-175-6321
http://www.sslnz.com


