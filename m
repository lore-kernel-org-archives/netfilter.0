From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: hosts.deny
Date: Mon, 8 Jul 2002 09:24:06 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA265@JUPITER>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'mtd@mk.cvut.cz'" <mtd@mk.cvut.cz>, netfilter@lists.samba.org

I thought iptables and linux could block spoofed ips anyway.. this is a last
resort..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Martin Tomasek [mailto:mtd@mk.cvut.cz]
Sent: Monday, 08 July 2002 9:20 AM
To: netfilter@lists.samba.org
Subject: Re: hosts.deny


> Every deny spawns my script, my script determines if it's a true attack
and
> can take counter measures like email me and then shutdown the firewall
> etc.etc..

=> DOS

while true;do send_data_which_will_run_your_script;done;

should run _many_ scripts, if not, it could be parallelized.

> Other ways is to run snort or portsentry and others.. I'm happy with my
> script.. it's activated once only because I forgot to allow my VPN user to
> get through... ;) Oops.. Blocked him for a while..

portsentry, which blocks ips => DOS

for a in `seq 1 1000`;do
send_data_which_will_trigger_postsentry_from_spoofed_ips;done;

where spoofed ips are google.com etc, it may include ips from your
network.

-- 
Martin Tomasek, mtd@email.cz
BOFH excuse #49:
Bogon emissions

