From: Ben Russo <ben@umialumni.com>
Subject: Re: more than 1 source ip
Date: 26 Nov 2002 09:40:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038321617.13707.28.camel@ben.mis.tnsi.com>
References: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
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
To: "wasim.bashir" <wasim.bashir@nexor.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2002-11-26 at 05:00, Wasim Bashir wrote:
> Hi,
> 
> how do i select more than 1 source IP, what i want to do is allow vnc access
> to an internal win2k box from 2 different ip addresses, how do you do this,
> at the moment i'm using :
> 
> /sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
> machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800
> 
> Any help would be much appreciated.
> 
> Thanks
> 
> Wasim

Other people have already mentioned it, but allowing VNC over the
internet is not secure anyway.  You would be better served by setting 
SSHD up on a random high port on your firewall and allowing gateway
ports.

Then when you want to VNC to your protected machine from an outside
host use "ssh -L 5800:10.0.0.199:5800 -p $PORTNUM user@firewall" from
the <outside host> and then start VNCviewer on the <outside host> to
localhost on the <outside host>, SSH will tunnel the tcp traffic and
do psuedo NAT.

Make sure you have the latest patches on your firewall for SSH related
stuff.  

If you really are going to use VNC over the internet, then please set
it up on a different port than 5800, that is where all the scripted 
exploits will scan for when an exploit becomes available.


