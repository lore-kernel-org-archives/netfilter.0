From: ml@proficuous.com
Subject: PLEASE HELP with DNAT problem
Date: Thu, 30 Oct 2003 20:18:28 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4210.209.134.141.210.1067566708.squirrel@webmail.proficuous.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've been beating my head against this for a while now and so it's time to
ask for help.

(before i get flamed more more than i should..yes i know that the 172
addresses aren't really routable...but i wasn't comfy just tossing out my
public IPs)

My ascii art sux, so i'll just try to describe what i have going on.  I
have a firewall/router that has three interfaces.  interface serial0 is
the connection to our T1, interface eth0 is the connection to the DMZ with
ips 10.1.1.16/28 and eth1 is our lan interface with 204.181.247.0/24 which
are source natted to the serial0 address. (yes, i know these are routable,
but they used to own them and when they lost them they were too lazy to
walk around and change them to a private addressing scheme).

To further complicate things, the company has 16 routable addresses,
172.16.0.16/28 that they map directly to the 10.1.1.16/28 addresses. I
then have to SNAT anything coming out of the 10.1.1.16/28 network to it's
172 conterpart.

My problem arises due to the fact that the company demands to run some
servers on the lan, against my advice, and although i'm getting the DNAT
into serial0 to work just fine, I tried to DNAT the lan back to itself and
it just isn't working..i know this is some trivial thing that i've missed,
but it's killing me.

so..here's the scenario...  $RANDOM_OUTSIDE_IP ----> 172.16.0.18:8001 --->
DNAT to 204.181.247.34:80   works great.....

                           BUT

204.181.247.x/24 ----> 172.16.0.18:8001 --->  DNAT to 204.181.247.34:80  
CRAPS out...it ends up getting sent to the 10.1.1.18 address because of
the PREROUTING rules further down that are mapping the 172.16.0.16/28
addresses to the DMZ addresses.

As a side note... because i do have rules that DNAT every 172.16.0.16/28
address to a 10.1.1.16/28 address  i tried my DNAT rules that pointed back
to the same network with both the 10.1.1.x and the 172.16.0.x addresses.

i.e.  iptables -t nat PREROUTING -i eth1 -d 172.16.0.25 -p tcp --dport
8001 -j DNAT --to-destination 204.181.247.34:80
and
iptables -t nat PREROUTING -i eth1 -d 10.1.1.25 -p tcp --dport 8001 -j
DNAT --to-destination 204.181.247.34:80

Here is a listing from iptables -t nat -L nv

pkts bytes target     prot opt in     out     source              
destination
    1    60 DNAT       tcp  --  eth1   *       0.0.0.0/0           
172.16.0.25     tcp dpt:8001 to:204.181.247.80:80
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0           
172.16.0.18     tcp dpt:8001 to:204.181.247.80:80
    1    60 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.25     tcp dpt:8001 to:204.181.247.80:80
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.18     tcp dpt:8001 to:204.181.247.80:80
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.18     tcp dpt:21 to:204.181.247.7
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.25     tcp dpt:22 to:204.181.247.79:22
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.18     tcp dpt:5051 to:204.181.247.7:5051
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.25     tcp dpt:5051 to:204.181.247.7:5051
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.17     tcp dpt:8888 to:204.181.247.241:8888
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.17     tcp dpt:5555 to:204.181.247.79:5555
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.20     tcp dpt:5555 to:204.181.247.79:5555
    4   176 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.25     tcp dpt:80 to:204.181.247.2:80
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
172.16.0.27     tcp dpt:80 to:204.181.247.80:80
    0     0 DNAT       tcp  --  serial0 *       0.0.0.0/0           
209.134.141.210    tcp dpt:22 to:204.181.247.5
   46  3594 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.17     to:10.1.1.17
   49  3750 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.18     to:10.1.1.18
   47  3686 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.19     to:10.1.1.19
   45  3554 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.20     to:10.1.1.20
   51  4106 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.21     to:10.1.1.21
   47  3686 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.22     to:10.1.1.254
  350 21540 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.23     to:10.1.1.23
   67  5105 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.24     to:10.1.1.24
   60 16198 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.25     to:10.1.1.25
   45  3554 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.26     to:10.1.1.26
   52  4198 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.27     to:10.1.1.27
   51  4106 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.28     to:10.1.1.28
   47  3686 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.29     to:10.1.1.29
   54  4330 DNAT       all  --  serial0 *       0.0.0.0/0           
172.16.0.30     to:10.1.1.30
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.17     to:10.1.1.17
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.18     to:10.1.1.18
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.19     to:10.1.1.19
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.20     to:10.1.1.20
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.21     to:10.1.1.21
    0     0 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.22     to:10.1.1.254
   51  2448 DNAT       all  --  eth1   *       0.0.0.0/0           
172.16.0.23     to:10.1.1.23


Any help would be so greatly appreciated.  Any additional information
needed, just let me know.

Sincerely,

Aaron P. Martinez

