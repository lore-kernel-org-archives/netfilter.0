From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Netfilter Denies everything, even --Policy ACCEPT
Date: Sun, 16 May 2004 10:46:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161046.19481.Alistair@nerdnet.ca>
References: <KIEKJEOOGJONEKMFNHLHCELLCHAA.conradw@vdmb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <KIEKJEOOGJONEKMFNHLHCELLCHAA.conradw@vdmb.com.au>
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
To: netfilter@lists.netfilter.org

On May 16, 2004 01:27 am, VDMB mail wrote:
> Hi,
>
> IPTABLES is blocking all network traffic, whilst all connections work fine
> without it.
>
> Setup : Redhat 8 / 2.4.18-27.8.0  with HP Raid driver patch. (I hope this
> is not a cause of the problem.)
>
> IPtables version v1.2.8
>
> Without iptables, i.e. stopping the service  '/etc/init.d/iptables stop'
> everything works and communicates fine. Ping anything on my network, and
> the loopback interface just nicely.
>
> When starting the service '/etc/init.d/iptables start' any form of network
> communication is totally blocked, even with the following (BUT VERY OPEN)
> script;
>
> iptables --flush
> iptables --policy INPUT ACCEPT
> iptables --policy OUTPUT ACCEPT
>
> iptables -A INPUT -j LOG
> iptables -A OUTPUT -j LOG
>
> Have checked services with chkconf, iptables is running, as well as echo,
> in fact most things are, although there is no ipchains present(thus no
> clash). Have checked ps -aux, syslogd, klogd and xinetd are all running.	

	This is all good info -- thanks...  I will post a caveat -- I don't run 
redhat myself, so I'm not *too* up on the startup scripts and checkconf 
functions.... 

	We are missing a few things, -- is this box doing any forwarding? 
	and if so what are the network details (you don't have to post real 
	i.p's just enough that we can see segments and masks, and get ideas
	for routing requirements)

>
> Output from 'iptables -L' is;
>
> Chain INPUT(policy ACCEPT)
> LOG 	all -- anywhere 	anywhere 	LOG level debug prefix 'Trace INPUT: '
> Chain FORWARD(policy DROP)
> Chain OUTPUT (policy ACCEPT)
> LOG 	all -- anywhere 	anywhere 	LOG level debug prefix 'Trace OUTPUT: '
>
> Output from ping (for any ip address) is;
> ping 127.0.0.1
> ping: sendmsg: Operation not permitted


	Okay .. .obviously you have a networking problem here - can you post the 
following info after the script has started up ..
	
	What is the result of :
	iptables -L -n -v -t nat
	iptables -L -n -v -t mangle

	netstat -rn (or) route -n
	ifconfig -a 


>
> Nothing appears in either /var/log/messages or /var/log/kernel (from
> syslog.conf  kern.*    /var/log/kernel ). This is the worst part. I can't
> see anything happening anywhere. I have a Samba server running, and it is
> logging the same sendmsg error for the netbios port(137).

	Your log messages from iptables should be in "debug" log of some sort -- not 
being redhat comfy I'm not sure where it puts these.  If they aren't 
happening according to syslog.conf, then the packets aren't making it to the 
INPUT and OUTPUT iptables queues.
>
> I have searched for hours to solve this, and there appears to be something
> stopping packets at the iptables level, as without iptables installed,
> there is clear connections everywhere. Even rebooting the machine made no
> difference, as much as I expected.

	Indeed this is possible, but with INPUT and OUTPUT policy set to ACCEPT
	your system should be able to talk to the world.  I note that the POLICY on 
FORWARD is set to DROP -- this indicates that you don't expect to be 
forwarding packets for any networks.  I doubt that any decent script out 
there that sets the POLICY for the MANGLE  and NAT to DROP but it is a 
possiblity, thus we need to know that as well.  The Operation not permitted 
message from ping doesn't sound good, since this sounds like a network route 
is missing.  So with a bit more detail we might find the cause.

	You might want to check out Oskar Andreasson's wonderful iptables tutorials:
	
	http://iptables-tutorial.frozentux.net/iptables-tutorial.html
	or at (since I can't seem to reach frozentux today)
	http://www.faqs.org/docs/iptables/
>
> Being a novice, with a few years experience, I have always been able to get
> things solved with stuff on the net. This one has really got me beat.
>
> Thanks in advance,
> Conrad
> ---

	Perhaps getting a picture of all of the above output from both with iptables 
and without iptables would be a good idea?

	Alistair Tonner
	

