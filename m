From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables: exe
Date: Sat, 21 Sep 2002 22:28:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921212830.UFQT6699.mta01-svc.ntlworld.com@there>
References: <20020921211246.84065.qmail@web20302.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020921211246.84065.qmail@web20302.mail.yahoo.com>
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

On Saturday 21 September 2002 10:12 pm, Tasha Smith wrote:

> Ok...i have my own iptables script trying to get it
> going...here what i have soo far in it...just starting
>
> SPECS:
> RedHat 7.2

I think the major problem you report is RedHat specific, which I don't use, 
so I hope someone else here can answer that, but I just wanted to make a 
couple of comments on your netfilter script anyway...

> 2.4.19 Kernel
> iptables-1.2.3

Seems like a strange combination ?   Modern kernel and rather old iptables.   
Still, I don't think it'll cause you any troubles...

> #######################################
> #!/bin/bash
>
> echo 1 = > /proc/sys/net/ipv4//ip_forward

1. Remove the = from that command.   It's not doing any harm, but it 
shouldn't be there.

2. Move the command altogether to the end of your firewall script.   You 
shouldn't enable packet forwarding until after you've set up the filtering 
rules - otherwise there's a short period of time when you are forwarding 
packets with no filtering = open router = bad idea :-)

> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> # Remove any existing rules from all chains.
> iptables --flush
> iptables -t nat --flush
>
> # Unlimited access on the loopback interface
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUPUT -o lo -j ACCPET

Was that a typo when you sent this email, or do you need to edit your script 
file ?

> # Set the fefault policy to Drop
> iptables --policy INPUT DROP

Shouldn't you be setting your FORWARD policy to DROP here as well ?

I suppose you might have only one interface, and you're not forwarding 
packets, but then you don't need the echo > ip_forward command at the top 
which I suggested you move....

> #######################################

> Now... to get this to run on start-up here is what i
> did but it didnt start up it gave me an error.
> chown root.root /etc/init.d/firewall
> chmod u=rwx /etc/init.d /firewall
>
> And when i restart I GET ERROR... which is
> "iptables: execvp: Permission Denied
> rc. Starting iptables: Failed"

This is the RedHat specific part which I can't help with - sorry.   Anyone 
else here care to step in at this point please ?

> I also have this line sh /etc/init.d/firewall at the
> end of my "rc.local" file
>
> HOW CAN I FIX THIS OR GET THEM TO START-UP PROPERLY?
> EDIT: > OOPPPPPPSS guys  i forgot to mention the
> original iptables script that came installed already
> on my system in the "/etc/init.d/" i moved that to
> somewhere else.... was i suppose to do that or just
> leave them there???

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

