From: Khanh Tran <khanh@slc.edu>
Subject: RE: Allowing One IP only to connect to a Port
Date: Tue, 11 Feb 2003 11:57:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB5AA@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doug h <dmh357@hotmail.com>, netfilter@lists.netfilter.org

You'll need to do something like this, where $extIf is your external network
card, $extIP is the public IP on that NIC, and $sourceIP is the IP/network
you'd like to allow access to port 3306.  

#Set the default policy for INPUT to DROP all packets.
iptables -P INPUT DROP
#Specificy what packets are allowed for INPUT access
iptables -A INPUT -i $extIf -p tcp -d $extIP --dport 3306 -s $sourceIP -j
ACCEPT

That should get you started, but remember you'll have to carefully integrate
it into your existing script.  The policies are affected by the specific
order that they are applied.

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: doug h [mailto:dmh357@hotmail.com]
Sent: Saturday, February 08, 2003 3:37 PM
To: netfilter@lists.netfilter.org
Subject: Allowing One IP only to connect to a Port 



Hello,

I am a newbie and have a very simple question.  I only want to allow a few 
chosen IPs to have access to port 3306.  I use IP tables and have not yet 
deciphered all the command options.  I have focused only on blocking IPs 
completly and cannot seem to figure out how to allow trusted IPs to ports.

Any help or references would be apreciated.

Thanks,

Doug





_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail




