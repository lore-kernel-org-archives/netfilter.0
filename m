From: Unknown <unknown@unknown.invalid>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 21:33:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11606.1662709855$1073615876@news.gmane.org>
References: <FE0E2967-4215-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <FE0E2967-4215-11D8-AFEE-000393677A36@porchlight.ca>
Content-Disposition: inline
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
To: Peter Schobel <pschobel@porchlight.ca>, netfilter@lists.netfilter.org

On January 8, 2004 03:05 pm, Peter Schobel wrote:
> ok, I downloaded the source ball for iptables 1.2.9, and compiled using
>
> make KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>
> i got an error from config.h telling me to use the glibc version so i
> symlinked /usr/src/linux-2.6.0-1.107 to /usr/include/linux/config.h
>
> then i compiled successfully and installed using
>
> make install KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>
> without incident
>
> i checked the timestamp on the iptables binary to make sure that it had
> been overwritten
>
> I rmmod'd all the iptables modules and then reloaded my iptables rule
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>

	Ummm ... I don't understand where the error came from.... I'm using a slackware based box with many upgrades
	(gcc glibc binutils and modutils....) my switch from 2.4.23 to 2.6.0 required a binutils and modutils
	upgrade FIRST -- I would hope that RPM dependencies are in place to enforce this as it will likely
	apply to your situation ... when I rebuilt iptables source it went painlessly --- no error from config.h.

	I *DONT* like the relink .. I've a feeling this will break some inportant defines....
	
	what do you get for modprobe --version and ld -v ?
	I suspect your modutils is incorrect for 2.6.0

> lsmod gives me
>
> Module                  Size  Used by
> ipt_REDIRECT            2048  1
> iptable_nat            20140  2 ipt_REDIRECT
> ip_tables              15104  2 ipt_REDIRECT,iptable_nat
> ip_conntrack           28464  2 ipt_REDIRECT,iptable_nat
>
> iptables -t nat -L gives me
>
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> REDIRECT   tcp  --  anywhere             anywhere            tcp
> dpt:http redir ports 3128
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> testing it reveals that it is still not working - did i do anything
> wrong in the above steps? what further steps would you recommend to
> troubleshoot this problem?
>
> Peter Schobel
> ~

