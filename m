From: <tom@then.fr>
Subject: NAT, DROP and walled-gardens =?UTF-8?Q?=28=7E=3D=20captive=20port?=
 =?UTF-8?Q?al=29?=
Date: Tue, 15 Jan 2013 14:13:39 +1000
Message-ID: <bad08547704464d914a571f252e59c40@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hey guys,

*Problem*
I've just hit the deprecation of DROP in the NAT tables.
iptables v1.4.7:
The "nat" table is not intended for filtering, the use of DROP is 
therefore inhibited.

*Context*
- I have a Centos 6.3 acting as router and running iptables.
- It routes traffic in and out.
- It also has different 'walled-gardens' which restrict a source 
IP(s).
- An IP in a 'walled-garden' has for intance the following 
restrictions:
  * Access to a limited set of servers (in house or on the Net).
  * Access to DNS servers
  * Port 80 rewritten to a default server
  * Drop all the rest of the traffic
- I have different kind of gardens with different set of rules to 
restrict IPs (users). A garden must have a default policy set to drop.
- The IP (user) are added and removed from a garden by a software 
using iptables.

With our old Centos4 I was using the following which worked fine:
- Example of a walled-garden definition:
/sbin/iptables -t nat -N garden
/sbin/iptables -t nat -A garden -p udp -m udp --dport 53 -j DNAT --to 
1.1.1.1
/sbin/iptables -t nat -A garden -p tcp -m tcp -d 3.3.3.3 -j ACCEPT
/sbin/iptables -t nat -A garden -p tcp -m tcp --dport 80 -j DNAT --to 
80.80.80.80
/sbin/iptables -t nat -A garden -j DROP

- Definition of the chain where the software will put users in:
/sbin/iptables -t nat -N garden_users
/sbin/iptables -t nat -A PREROUTING -j garden_users

- Add or remove a user in a garden via software with :
/sbin/iptables -t nat -A garden_users -s IP.TO.GAR.DEN -j garden
/sbin/iptables -t nat -D garden_users -s IP.TO.GAR.DEN -j garden

*Question*
Now, as you know we cannot DROP anymore in a NAT table. Therefore my 
gardens are useless because I cannot drop at the end anymore. For the 
moment I really don't see how I can easily have the same behaviour than 
before. I can see a possible solution with more chains that would 
involve the software to iptables -A to different chains which I'd like 
to avoid :)

I'd like to have your insights first to see if there is something 
obvious I cannot see or not fully understanding.

Any ideas are welcome.

Thomas

