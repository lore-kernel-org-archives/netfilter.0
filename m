From: David Cannings <lists@edeca.net>
Subject: Re: Redirecting ports on localhost
Date: Tue, 30 Mar 2004 23:33:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403302333.27346.lists@edeca.net>
References: <20040330133505.22298.90925.Mailman@vishnu.netfilter.org> <406980E5.6080107@personalsoft.com.br> <200403302013.40298.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302013.40298.lists@edeca.net>
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

On Tuesday 30 March 2004 20:13, David Cannings wrote:
> On Tuesday 30 March 2004 15:15, Fabiano Bonin wrote:
> >  > On Tuesday 30 March 2004 13:46, Fabiano Bonin wrote:
> > Maybe you can show the command needed to my case (i.e., using DNAT as
> > you told above). Sorry if i'm asking too much... I just need the
> > hosts on my local network can access this port through server's eth0.
>
> http://netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2
>
> I've linked to the English HTML version of the HOWTO, other languages
> and formats are available at:
>
> http://netfilter.org/documentation/index.html#documentation-howto
>
> Have a read, see if you can make some sense of it.  If not, post back
> with what you've tried and why it doesn't work.  For the record, I've
> never tried redirecting a port to localhost although I can see no
> reason why it would not work as any other does.  I will have to give it
> a go myself when I have a few minutes spare.

As a followup I have found some time to play with this now.  Spending a 
few minutes on Google turned up a wealth of information regarding this 
problem.  One of the most useful posts was this one:

http://lists.netfilter.org/pipermail/netfilter/2002-November/040104.html

In short: by the looks of it you cannot DNAT to localhost as the kernel 
thinks that it is a martian packet.  As this is a rather old message I 
decided to investigate it myself.

I added a rule to the prerouting chain to DNAT port 3001 (a number I 
picked totally randomly) to 127.0.0.1:3000, this appears to work as far 
as netfilter is concerned, proof follows.  Note the key part of the last 
sentence: "as far as netfilter is concerned".

The following method works as expected in all aspects when the --to 
argument for DNAT is a local interface.  As this is what is expected I 
will not copy and paste proof.

Method:

Machine running netfilter is a 2.4.24 kernel which normally does 
masquerading for a network.  It is 192.168.0.100.

To test, I set netcat to listen on port 3000 on all interfaces in verbose 
mode.  I then used nmap from another machine on the network to scan the 
netfilter machine on port 3001 only.  A combination of netcat running on 
all interfaces and only bound to specific IPs (127.0.0.1, local interface 
IPs, etc) was used.

david@david david $ nmap -sT 192.168.0.100 -p 3001
(.. ouput snipped, port shown as closed ..)

gateway:~# nc -lp 3000 -o dump -vv
listening on [any] 3000 ...
 sent 0, rcvd 0

As you can see from the output, no packets are received by netcat before I 
terminate it, after nmap has reported the port is closed.

The packet counters in iptables are incremented however:

Extract from `iptables -t nat -L -v"

   12   720 DNAT       tcp  --  eth0   any     anywhere             
anywhere            tcp dpt:3001 to:127.0.0.1:3000

I added two -j LOG rules into the PREROUTING table, one before the DNAT 
rule and one after.

/var/log/messages shows that the packet reaches the PREROUTING chain but 
is not present immediately after the rule above, which shows that it was 
matched and netfilter handed it off for routing to 127.0.0.1.

Extract from /var/log/messages:

Mar 30 23:13:54 gateway kernel: IN=eth0 OUT= 
MAC=00:10:a7:07:bf:89:00:e0:18:f1:3c:b9:08:00 SRC=192.168.0.19 
DST=192.168.0.100 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=63265 DF PROTO=TCP 
SPT=36128 DPT=3000 WINDOW=5840 RES=0x00 SYN URGP=0

For clarification, my FORWARD chain had a default ACCEPT policy for the 
duration of the test.

My only minor confusion comes from the fact enabling logging of martian 
packets (`echo 1 >/proc/sys/net/ipv4/conf/all/log_martians`) does not 
output any information to either syslog or messages.  If this were a 
martians problem I would have expected some form of logging output from 
enabling it.

I have not had time to inspect the kernel source file mentioned in the 
post I linked to.  It would be good to see if the match for packets to 
127/8 still counts a source of !127/8 as invalid, somebody here might be 
able to tell us.

Perhaps there is something quite fundamentally wrong with the method I 
used to test, if so I hope somebody can point this out to me.  I also 
hope the evidence I've provided gives enough basis for me to say that 
whilst DNAT works as far as netfilter is concerned that packets "just 
don't get there".  My assumption is that this is caused by the problem 
described in the archived message above; therefore DNAT to loopback will 
not work as expected.

Apologies for the long message, it is a consequence of my attempt at being 
thorough.

David

