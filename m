From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: proxy+port redirection behaviour
Date: Thu, 21 Apr 2005 10:02:26 -0500
Message-ID: <4267C082.7030809@riverviewtech.net>
References: <110c784405042103362108ebad@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <110c784405042103362108ebad@mail.gmail.com>
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
To: Metal Gear <finattack@gmail.com>
Cc: netfilter@lists.netfilter.org

Metal Gear wrote:
> Hi all,
> 
> 1) Dedicated Firewall
> 2) Server
> 3) Clients
> 
> It is a switched network and the 'Server' has only one interface card 
> connected to the switch. The 'Server' can only access the internet as i have 
> specially blocked the clients on the 'Dedicated Firewall'. Now what i want 
> is that 
> 
> 1) When clients connect to the smtp port of the 'Server' they are redirected 
> to the another smtp server on the internet. One more thing my 'Server' is 
> not listening on port 25 i just want to have a behaviour of port redirector. 
> Redirecting connections destined to the 'Serve' on port 25 to a specific 
> server on the internet.
> 
> 2) Now in this case i wanted to have the behaviour of proxy server. Whenever 
> client connects to any ftp (or any other service) server on the internet 
> they are silently proxied thru the 'Server' as 'Server' can only access the 
> internet.
> 
> My clients gateway is set to 'Server'
> 
> Is that possible to achieve thru iptables if yes can someone give me a 
> direction or iptables script how to accompalish that.
> 
> Thanks...

I don't know how much of a proxy this set up will behave like, but I think it can be made to work.  Basically you need a couple of rules in your IPTables nat table in the PREROUTING and POSTROUTING chains.

iptables -t nat -A PREROUTING -s $LAN_IP_Subnet -d $Server_LAN_IP -p tcp --dport 25 -j DNAT --to-destination $SMTP_Server_on_INet:$SMTP_Port
iptables -t nat -A POSTROUTING -s $LAN_IP_Subnet -d $SMTP_Server_on_INet -p tcp --dport $SMTP_Port -j SNAT --to-source $INet_Address_of_LAN_Server

Where:
$LAN_IP_Subnet is your IP Subnet in use on your LAN.
$Server_LAN_IP is the IP address of your server / firewall / router in use on your LAN.
$SMTP_Server_on_INet is the IP address of the SMTP server on the INet that you want to use.
$SMTP_Port is the port that the $SMTP_Server_on_INet is listening on.  Note:  This is normally 25, but RFCs have defined that client MUAs sending email to servers are suppose to use port 587 now as 25 is reserved for SMTP server to SMTP server communications.  However this is not done as often as they would like so both 25 and 587 will work.
$INet_Address_of_LAN_Server is the INet address that your server / firewall / router uses to connect to the internet.



Grant. . . .

