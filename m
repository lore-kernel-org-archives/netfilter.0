From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RST packet logged
Date: Wed, 11 Sep 2002 13:05:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111205.g8BC5cv08444@vulcan.rissington.net>
References: <3321.213.13.176.13.1031736800.squirrel@www.ipatimup.up.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3321.213.13.176.13.1031736800.squirrel@www.ipatimup.up.pt>
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

On Wednesday 11 September 2002 10:33 am, Miguel Carvalho wrote:

> Hi,
>
> We are having some trouble with dropped packets.
>
> Our forward chain( internal net->public net ) doesnt have any out
> constraints.
> Our internal network, uses a web proxy at xx.xx.xx.01 port 8080
> Our proxy connections are running almost fine.
>
> The firewall public interface IP is xx.xx.xx.138.
>
> This is what i get at the logs:
>
> Firewall:Drop packet IN=eth0 OUT=
> MAC=00:06:5b:3c:1a:27:00:50:04:52:1a:04:08:00 SRC=xx.xx.xx.01
> DST=xx.xx.xx.138 LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=7816 PROTO=TCP
> SPT=8080 DPT=42921 WINDOW=0 RES=0x00 RST URGP=0
>
> Why is the firewall just dropping packets that have RST flag activated?
> We are running  iptables-1.2.3-1 on a RedHat 7.2.

Maybe it wasn't the first RST packet on this connection, and as soon as 
netfilter saw the first one, it removed the connection from the conntracking 
table, then when it saw the second one it thought "this doesn't match a 
current connection" so it couldn't forward it and dropped/logged it instead.

What do you mean by "our proxy connections are running *almost* fine" ?

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

