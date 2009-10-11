From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Port Forwarding
Date: Sat, 10 Oct 2009 21:36:25 -0400
Message-ID: <1255224985.385.20.camel@jaspav.missionsit.net.missionsit.net>
References: <1572887654.20091011013039@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1572887654.20091011013039@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jen140@gmail.com
Cc: netfilter@vger.kernel.org

On Sun, 2009-10-11 at 01:30 +0100, jen140@gmail.com wrote:
> Hello.
> I am running Debian(5.0.3), and have kernel version: 2.6.26-2-686.
> And I have just installed the iptables v1.4.5.
> After  searching for help on debian and ubuntu forums, i didnt get any
> response, so I'm writing here.
> My network configuration is next:
> eth0 is my internet interface and has dinamic ip(83.x.x.x).
> eth1 is my intranet interface and has static ip(192.168.0.1).
> The server machine(thise pc) shares internet with other machines.
> At debian start iptables has the next config:
> iptables -P FORWARD ACCEPT
> iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> So now getting to the problem.
> I  wanted  to configure port forwarding, and forward port 135 from Any
> address  that  comes from eth0 (internet) to ip 192.168.0.200 and same
> port(135).
> I've tryied running the next:
> iptables -F
> iptables -t nat -F
> iptables -P FORWARD ACCEPT
> iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> iptables --table nat -A PREROUTING --in-interface eth0 -j DNAT -p tcp --dport 135 --to 192.168.0.200:135
> But   the   problem   is   that  it  is  filtered  (I  check  it  with
> nmap-online.com service).
> Am i doing anything wrong or my kernel doesnt support it ?
> Thanks in advance.
> Have a good day.
<snip>
Have you checked to make sure the rule is actually loading (iptables -v
-n -t nat -L PREROUTING)? I haven't checked it but I'm not sure if you
need to place the argument to DNAT immediately after it for it to be
understood, in other words:
iptables -t nat -A PREROUTING -i eth0 -p 6 --dport 135 -j DNAT
--to-destination 192.168.0.200

I'd also be very careful about allowing Internet access to port 135; it
is a very dangerous port.  It also tends to then map the service to
another port - how will you allow that port in?

I also usually do not set the FORWARD POLICY to ACCEPT.  I set it to
DROP and then explicitly allow any traffic from the outside world in.
Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

