From: Don Gould <don@bowenvale.co.nz>
Subject: IPTables script problem...
Date: Thu, 26 Oct 2006 22:48:43 +1300
Message-ID: <4540847B.8080407@bowenvale.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Can anyone tell me why this isn't working?

If I add the ip to the filter manually from the cmd line then it works,
if I try to do it in the script is doesn't.

 From below...

iptables -A traffic_in -d $3  >> /home/shared/dhcpconnect.log
iptables -A traffic_out -s $3  >> /home/shared/dhcpconnect.log

doesn't seem to add the IP, but...

iptables -A traffic_out -s 192.168.3.151

will work just fine...

Chain traffic_in (4 references)
  pkts bytes target     prot opt in     out     source
destination
  7707 4745K            all  --  *      *       0.0.0.0/0
192.168.2.148
   678  529K            all  --  *      *       0.0.0.0/0
192.168.2.136
Chain traffic_out (3 references)
  pkts bytes target     prot opt in     out     source
destination
  7402 1328K            all  --  *      *       192.168.2.148
0.0.0.0/0
   582 95736            all  --  *      *       192.168.2.136
0.0.0.0/0
     0     0            all  --  *      *       192.168.3.151
0.0.0.0/0

As you can see, I only added 151 to one filter manually.  It should have
been added automatically when the script was next called by dnsmasq.


==== And now for the offending script...


[root@bowenvale shared]# cat dhcp.src
#!/bin/sh
nowdate=$(date)
# echo $nowdate, $0, $1, $2, $3 >> /home/shared/dhcpconnect.log

echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log

echo "Start" >> /home/shared/dhcpconnect.log

mysql -h bowenvale -u oncs -pbutterfly -e "INSERT INTO
oncs.tblSessionRequest (MACAddress, IPAddress) VALUES('$2', '$3
    ');" &> /home/shared/dhcpconnect.log

echo "Done - database log" >> /home/shared/dhcpconnect.log

# Now we start the data accounting bit using IP tables...
# Make sure the iptables rules exist!  This should return errors because
these rules should always already exist.
iptables -N traffic_in  >> /home/shared/dhcpconnect.log
iptables -N traffic_out  >> /home/shared/dhcpconnect.log

echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log

echo "Done - rule create" >> /home/shared/dhcpconnect.log

# Create Rule for IP to count the data.
iptables -A traffic_in -d $3  >> /home/shared/dhcpconnect.log
iptables -A traffic_out -s $3  >> /home/shared/dhcpconnect.log

echo "Done - counter add" >> /home/shared/dhcpconnect.log

#add chains as target to FORWARD rule - after the first time, this
should always be already done.
iptables -I FORWARD 1 -j traffic_in  >> /home/shared/dhcpconnect.log
iptables -I FORWARD 2 -j traffic_out  >> /home/shared/dhcpconnect.log


echo "Done forward rule add" >> /home/shared/dhcpconnect.log

echo "Done", $2, $3  >> /home/shared/dhcpconnect.log



[root@bowenvale shared]#



Cheers Don
-- 
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz -
www.bowenvale.co.nz - www.hearingbooks.co.nz - www.buxtonsquare.co.nz -
SkypeMe:  ThinkDesignPrint - Good ideas:  www.solarking.co.nz




