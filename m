From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: unknown arg --syn
Date: 02 Jan 2003 14:53:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041499429.12949.7.camel@india>
References: <Pine.LNX.4.44.0212311833100.20073-100000@soldier.beechtree.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0212311833100.20073-100000@soldier.beechtree.ca>
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
To: Keith Mastin <kmastin@beechtree.ca>
Cc: netfilter@lists.netfilter.org



On Wed, 2003-01-01 at 05:07, Keith Mastin wrote:
> This should be so simple, yet it's eluding me... a simple iptables script 
> on a protected machine, with a few rules where the syn flag is set 
> returns an error:
> 
> rule example (lives all on one line in script):
>  iptables -A INPUT -p tcp -s 0/0 -d 192.168.0.167/32 --destination-port 22 
>   --syn -j ACCEPT
> 
> the error when the script is run:
>  [root@spy root]# sh ./iptables-rules 
>  iptables v1.2.5: Unknown arg `--syn'
>  Try `iptables -h' or 'iptables --help' for more information.
> 
> sure enough, no mention of --syn in iptables -h
> 
> from man iptables:
>  [!] --syn
>  Only match TCP packets with the SYN bit set and the ACK and FIN bits 
>  cleared.  Such packets are used to  request  TCP  connection initiation;  
>  for  example,  blocking  such packets coming in an interface will prevent 
>  incoming TCP connections, but outgoing TCP connections will be 
>  unaffected.  It is equivalent to --tcp-flags SYN,RST,ACK SYN. If the "!"  
>  flag  precedes  the  "--syn", the sense of the option is inverted.
> 
> I also replaced --syn with --tcp-flags SYN,RST,ACK SYN, which resulted in 
> the error:
>  [root@spy root]# sh ./iptables-rules
>  iptables v1.2.5: Unknown arg `--tcp-flags'
>  Try `iptables -h' or 'iptables --help' for more information.
> 
> I think I'm too close to see the solution, so if anybody can see it right 
> off, it would be much appreciated...
> 
> System info:
> Redhat 7.3
> kernel-2.4.18-19.7.x.athlon
> 
> Also tried on another system with similar results:
> Redhat 7.3
> kernel-2.4.18-3smp
> 
> TIA
> 
> 
> 
This is working fine on my Linux box. Could you give me the list of the
modules that your kernel supports? Try compiling new version of iptables
. 
I am using iptables 1.2.6a and kernel version 2.4.18-14



-- 
Dharmendra.T
Linux Enthu 


