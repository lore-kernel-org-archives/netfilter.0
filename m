From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: IPSec through my firewall
Date: Tue, 15 Feb 2005 07:46:06 -0700
Message-ID: <42120B2E.9020802@utilitran.com>
References: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
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
To: Ola Nilsson <ola@fam-nilsson.org>, netfilter@lists.netfilter.org

Hello,

	You can not NAT ESP (protocol 50) traffic. Some IPSEC clients and 
servers support NATing but I believe this requires special 
implementation on the client and server end.

If you want to NAT a VPN tunnel I suggest you try a SSL base VPN. 
OpenVPN works well, you could also try TCP or UDP encapsulation to help 
get around the NAT issue.

Michael.


Ola Nilsson wrote:
> Hello,
> 
> I've got problems with getting IPSec (using NAT-T) traffic through my
> Linux 2.6.10 based firewall. I've now changed my iptables script to
> something rather simple:
> 
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Which is far to open, but I used it to try to find the problem. What I
> see with Ethereal is that the connection seems to have two
> phases. Both phases uses UDP on port 4500. In the first phase ISAKMP
> is used, then ESP.
> 
> 192.168.3.249   is the IP of the machine on my LAN that wants to do IPSec.
> 1.2.3.4         is the IP of the other end of the IPSec tunnel
> 5.6.7.8         is the IP of my firewalls interface on the internet
> 
> This is what I see:
> 
> No.     Time        Source          Destination     Protocol Info
>       3 0.001148    192.168.3.249   1.2.3.4         ISAKMP   Aggressive
>       4 0.001165    5.6.7.8         1.2.3.4         ISAKMP   Aggressive
>       5 9.999541    1.2.3.4         5.6.7.8         ISAKMP   Aggressive
>       6 9.999586    1.2.3.4         192.168.3.249   ISAKMP   Aggressive
> 
>     460 77.461355   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)
>     461 77.461383   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)
>     462 78.961453   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)
> 
> During the ISAKMP phase, my firewall NATs like it shall, and the
> client reports the tunnel as working. But once the real ESP traffic
> starts to flow, it doesn't get NATed as I would like it to.
> 
> I've googled quite a lot, and also tried using firehol to set up the
> iptables (and gotten some help on the firehol forum), but I'm still
> unsuccessfull. What should I do to debug this? Anyone have a set of
> rules that allows ISAKMP/ESP on UDP port 4500?
> 
> Regards,

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

Hey, let me file that under important .... > /dev/null
...
"Hey did you read my e-mail"
"Let my check"
^From:.* > /dev/null
"Nope, I missed it, send it again"

