From: Tasha Smith <natasha3641@yahoo.com>
Subject: RE: iptables: exe
Date: Sat, 21 Sep 2002 15:58:55 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921225855.62604.qmail@web20301.mail.yahoo.com>
References: <FLEKIPPLAEDMJMOOBBDPKEGOCPAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPKEGOCPAA.stewart.thompson@shaw.ca>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok guys: i think they started up with out any errors:)
"chmod 755 firewall" Then i went to my "rc.local" file
and put "sh /etc/init.d/firewall" at the end and
rebooted and i got no error but COULD NOT see anywhere
saying "firewall starting      OK"  but when i logged
in and tryed the command "iptables vL" I GOT THIS 
----------------------------------------------------
Chain INPUT (policy 0 packets, 0 bytes)
pkts bytes target prt opt in out source destination
0 0  ACCEPT  all   --lo    any      anwhere    anwhere

CHain FOrward (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target prt opt in out source destination

Chain OUPUT (policy ACCEPT 14 packetts, 1047bytes)
pkts bytes target prt opt in out source destination
0 0  ACCEPT  all   --lo    any      anwhere    anwhere
------------------------------------------------------
Soo does this mean they started right??? 


--- Stewart Thompson <stewart.thompson@shaw.ca> wrote:
> Hi Tasha:
> 
> 	The latest Kernel for Redhat 7.2 is 2.4.9-34.
> I would recommend that you upgrade to it. Also,
> Iptables 1.24 shipped with 7.2 not 1.23. Also.
> 1.25 is available on their site. The latest from
> Netfilter
> is 1.27a, but unless you need one of the new
> features,
> you don't require it. I am using 1.24 with great
> success.
> The other thing is to make sure all your packages
> are up
> to date, Iptables is just part of the security.
> Disable any
> functions you don't need on the server.
> 	Now to your problems. Redhat 7.2 shipped with
> Ipchains set up as the firewall. Have you disabled
> it?
> They can't both be active at the same time.
> Try chown root:root firewall and chmod 775 firewall,
> and see if it executes ok on startup. This is in
> addition
> to the advice from Antony.
> Hope that helps.
> 
> Stu......
> 
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On
> Behalf Of Tasha Smith
> Sent: September 21, 2002 2:13 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables: exe
> 
> Ok...i have my own iptables script trying to get it
> going...here what i have soo far in it...just
> starting
> 
> SPECS:
> RedHat 7.2
> 2.4.19 Kernel
> iptables-1.2.3
> 
> #######################################
> #!/bin/bash
> 
> echo 1 = > /proc/sys/net/ipv4//ip_forward
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> # Remove any existing rules from all chains.
> iptables --flush
> iptables -t nat --flush
> 
> # Unlimited access on the loopback interface
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUPUT -o lo -j ACCPET
> 
> # Set the fefault policy to Drop
> iptables --policy INPUT DROP
> #######################################
> Now... to get this to run on start-up here is what i
> did but it didnt start up it gave me an error.
> chown root.root /etc/init.d/firewall
> chmod u=rwx /etc/init.d /firewall
> 
> And when i restart I GET ERROR... which is
> "iptables: execvp: Permission Denied
> rc. Starting iptables: Failed"
> 
> I also have this line sh /etc/init.d/firewall at the
> end of my "rc.local" file
> 
> HOW CAN I FIX THIS OR GET THEM TO START-UP PROPERLY?
> EDIT: > OOPPPPPPSS guys  i forgot to mention the
> original iptables script that came installed already
> on my system in the "/etc/init.d/" i moved that to
> somewhere else.... was i suppose to do that or just
> leave them there???
> 
> 
> 
> =====
> 
> Image by MackDaddy
> 
> __________________________________________________
> Do you Yahoo!?
> New DSL Internet Access from SBC & Yahoo!
> http://sbc.yahoo.com
> 


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

