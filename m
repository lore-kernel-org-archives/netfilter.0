From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Port Forwarding with iptables
Date: Thu, 19 Aug 2004 14:15:20 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e5040819041560cd7e6c@mail.gmail.com>
References: <412487B7.9090505@digitalview.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

On Thu, 19 Aug 2004 18:57:59 +0800, Wilson Mak
<wilson.mak@digitalview.com> wrote:
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
Take a look at -d param



> However, it keep droping the packets when getting to the NAT box.
> 
> Logs
> ====
> (With iptables -A FORWARD -d 10.1.0.12 -j LOG; iptable -A FORWARD -j DROP)
> 
> kernel: IN=eth0 OUT=eth1 SRC=202.xxx.122.xxx DST=10.1.0.12 LEN=48
> TOS=0x00 PREC=0x00 TTL=120 ID=6491 DF PROTO=TCP SPT=4023 DPT=80
> WINDOW=64240 RES=0x00 SYN URGP=0
Now look at DST,

Q: Do they match? :)

 
> Any clues?  Did I miss something here?
> 
> Thanks,
> Wilson
> 
> 


-- 
Bla bla

