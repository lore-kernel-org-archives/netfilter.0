From: "Alexis" <alexis@attla.net.ar>
Subject: Re: Filtered Port 21 somewhat open - iptables weirdness?
Date: Sat, 24 Jan 2004 11:39:46 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c3e287$ea1f5490$0200000a@heretic>
References: <20040124014842.GA9219@localnet>
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
To: netfilter <netfilter@lists.netfilter.org>

try using 

netstat -tupan and see wich process is using that port. if any.



----- Original Message ----- 
From: "Sven Riedel" <sr@gimp.org>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 23, 2004 10:48 PM
Subject: Filtered Port 21 somewhat open - iptables weirdness?


> Hi,
> one of the machines I administer to is running iptables with an input
> policy of drop, and allows only a few, selected services. Ftp is most
> definitely not among them, and there is no ftp server installed on the
> machine in question. 
> 
> nmap -P0 -sS reports that among the expected, port 21 is open.
> telnetting to port 21 shows indeed a successful connect:
> radagast@angmar:~>telnet <machine> 21
> Trying <ip>...
> Connected to <machine>
> Escape character is '^]'.
> ^]
> telnet> quit
> 
> But it just sits there, no welcoming banner, no response to obvious
> ascii-commands.
> 
> At the same time the kernel logs report that my telnet packets are being
> blocked by iptables. hping2 -A gets reset packets from that port as
> well, as if it weren't filtered, while amap shows me nothing of value. 
> 
> Is this maybe some ip_conntrack weirdness? I already sweeped the machine
> as well as I could and so far I came up with no indication for a rootkit
> or backdoor. 
> 
> Regs,
> Sven
> -- 
> Sven Riedel                      sr@gimp.org
> Liebigstr. 38 
> 30163 Hannover                  "Python is merely Perl for those who
>                                  prefer Pascal to C" (anon)
> 
> 


