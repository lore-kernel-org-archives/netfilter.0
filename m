From: "Adam Kennedy" <akennedy@niesc.k12.in.us>
Subject: Re: Having NAT problems
Date: Thu, 1 Apr 2004 15:08:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401200109.M82978@niesc.k12.in.us>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org> <20040401192728.M69316@niesc.k12.in.us> <200404012039.48071.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404012039.48071.Antony@Soft-Solutions.co.uk>
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

The iptables -L -nvx output is QUITE lengthy, but I can post if someone really
wants it. I'm a bit itchy over posting it due to wanna be system crackers.

                                                                             
  ### Begin rc.firewall snippet

iptables=/usr/sbin/iptables
                                                                                
LOCALLAN="10.0.0.1/8"
                                                                                
# Install modules for iptables
ipmodules="ip_conntrack ip_conntrack_ftp ip_conntrack_h323 ip_conntrack_mms
ip_tables iptable_filter iptable_mangle iptable_nat ip_nat_ftp ipt_LOG
ipt_MARK ipt_MASQUERADE ipt_MIRROR ipt_REDIRECT ipt_REJECT ipt_TCPMSS ipt_TOS
ipt_limit ipt_mac ipt_mark ipt_multiport ipt_owner ipt_state ipt_tcpmss
ipt_tos ipt_unclean"
                                                                                
for x in ${ipmodules} ; do
  insmod $x 1>/dev/null 2>&1
done
                                                                                
                                                                             
  ## Flush everything first
$iptables -F
$iptables -t nat -F
                                                                                
## Set default policies
$iptables -P INPUT ACCEPT
$iptables -P FORWARD ACCEPT
$iptables -P OUTPUT ACCEPT
                                                                                
$iptables -A PREROUTING -t nat -p tcp -d 165.138.xxx.x --dport 5631 -j DNAT
--to 10.72.254.129:5631

##########
## MASQ ##
##########
$iptables -t nat -A POSTROUTING -s $LOCALLAN -d 0/0 -j MASQUERADE

## Syn-flood protection
$iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
$iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
                                                                                
## Furtive port scanner
$iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s
-j ACCEPT
$iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit
1/s -j ACCEPT
                                                                                
## ICMP
$iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j
ACCEPT
$iptables -A FORWARD -p icmp --icmp-type echo-reply -m limit --limit 1/s -j ACCEPT
$iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
$iptables -A INPUT -p icmp --icmp-type echo-reply -m limit --limit 1/s -j
ACCEPT                                                                       
        

### End rc.firewall snippet

On Thu, 1 Apr 2004 20:39:48 +0100, Antony Stone wrote
> On Thursday 01 April 2004 8:30 pm, Adam Kennedy wrote:
> 
> > This is driving me up a wall.
> > I have a NAT entry such as thus:
> >
> > iptables -t nat -A PREROUTING -d 1.2.3.4 \
> >         -p tcp --dport 5631 -j DNAT --to 192.168.1.1
> 
> What other nat rules do you have?
> 
> Show us the rest of your ruleset (if it's complicated, please try 
> reducing it to the simplest possible which you think should work but 
> still shows the problem).   The output from iptables -L -nvx; 
> iptables -L -t nat -nvx would be good.
> 
> Regards,
> 
> Antony.


--
Northern Indiana ESC
Adam Kennedy - akennedy@niesc.k12.in.us
Linux Specialist / Network Administrator
Phone: (574) 254-0111 x113
Toll Free: 800-326-5642
Fax: (574) 254-0148


