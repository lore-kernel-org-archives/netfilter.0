From: edwardspl@ita.org.mo
Subject: Configuration of NAT
Date: Sun, 01 Apr 2007 22:13:07 +0800
Message-ID: <460FBDF3.3060306@ita.org.mo>
Reply-To: For users of Fedora <fedora-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-list-bounces@redhat.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/fedora-list>
List-Post: <mailto:fedora-list@redhat.com>
List-Help: <mailto:fedora-list-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=subscribe>
Sender: fedora-list-bounces@redhat.com
Errors-To: fedora-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Cc: "fedora-list@redhat.com" <fedora-list@redhat.com>

Dear All,

If all of service ( include Firewall ) in the same server, and the 
server use Private IP and connection with Router / HUB...
Then, how to define the NAT ( iptable function ) to transfer the IP 
Address ( Public <-> Private ) and auto assign the IP range for Client 
PCs ( LAN users ) ?
Is there an simple sample for reference ?

eg :
For Public IP ( from ISP ) :
IP range : 202.175.123.123 ~ 202.175.123.129 ( I want to assign IP 123 
for the Server first )
subnet mask : 255.255.255.240
Router IP : 202.175.123.128

For Private IP ( All of Server under LAN environment ) :
IP :  192.168.0.1 ( I want to tranfer to 202.175.123.123 )
subnet mask : 255.255.255.0 ( I want to tranfer to 255.255.255.240 )
Router IP : 192.168.0.254 ( I want to tranfer to 202.175.123.128 )

For Client IP ( via NAT + DHCP of the Server ) :
Ip : 192.168.1.1 ~ 192.168.1.50

Edward.






-- 
fedora-list mailing list
fedora-list@redhat.com
To unsubscribe: https://www.redhat.com/mailman/listinfo/fedora-list
