From: Thomas Simmons <twsnnva@cox.net>
Subject: Re: Advice setting up DMZ
Date: Wed, 05 Jan 2005 21:07:23 -0500
Message-ID: <41DC9D5B.9090505@cox.net>
References: <41DB42CE.1000401@cox.net> <1104893487.3747.128.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104893487.3747.128.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

John A. Sullivan III wrote:
> On Tue, 2005-01-04 at 20:28 -0500, Thomas Simmons wrote:
> 
>>I will soon be setting up a Linux firewall at work and I would like to 
>>get some advice on the best way to implement it. Currently the question 
>>regards routing to the DMZ. We currently have ~30 websites being hosted 
>>on an IIS server thats directly connected to the internet. The server 
>>has multiple ip address assigned to the public interface, one for each 
>>site, and a default ip. This server also hosts an FTP site for each 
>>website, that uses the same ip as its website counterpart. Let's just 
>>say the public IP's assigned to this server are 
>>111.111.111.1-111.111.111.32. My first thought was to add 30+ aliases to 
>>the firewalls public interface and use DNAT rules to forward traffic on 
>>needed ports to the webserver which would have a private ip. I would add 
>>something like this to my script.
>>
>>IFCCMD="/sbin/ifconfig"
>>IPTCMD="/sbin/iptables/"
>>PUBIF="eth2"
>>DMZIF="eth1"
>>PUBMSK="255.255.255.128"
>>
>>
>>$IFCCMD $PUBIF:1 111.111.111.1 netmask $PUBMSK
>>$IPTCMD -A PREROUTING -t nat -p tcp -d 111.111.111.1 --dport 80 -j DNAT 
>>--to-destination 192.168.11.1:80
>>$IPTCMD -A FORWARD -i $PUBIF -o $DMZIF -p tcp --dport 80 -d 192.168.11.1 
>>-j ACCEPT
>>$IPTCMD -A FORWARD -i $DMZIF -o $PUBIF -p tcp --sport 80 -s 192.168.11.1 
>>-j ACCEPT
>>
>>$IFCCMD $PUBIF:1 111.111.111.1 netmask $PUBMSK
>>$IPTCMD -A PREROUTING -t nat -p tcp -d 111.111.111.1 --dport 443 -j DNAT 
>>--to-destination 192.168.11.1:443
>>$IPTCMD -A FORWARD -i $PUBIF -o $DMZIF -p tcp --dport 443 -d 
>>192.168.11.1 -j ACCEPT
>>$IPTCMD -A FORWARD -i $DMZIF -o $PUBIF -p tcp --sport 443 -s 
>>192.168.11.1 -j ACCEPT
>>
>>$IFCCMD $PUBIF:1 111.111.111.1 netmask $PUBMSK
>>$IPTCMD -A PREROUTING -t nat -p tcp -d 111.111.111.1 --dport 21 -j DNAT 
>>--to-destination 192.168.11.1:21
>>$IPTCMD -A FORWARD -i $PUBIF -o $DMZIF -p tcp --dport 21 -d 192.168.11.1 
>>-j ACCEPT
>>$IPTCMD -A FORWARD -i $DMZIF -o $PUBIF -p tcp --sport 21 -s 192.168.11.1 
>>-j ACCEPT
>>
>>$IPTCMD -t nat -A POSTROUTING -s 192.168.11.1 -o $PUBIF -j SNAT --to 
>>111.111.111.1
>>
>>I would have to do this for each website, so basically I would be doing 
>>that 30 more times in the script, with only ip changes. I have tested it 
>>(not with 30 ip's, only 3) but it seems to work great. Is there a better 
>>way to do what I need? Is this what is called 1-to-1 nat? The system 
>>that we are using as the firewall is a 1GHz Celeron w/ 256MB RAM. The OS 
>>is basically a Debian base install w/ 2.4.27-custom kernel. The public 
>>and DMZ interfaces have GBE cards installed, so this system shouldn't 
>>have any speed problems with this configuration. Is that a fair 
>>assumption? Thanks in advance for any suggestions.
>>
>>Regards,
>>Thomas
>>
>>
> 
> I believe you are definitely on the right track.  Much better to have
> IIS behind a firewall and NATted.  You are indeed doing one-to-one NAT.
> I have a couple of suggestions.
> 
> I would suggest that you apply the NETMAP patch from patch-o-matic.
> This way you can define a subnet to which you do one-to-one NAT rather
> than having to define each address.  If your addresses to not exactly
> match a subnet, you can break it into its composite subnets and use the
> patch.  You can use SubnetCreator (http://subnetcreator.sourceforge.net)
> to calculate the subnets for you if you'd like.  This will minimize the
> number of rules in your nat table.
> 
> I would apply the iprange patch from patch-o-matic.  This way you can
> define the entire range and allow HTTP to that entire range in one rule
> in your forward table.
> 
> I would not use aliases.  Rather, I would bind IP addresses to the
> interface using iproute2, e.g., ip address add 111.111.111.1/24 dev eth2
> brd + and I would place this in a separate script.
> 
> That leads to the next point.  I would not use a script which calls
> iptables commands.  I would create a file in iptables-restore syntax to
> create the rules and then call iptables-restore from your iptables
> loading script.
> 
> In the ISCS network security management project
> (http://iscs.sourceforge.net), we do this all automatically, i.e., you
> would define the IIS server, tell it what real and NAT addresses it has,
> click on the enforce one-to-one NAT checkbox and click OK.  It will
> automatically write the configuration files in the proper syntax
> depending on the patches on the firewall, write the files for binding
> the needed addresses to the interface, do all the error checking to make
> sure that you haven't made a mistake, push the files onto the gateway
> and make dynamic changes to the firewall without restarting the
> services.
> 
> Good luck - John
John,
Thanks for your suggestions, I like the sound of the iprange and the 
NETMAP patches. As for the script, I have not used the iptables-restore 
syntax, and am very comfortable with iptables commands. My intentions 
are to actually have two firewall scripts. The default script would have 
rules that would forward needed traffic to our primary webserver. The 
second would have rules that would forward traffic to our failover 
webserver. I would have the firewall verify that our primary server is 
still online every 30 seconds or so with an echo. If not the second 
script would execute, forwarding all traffic to the backup server. I am 
going to have a rather complicated setup(30 web servers 30 mail servers, 
IPsec VPN gateway + pptp roadwarrior access) and would like to use 
iptables commands because im so comfortable with them. I also like the 
idea of doing everything with one (technically two) scripts, as a 
recovery after a disk failure would be as simple as installing Linux, 
putting the script on the server and executing it.

As for using iproute2 vs. aliases, why would you use iproute2? What are 
the benefits of doing this?

Again, thanks alot for the suggestions.

Regards,
Thomas


