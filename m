From: Nejc Skoberne <nejc.skoberne@guest.arnes.si>
Subject: DNAT
Date: Mon, 8 Sep 2003 16:40:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <19331451164.20030908164015@guest.arnes.si>
Reply-To: Nejc Skoberne <nejc.skoberne@guest.arnes.si>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi.

I have a problem with DNAT. I want to set up portforwarding. In local
network I have two servers and workstations. One (main) server is listening
at some port, let's say 4444. The other one also acts like a gateway
to internet and I set up a portforwarding like this:

iptables -A PREROUTING -p tcp --dport 4444 -j DNAT --to 192.168.1.1:4444

where 192.168.1.1 is the IP of the main server which runs the service.
If I try to connect from outside, everything works fine. If I try to
connect from one of workstations to the gateway machine to port 4444,
nothing happens. tcpdumps shows just requests but no answers. Why
doesnt DNAT work also for local IP addresses?

Thanks.

-- 
Nejc Skoberne
Grajska 5
SI-5220 Tolmin
E-mail: nejc.skoberne@guest.arnes.si


