From: Greg Cope <gregcope@gmail.com>
Subject: Re: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 17:59:13 +0000
Message-ID: <c0e9781f05012509594af6ebb9@mail.gmail.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F01991D@pxtvjoexd01.pxt.primeexalia.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F01991D@pxtvjoexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I think we are getting there:

The one you suggested gives an error:

Starting firewall: ^[[Aiptables v1.2.9: multiple -o flags not allowed

Looking at tcpdump on a few machines it looks like the packets are
getting through - but nothing gets sent:

17:57:18.168655 ex.e-dba.net.32931 > trotter.e-dba.net.1521: S
965495617:965495617(0) win 5840 <mss 1460,sackOK,timestamp 2026024
0,nop,wscale 0> (DF) [tos 0x10]

And then nothing else - sadly I am not a tcpdump expert.....

Any clues?  I am at a loss as to why this was working and now it does not..... 

Greg


On Tue, 25 Jan 2005 09:46:20 -0800, Gary W. Smith <gary@primeexalia.com> wrote:
> Are you getting the connection coming back?  Try
> 
> $IPTABLES -A FORWARD -o $DMZ_IFACE -o $LAN_IFACE -j ACCEPT
> 
> And see if it makes any difference.  Forward works in both directions.
> We typically allow established,related to return the path that it came
> from.  You might need to do the same.
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
> Sent: Tuesday, January 25, 2005 9:25 AM
> To: netfilter@lists.netfilter.org
> 
> Subject: Re: Help debugging iptables firewall....
> 
> Hi Gary,
> 
> Pinholes?  If you mean specific IP to specific IP:PORT on specfic
> interfaces then yes.
> 
> DB is an oracle listener (port 1521)
> 
> I have these:
> 
> # for ssh to db server from webserver
> $IPTABLES -A FORWARD -p tcp --dport 22 -i $DMZ_IFACE -s $DMZ_EDGE_IP
> -o $LAN_IFACE -d $TROT_IP -j ACCEPT
> 
> $IPTABLES -A FORWARD -p tcp --dport 1521 -i $DMZ_IFACE -s $DMZ_EDGE_IP
> -o $LAN_IFACE -d $TROT_IP -j ACCEPT
> 
> I added 2 of your examples one before one after, and only see:
> 
> Jan 25 17:21:43 gateway kernel: Oracle 1521 [tcp] before: IN=eth1
> OUT=eth2 SRC=192.168.254.3 DST=192.168.0.5 LEN=60 TOS=0x00 PREC=0x00
> TTL=63 ID=30447 DF PROTO=TCP SPT=32907 DPT=1521 WINDOW=5840 RES=0x00
> SYN URGP=0
> 
> Which would imply that the rule is ok and the packets goes through -
> but why I am not getting a connection?
> 
> Thanks,
> 
> Greg
> 
>

