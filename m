From: "jrs _" <jrsx13@hotmail.com>
Subject: Browsers & Blocked IPs
Date: Mon, 11 Aug 2003 03:31:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LAW11-F70dT6d3OCcSk0004337f@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi this is a short sample of my set up... and I am hoping someone with more 
experience can give me some good advice... I want to block some ips... but 
in a nice way

Okay everything is good so far... but when I load slashdot.org everything 
pops up VERY fast... as it seems to get the reject accessing ads.osdn.com at 
the top... and as it so happens ads.osdn.com is linked to a single ip

ar.atwola.com on the other hand is linked to several ips. And a page like 
netscape.com takes forever to load. It hangs on trying to get info from 
ar.atwola.com

Is there a way I can improve this?

thanks and example is below

#####EXAMPLE below... short... and lots cut out... but salient bits all 
here...i hope
#block ar.atwola.com and ads.osdn.com
BLOCKHOSTS="205.188.165.185
205.188.165.249
152.163.208.57
152.163.208.121
152.163.208.185
152.163.208.249
64.12.174.57
64.12.174.121
64.12.174.185
64.12.174.249
205.188.165.57
205.188.165.121
66.35.250.124"

#Block Bad IPs
echo -e "      - Disallowing EXTERNAL access from Bad IPs to the network"
for i in $BLOCKHOSTS;
do
$IPTABLES -I INPUT 2 -i $EXTIF -s $i -j DROP
done

#Block Bad IPs
echo -e "      - Disallowing INTERNAL access to Bad IPs from the network"
for i in $BLOCKHOSTS;
do
$IPTABLES -I OUTPUT 2 -o $EXTIF -d $i -j REJECT
done

#Block Bad IPs
echo -e "      - Disallowing Masq'ed access to Bad IPs from the network"
for i in $BLOCKHOSTS;
do
$IPTABLES -I FORWARD 2 -o $EXTIF -d $i -j REJECT
done

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE*  
http://join.msn.com/?page=features/virus


