From: Jason Opperisano <opie@817west.com>
Subject: Re: problem with recent iptables and ftp-server in dmz
Date: Thu, 20 Jan 2005 10:49:04 -0500
Message-ID: <1106236144.5024.13.camel@hubcap.ljm.dom>
References: <200501201629.40493.m.koppe@lrz.tu-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501201629.40493.m.koppe@lrz.tu-muenchen.de>
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

On Thu, 2005-01-20 at 10:29, Marcel Koppe wrote:
> Hi,
> 
> till today I've used a firewallscript on a "SuSE Linux 7.1" system based on 
> iptables 1.2.6a. (script is at the end of this message)
> 
> Today I've created a new firewallsystem on a "SuSE Linux 9.2" system based on 
> iptabels 1.2.11.
> 
> It seemed to work without any problems like the old firewall till I tried to 
> use ftp on my ftpserver on the dmz from outside the network.
> 
> The ftpserver asks for a username and password which means that the routing 
> works to the dmz but if I type ls and it changes to "extendes passive mode" 
> I'm getting a timeout error from the "real" ip adress of the ftp server.
> 
> Thats strange because I'm sure that all preferences are the same on the new 
> machine as on the old machine. (networkdevices are in the same order too)
> 
> I would be very grateful if anyone can help me find a way to fix this problem.
> 
> kind regards
> 
> Marcel

add this to your script:

  modprobe ip_conntrack_ftp
  modprobe ip_nat_ftp

if you want to be fancy, since your script looks rather stylish:

  if (! lsmod | grep -q ip_conntrack_ftp); then
    modprobe ip_conntrack_ftp
  fi
  if (! lsmod | grep -q ip_nat_ftp); then
    modprobe ip_nat_ftp
  fi

-j

--
"It takes two to lie. One to lie and one to listen."
	--The Simpsons


