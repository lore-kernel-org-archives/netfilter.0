From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: bad_packets problem?
Date: Thu, 20 Oct 2005 11:20:11 -0500
Message-ID: <200510201120.12037.rob0@gmx.co.uk>
References: <4357AF18.2060109@aa.usno.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4357AF18.2060109@aa.usno.navy.mil>
Content-Disposition: inline
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

On Thursday 2005-October-20 09:52, Bill Tangren wrote:
> I have a Linux (2.6.9-22.EL) box, running iptables version
> 1.2.11-3.1.RHEL4. My server is sitting behind a firewall (that I
> don't control), but I have iptables running anyway, as occasionally
> other boxes behind the firewall are compromised.

Consider your threat model. I don't think a Windows zombie poses any 
threat to a Linux machine. The main "threat" to Linux machines these 
days would be the ssh attack bots, which I bet run from compromised 
Unix-like machines. Good sense in securing your sshd and strong 
passwords (if you even allow password authentication) protects you 
quite well.

A good firewall won't hurt, but it might not matter much.

> $IPT -A bad_packets -p ALL -j RETURN

"-p ALL" is always superfluous, as is a "-j RETURN" rule at the end of
a chain.

> up2date to update my RedHat software, I get entries in the log that
> show up in the LogWatch email. The thing is, the "Invalid packet"
> rule catches a few hundred packets a day, and logs them. A number of
> those packets come from 209.132.177.100 (xmlrpc.rhn.redhat.com), the
> rhn up2date server. The LogWatch output can look like this:
>
>  From 209.132.177.100 - 24 packets
>    To 10.1.5.154 - 24 packets
>       Service: 33353 (tcp/33353) (Invalid packet:,eth0,none) - 4
snip
> The updates take place eventually, but almost never on the first go.
> I get LogWatch entries like this every time I run up2date. I am
> assuming that there is some problem with the iptables rules I have
> set up, but I don't know what they might be.

Not likely. From "man iptables", MATCH EXTENSIONS, state:
    "... Possible states [include] INVALID meaning that  the  packet
    could  not  be identified for some reason which includes running
    out of memory and ICMP errors  which  don't  correspond  to  any
    known connection ..."

For some reason connection tracking is not identifying this connection. 
It is possible that you have some rule in mangle or nat tables which is 
interfering with conntrack, but the rules you showed us would not cause 
those packets to be in state INVALID.

A probable workaround is to put an exception rule for your up2date 
server or ports prior to your INVALID rules.

> Does anyone have any thoughts on this? [I posted this question on the
> redhat-list, but got no replies, so I thought I might try here.]

Is that a general-purpose list? You might want to go to the up2date 
developers.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

