From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: ipfilter on satellite receive only PC
Date: Sat, 26 Jun 2004 14:33:46 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504062602337d614297@mail.gmail.com>
References: <40DD28BA.82DEE8DA@neduet.edu.pk> <200406260915.01035.Antony@Soft-Solutions.co.uk> <a0f69e5040626012851d190ba@mail.gmail.com> <200406260945.38438.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406260945.38438.Antony@Soft-Solutions.co.uk>
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
Cc: antony@soft-solutions.co.uk

hey 
if this is your router/getway through which all other clients LAN will
access Internet then you have to add a rule for NAT Masq :)

Edit the file /etc/sysctl.conf and on the line net.ipv4.ip_forward =
0, change 0 to 1.
           net.ipv4.ip_forward = 1

This is another script for this perpose :)

 iptables -F INPUT	
 iptables -F OUTPUT	
 iptables -F FORWARD
 iptables -t nat -F

The following commands will create new rules for your system.

   iptables -P INPUT ACCEPT	
   iptables -P OUTPUT ACCEPT	
   iptables -P FORWARD DROP	

   iptables -A FORWARD -i eth0 -o eth1 -m state --state
ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT	

$ iptables -A FORWARD -j LOG	

$ iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Regards

Askar


On Sat, 26 Jun 2004 09:45:38 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> On Saturday 26 June 2004 9:28 am, Askar Ali Khan wrote:
> 
> > this is out im running on my slackware, adjust it to your needs :)
> 
> That's okay - I run Slackware too :)
> 
> > #!/bin/bash
> > #
> > # Basic script to keep the nasties out of slack-lap
> >
> > # First we make the default policy to drop everything
> > iptables -P INPUT DROP
> > iptables -P FORWARD DROP
> >
> > # Allow established connections and programs that use
> > loopback
> >
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED
> > -j ACCEPT
> > iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo
> > -j ACCEPT
> 
> # Also allow established connections *through* the router, as well as *to* it:
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Now allow first packets of the connections we want to become established
> 
> iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT
> iptables -A FORWARD -i eth0 -p udp --dport 53 -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 53 -j ACCEPT
> 
> > # Lets allow ssh to connect
> >
> > iptables -A INPUT -p tcp --dport 22 -i ppp0 -j ACCEPT
> >
> > #end script
> 
> The above rules should allow machines on your internal network (assumed to be
> connected to eth0, adjust if otherwise) to do DNS lookups and HTTP requests
> to the outside world.
> 
> Hopefully this gives you a template to which you can add more rules for
> whatever other protocols you want to allow.
> 
> Regards,
> 
> Antony.
> 
> --
> The words "e pluribus unum" on the Great Seal of the United States are from a
> poem by Virgil entitled "Moretum", which is about cheese and garlic salad
> dressing.
> 
> 
> 
>                                                     Please reply to the list;
>                                                           please don't CC me.
> 
>

