From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: ip_forward file
Date: Fri, 5 Jul 2002 09:12:54 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA231@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'jan.humme@xs4all.nl'" <jan.humme@xs4all.nl>
Cc: iptables <netfilter@lists.samba.org>

I'm using 7.1 but I do admit I also have the "echo 1 > /proc/.." statement
in my firewall rules only because I've copied from other servers I
originally wrote this...

I also hate some redhat scripts and modified mine to check for added
requirements and removed some like (example of one):

#>vi /etc/init.d/network

if [ ! -f /etc/sysconfig/network ]; then
    exit 0
fi
. /etc/sysconfig/network

.
.
.

        if [ -d /proc/sys/net/ipv4 ]; then
#          if [ -f /proc/sys/net/ipv4/ip_forward ]; then
#                if [ `cat /proc/sys/net/ipv4/ip_forward` != 0 ]; then
#                        action $"Disabling IPv4 packet forwarding: " sysctl
-w net.ipv4.ip_forward=0
#                fi
#          fi
           case "$FORWARD_IPV4" in
              yes|true)
                 echo "1" > /proc/sys/net/ipv4/ip_forward
                 ;;

              *)
                 echo "0" > /proc/sys/net/ipv4/ip_forward
                 ;;
           esac
        fi


This is something like the one I did for recent clients but from memory
(modded my local machine to show you all)...

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Jan Humme [mailto:jan.humme@xs4all.nl]
Sent: Friday, 05 July 2002 8:46 AM
To: George Vieira
Cc: iptables
Subject: Re: ip_forward file


On Friday 05 July 2002 00:12, George Vieira wrote:
> Redhat uses it's /etc/sysconfig/network file to save that stuff..
>
> IE..
>
> FORWARD_IPV4=yes

Not on all RedHat versions work this way, e.g. NOT on RH 7.1 which I am 
running today.

But I seem to remember it did in RH 6.1; what version are you running?

On RedHat 7.1 a "service network stop" (or /etc/init.d/network stop) will 
disable forwarding, but "service network start" will NOT enable it again
(!), 
unless specified in /etc/sysctl.conf.

So if you do a "service network restart" (or /etc/rc.d/init.d/network 
restart) and expect to have a clean network configuration (after messing 
around or whatever), then your forwarding won't work.

This is the reason why I now use /etc/sysctl.conf instead of a line in 
/etc/rc.local; then everything works fine.

Jan Humme.

