From: "Michael P. Ryan" <mryan@mail.arc.nasa.gov>
Subject: Re: strange problem.
Date: Tue, 21 Jan 2003 14:38:26 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0E88F7C6-2D91-11D7-9D04-0003934AB744@mail.arc.nasa.gov>
References: <200301172045.02921.Alistair@nerdnet.ca>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301172045.02921.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

My Mistake, thank you for clarifying that.

  I have managed to make it a bit further with my problem. I can get a 
forward working locally from external ip to internal ip on the same 
box, but when I try to create a forward to a system on the internal lan 
I run into problems.

I run:

iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 223 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A PREROUTING -t  nat -p tcp -d my.external.ip --dport 223 -j 
DNAT --to 192.168.0.13:5800

when I try:
telnet my.external.ip 22it hangs and I see the following via dmesg:

IN=eth0 OUT=eth1 SRC=my.external.ip DST=192.168.0.13 LEN=44 TOS=0x10 
PREC=0x00 TTL=56 ID=63199 DF PROTO=TCP SPT=50082 DPT=5800 WINDOW=32768 
RES=0x00 SYN URGP=0

eventually the connection times out.


Any ideas?


Thanks,
Mike

On Friday, January 17, 2003, at 05:45 PM, Alistair Tonner wrote:

>
>
> 	Why would it show as open in netstat? .. .there is no *service*
> 	listening on that port.   The prerouting will simply mangle the
> 	packet so that it gets routed to the destination ... You are not 
> opening
> 	a port on the firewall, you are telling the firewall to take packets 
> that
> 	show up at that port and ip and punt them around the corner ....
>
> 	Alistair
>
>
> On January 17, 2003 01:31 pm, Michael P. Ryan wrote:


