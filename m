From: Nick Drage <nickd@metastasis.demon.co.uk>
Subject: Re: Port Forwarding with iptables
Date: Thu, 19 Aug 2004 12:22:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040819112216.GN29471@metastasis.org.uk>
References: <412487B7.9090505@digitalview.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <412487B7.9090505@digitalview.com>
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

On Thu, Aug 19, 2004 at 06:57:59PM +0800, Wilson Mak wrote:
> Hi all,
> 
> I like to do the portforwarding with iptables(forward web traffic of an 
> alias IP - <ext ip> to internal web server).  Here is what I have:
> 
> iptables -t nat -A PREROUTING -i eth0 -d <ext ip> -p tcp --dport 80 -j
> DNAT --to 10.1.0.12:80
> iptables -A INPUT -p tcp -i eth0 -d <ext ip> --dport 80 -m state
> --state NEW -j ACCEPT
> iptables -A FORWARD -p tcp -i eth0 -o eth1 -d <ext ip> --dport 80 -m
> state --state NEW -j ACCEPT
> 
> However, it keep droping the packets when getting to the NAT box.
> 
> Logs
> ====
> (With iptables -A FORWARD -d 10.1.0.12 -j LOG; iptable -A FORWARD -j DROP)
> 
> kernel: IN=eth0 OUT=eth1 SRC=202.xxx.122.xxx DST=10.1.0.12 LEN=48
> TOS=0x00 PREC=0x00 TTL=120 ID=6491 DF PROTO=TCP SPT=4023 DPT=80
> WINDOW=64240 RES=0x00 SYN URGP=0
> 
> Any clues?  Did I miss something here?

( caveat, this is a quick email during a lunch break at work, so it's
all "best guess" )

The rules in the PREROUTING table are executed before those in the
FORWARD table, so the packet has a destination of 10.1.0.12 when it hits
the FORWARD table.  So your third line should be

iptables -A FORWARD -p tcp -i eth0 -o eth1 -d 10.1.0.12 --dport 80 -m
state --state NEW -j ACCEPT

Let me know how you get on :)


-- 
"I think a church with a lightning rod shows a decided lack of confidence"

