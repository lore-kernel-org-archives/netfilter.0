From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Access control script for Public Library
Date: Thu, 31 Mar 2005 18:17:31 -0500
Message-ID: <1112311051.5192.51.camel@jasiiitosh.nexusmgmt.com>
References: <89629fe005033110422a630231@mail.gmail.com>
	<1112301463.424c5f9711c7d@ehle.homelinux.org>
	<1112302882.5192.40.camel@jasiiitosh.nexusmgmt.com>
	<1112309645.424c7f8d8559c@ehle.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112309645.424c7f8d8559c@ehle.homelinux.org>
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
To: mark@ehle.homelinux.org
Cc: Netfilter users list <netfilter@lists.netfilter.org>

I did not take the time to really digest your post or rules (my
apologies - just very busy) but that is the first thing that came to
mind.  I've not used DansGuardian but I do know that my transparent
proxies failed until I realized I had not allowed internal traffic
passing on interface lo.  I suppose if you do a simple ifconfig or ip
link ls you'll see if your system uses lo or lo0.  Good luck - John

On Thu, 2005-03-31 at 17:54 -0500, mark@ehle.homelinux.org wrote:
> John - 
> 
> Thanks for your reply - most definately not silly, or off the cuff. I am a
> complete iptables nubie, so I will listen to anything. 
> 
> Actually, that is a part that I didn't change from the script that I am, well,
> borrowing. Might that be the reason that dansguardian hangs when I start it up?
> It did seem to me that it was not able to 'listen to itself', so to speak. 
> 
> Thanks again!
> 
> Mark Ehle
> Computer Support Librarian
> Willard Public Library 
> Battle Creek, Michigan 
> 
> Quoting "John A. Sullivan III" <jsullivan@opensourcedevel.com>:
> > This may be a silly, off the cuff reply, but, in your rules allowing
> > traffic within the gateway, do you want interface lo0 as you have
> > written or lo?
> > -- 
> > John A. Sullivan III
> > Open Source Development Corporation
> > +1 207-985-7880
> > jsullivan@opensourcedevel.com
> > 
> > If you would like to participate in the development of an open source
> > enterprise class network security management system, please visit
> > http://iscs.sourceforge.net
> > 
> > 
> 
> > On Thu, 2005-03-31 at 15:37 -0500, mark@ehle.homelinux.org wrote:
> > > Hello - 
> > > 
> > > I am a complete iptables newbie who is trying to re-write a wireless
> > hotspot
> > > script that I found on the net to control internet access for our library
> > patrons. 
> > > 
> > > I found the script at: 
> > > 
> > > http://www.feedface.com/folkert/study/hotspot/src/firewall.sh.txt
> > > 
> > > I am trying to re-write it so that I can use squid and dansguardian to
> > proxy and
> > > filter the web. I need it to transparently proxy. I have a system set up
> > now
> > > that uses squid to grant or deny access, but it can only block web access;
> > I my
> > > need is for a firewall that can block all network access so that a given
> > PC
> > > can't chat or play online games as well as surf the net after time has run
> > out.
> > > 
> > > The script, as far as I have gotten, works well. When I fire it up, my test
> > PC
> > > can't go anywhere except the sign up page (which it is redirected to no
> > matter
> > > what), and when I add the PC to the access list (by typing firewall.sh add
> > <ip>
> > > <mac>), that PC is able to surf. 
> > > 
> > > My problem comes in when I try to do the transparent proxy part. when I try
> > to
> > > add the rule: 
> > > iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports
> > 8080
> > > 
> > > To the script, it does not work, and dansguardian will not even start. I
> > have
> > > played around with various permutations of this rule, and have gotten
> > nowhere. 
> > > 
> > > Can anybody help? 
> > > 
> > > Thanks - 
> > > 
> > > Mark Ehle
> > > =======
> > > Following is the script (firewall.sh) as far as I have it:
> > > 
> > > #!/bin/bash
> > > 
> > >
> > ###############################################################################
> > > #   name: firewall.sh
> > > # author: Mark Ehle
> > > #   date: 03-30-05
> > > # with much thanks given to Folkert Saathoff at
> > http://www.feedface.com/folkert
> > >
> > ###############################################################################
> > > 
> > > #===========================
> > > # variables
> > > #===========================
> > > 
> > > # command-line arguments
> > > COMMAND=$0
> > > ACTION=$1
> > > IP=$2
> > > MAC=$3
> > > 
> > > # program locations
> > > IPTABLES=/sbin/iptables
> > > MODPROBE=/sbin/modprobe
> > > DEPMOD=/sbin/depmod
> > > 
> > > # Local Network variables
> > > LAN_GW="10.0.0.1"
> > > LAN_NET="10.0.0.0/8"
> > > LAN_INT="eth1"
> > > 
> > > # External network variables
> > > EXT_INT_IP="<insert external interface ip here>"
> > > EXT_INT="eth0"
> > > 
> > > #Name Server IP
> > > NS="insert Name server ip here"
> > > 
> > > #===========================
> > > # subroutines
> > > #===========================
> > > load_modules() {
> > >     $DEPMOD -a
> > >     for module in "ip_conntrack ip_tables iptable_filter iptable_mangle
> > > iptable_nat ipt_LOG ipt_limit ipt_MASQUERADE"; do
> > >         $MODPROBE $module 
> > >     done
> > >     return
> > > }
> > > 
> > > start_ip_forwarding() {
> > >     echo 1 > /proc/sys/net/ipv4/ip_forward
> > >     return
> > > }
> > > 
> > > show_usage()
> > > {
> > >     echo "usage:"
> > >     echo "$COMMAND reset"
> > >     echo "$COMMAND add IP MAC"
> > >     echo "$COMMAND del IP MAC"
> > >     exit 1;
> > > }
> > > 
> > > fferror()
> > > {
> > >     echo "^_^'"
> > >     echo "error setting netfilter: $ACTION"
> > >     exit 1
> > > }
> > > 
> > > flush_tables() {
> > >     for TABLE in filter nat mangle; do
> > >         for SWITCH in F X Z; do
> > >             $IPTABLES -t $TABLE -$SWITCH
> > >         done
> > >     done
> > >     return
> > > }
> > > 
> > > create_new_chains() {
> > >     #filter chain for accepting authenticated clients 
> > >     $IPTABLES -t filter -N fclient
> > >     #filter chain for not rerouting authenticated clients 
> > >     $IPTABLES -t nat -N dclient
> > >     #filter chain for routing from authenticated clients 
> > >     $IPTABLES -t nat -N sclient
> > >     
> > >     #default filter policy is DROP
> > >     $IPTABLES -t filter -P INPUT DROP
> > >     $IPTABLES -t filter -P OUTPUT DROP
> > >     $IPTABLES -t filter -P FORWARD DROP
> > > 
> > >     return
> > > }
> > > 
> > > reset_firewall() {
> > > 
> > >     load_modules
> > >     start_ip_forwarding
> > >     flush_tables
> > >     create_new_chains
> > > 
> > >     #allow all local traffic
> > >     $IPTABLES -t filter -A  INPUT -i lo0 -j ACCEPT
> > >     $IPTABLES -t filter -A OUTPUT -o lo0 -j ACCEPT
> > > 
> > >     #allow all icmp traffic self<->lan
> > >     $IPTABLES -t filter -A  INPUT -i $LAN_INT -s $LAN_NET -d $LAN_GW -p
> > icmp -j
> > > ACCEPT
> > >     $IPTABLES -t filter -A OUTPUT -o $LAN_INT -s $LAN_GW -d $LAN_NET -p
> > icmp -j
> > > ACCEPT
> > > 
> > >     #allow all icmp traffic self<->inet
> > >     $IPTABLES -t filter -A  INPUT -i $EXT_INT -d $EXT_INT_IP -p icmp -j
> > ACCEPT
> > >     $IPTABLES -t filter -A OUTPUT -o $EXT_INT -s $EXT_INT_IP -p icmp -j
> > ACCEPT
> > > 
> > >     #allow dhcp traffic self<->lan
> > >     $IPTABLES -t filter -A  INPUT -i $LAN_INT -s 0.0.0.0/0 -d
> > 255.255.255.255 -p
> > > udp --dport 67:68 -j ACCEPT 
> > >     $IPTABLES -t filter -A OUTPUT -o $LAN_INT -s $LAN_GW -d $LAN_NET -p
> > udp
> > > --sport 67:68 -j ACCEPT
> > > 
> > >     #allow all web traffic self<->lan
> > >     for PORT in 80 443; do
> > >         $IPTABLES -t filter -A  INPUT -i $LAN_INT -s $LAN_NET -d $LAN_GW -p
> > tcp
> > > --dport $PORT -j ACCEPT
> > >         $IPTABLES -t filter -A OUTPUT -o $LAN_INT -s $LAN_GW -d $LAN_NET -p
> > tcp
> > > --sport $PORT -j ACCEPT
> > >     done
> > > 
> > >     #allow all ssh and smb traffic to/from self
> > >     for PORT in 22 139; do
> > >         $IPTABLES -t filter -A  INPUT -p tcp --dport $PORT -j ACCEPT
> > >         $IPTABLES -t filter -A OUTPUT -p tcp --sport $PORT -j ACCEPT
> > >     done
> > > 
> > >     # allow dns
> > >     $IPTABLES -t filter -A OUTPUT  -o $EXT_INT -s $EXT_INT_IP -d $NS -p
> > udp
> > > --dport 53 -j ACCEPT
> > >     $IPTABLES -t filter -A  INPUT  -i $EXT_INT -s $NS -d $EXT_INT_IP -p
> > udp
> > > --sport 53 -j ACCEPT
> > >     $IPTABLES -t filter -A FORWARD -i $LAN_INT -o $EXT_INT -s $LAN_NET -d
> > $NS -p
> > > udp --dport 53 -j ACCEPT 
> > >     $IPTABLES -t filter -A FORWARD -i $EXT_INT -o $LAN_INT -s $NS -d
> > $LAN_NET -p
> > > udp --sport 53 -j ACCEPT 
> > > 
> > >     #enable source network address translation for dns
> > >     $IPTABLES -t nat -A POSTROUTING  -s $LAN_NET -p udp --dport 53 -d $NS
> > -o
> > > $EXT_INT -j SNAT --to $EXT_INT_IP
> > > 
> > >     #check for allowed clients -> inet
> > >     $IPTABLES -t filter -A FORWARD -i $LAN_INT -o $EXT_INT -s $LAN_NET -j
> > fclient
> > >     #reject all other clients
> > >     $IPTABLES -t filter -A FORWARD -i $LAN_INT -o $EXT_INT -s $LAN_NET -j
> > REJECT
> > > --reject-with icmp-net-prohibited
> > > 
> > >     #allow established connections lan<->inet
> > >     $IPTABLES -t filter -A FORWARD -i $EXT_INT -o $LAN_INT -d $LAN_NET -m
> > state
> > > --state ESTABLISHED -j ACCEPT
> > > 
> > >     #snat traffic from authenticated clients
> > >     $IPTABLES -t nat -A POSTROUTING -s $LAN_NET -d ! $LAN_NET -j sclient   
> > 
> > > 
> > >     #do not dnat traffic from authenticated clients
> > >     $IPTABLES -t nat -A PREROUTING -i $LAN_INT -d ! $LAN_GW -j dclient
> > > 
> > >     #enable dnat to self for all web traffic
> > >     for PORT in 80 443; do
> > >         $IPTABLES -t nat -A PREROUTING -i $LAN_INT -d ! $LAN_GW -p tcp
> > --dport
> > > $PORT -j DNAT --to $LAN_GW
> > >     done
> > > 
> > >     #add default REJECT rule (just more polite than DROP)
> > >     for CHAIN in INPUT OUTPUT FORWARD; do
> > >         $IPTABLES -t filter -A $CHAIN -j REJECT;
> > >     done
> > >     return
> > > 
> > > }
> > > 
> > > add_usage() {
> > >     echo "usage:"
> > >     echo "$COMMAND add IP MAC"
> > >     exit 1;
> > > }
> > > 
> > > run_add() {
> > >     [ "ff"$IP != "ff" ] || show_addclient_usage; [ "ff"$MAC != "ff" ] ||
> > add_usage
> > >     #add client
> > >     
> > >     $IPTABLES -t filter -A fclient -s $IP -m mac --mac-source $MAC -j
> > ACCEPT   
> > >         || fferror $?
> > >     $IPTABLES -t nat    -A dclient -s $IP -m mac --mac-source $MAC -j
> > ACCEPT   
> > >         || fferror $?
> > >     $IPTABLES -t nat    -A sclient -s $IP -d ! $LAN_NET -j SNAT --to
> > $EXT_INT_IP
> > >        || fferror $?
> > >     echo "added Client: IP $IP MAC $MAC";
> > >     return
> > > }
> > > 
> > > del_usage() {
> > >     echo "usage:"
> > >     echo "$COMMAND del IP MAC"
> > >     exit 1;
> > > }
> > > 
> > > run_del() {
> > >     [ "ff"$IP != "ff" ] || show_delClient_usage; [ "ff"$MAC != "ff" ] ||
> > del_usage
> > >     #delete client
> > >     $IPTABLES -t filter -D fclient -s $IP -m mac --mac-source $MAC -j
> > ACCEPT ||
> > > fferror $?
> > >     $IPTABLES -t nat -D dclient -s $IP -m mac --mac-source $MAC -j ACCEPT
> > ||
> > > fferror $?
> > >     $IPTABLES -t nat -D sclient -s $IP -d ! $LAN_NET -j SNAT --to
> > $EXT_INT_IP ||
> > > fferror $?
> > >     echo "removed Client: IP $IP MAC $MAC";
> > >     return
> > > }
> > > 
> > > #===========================
> > > # Main 
> > > #=========================== 
> > > 
> > > case "$ACTION" in
> > >     reset ) reset_firewall;;
> > >     add   ) run_add;;
> > >     del   ) run_del;;
> > >     *     ) show_usage;;
> > > esac
> > > 
> > > exit
> > > 
> 
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


