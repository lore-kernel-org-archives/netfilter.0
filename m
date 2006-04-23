From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Adaptive stealthing/unstealthing of port 113
Date: Sun, 23 Apr 2006 14:13:26 +0200
Message-ID: <444B6F66.1020404@rtij.nl>
References: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Asfand Yar Qazi <ayqazi@gmail.com>
Cc: netfilter@lists.netfilter.org

Asfand Yar Qazi wrote:

>Hi,
>
>On Steve Gibson's site, I had a few interesting things to read about
>the ZoneAlarm firewall:
>
>(quote)
>Even after many years, the (free) ZoneAlarm personal firewall from
>Zone Labs is the only personal firewall to "adaptively" stealth port
>113. Unlike any other firewall or NAT router (any of which could also
>do the same) this allows port 113 to be stealthed to any passing
>Internet scanners or probes, but "unstealthed" for any valid IDENT
>connection attempts originating from remote servers with which the
>user's computer is attempting to connect. (Since this could easily be
>done by any personal firewall or even NAT routers, I am hopeful that
>this feature might yet appear in other products.)
>
>"Adaptive Stealthing" means that when a TCP SYN packet arrives to
>request a connection to your machine's port 113, ZoneAlarm checks, on
>the fly, to see whether your machine currently has any sort of
>"relationship" with the remote machine (such as a pending outgoing
>connection attempt). If so, the remote machine is considered to be
>"friendly" and its IDENT request packet is allowed to pass through
>ZoneAlarm's firewall. But if the IDENT originating machine is not
>known to ZoneAlarm as a "friendly" machine, the connection requesting
>packet is dropped and discarded, rendering port 113 stealth to all
>unknown port scanners. It's very slick.
>(end quote)
>
>I wanna do it on my ADSL firewall!
>
>How can I do this?  I realise I could just write a custom module in C,
>but you guys probably know of a way to do it with the existing tools.
>
>  
>

I use the recent module for this.

-A FORWARD -i ppp0 -p tcp -m tcp --dport 113 -j AUTHHACK
-A FORWARD -o ppp0 -p tcp -m tcp ! --dport 113 -j TCPOUT
-A AUTHHACK -j ULOG --ulog-prefix "Checking auth/recent : "
-A AUTHHACK -m recent --rcheck --seconds 100 --name tcpout --rsource -j 
RJAUTH
-A RJ -p tcp -j REJECT --reject-with tcp-reset
-A RJ -j REJECT --reject-with icmp-port-unreachable
-A RJAUTH -j ULOG --ulog-prefix "Reject auth: "
-A RJAUTH -j RJ
-A TCPOUT -j ULOG --ulog-prefix "Add to tcpout: "
-A TCPOUT -m recent --set --name tcpout --rdest

Note that many (ftp) servers with multiple ip addresses (common on 
webservers that offer ftp for uploading content) send the ident request 
from a different ip that the ftp session is going out to, so it does not 
work as often as you would like.

(Also note that the RJ chain above is generic, we know in this case it 
is tcp so we could have rejected directly with a tcp-reset).

M4



