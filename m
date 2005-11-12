From: Gabriel <jarod125@yahoo.com>
Subject: Re: dhcp windows client port
Date: Sat, 12 Nov 2005 13:25:09 -0800 (PST)
Message-ID: <20051112212509.55692.qmail@web60922.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 12 Nov 2005 18:08:23 +0200, P theodorou
<props666999@hotmail.com>  
wrote:

> Hello
>
> i wish  the windows machine which receives Internet from
the firewall pc
> to be restricted fully apart from the port needed to
access the internet
>
> the windows machine has got fully access when my
rc.firewall  contains
>
> $iptables -A FORWARD -i $LAN_IFACE -j ACCEPT
>
> which gives to the windows machine access to every port
>
> i've tried unsuccesully the following command
>
> $iptables -A FORWARD -p TCP -i $LAN_IFACE -- sport XX -j
ACCEPT
>
> my netstat on the windows machine displays various
connections
> few questions now
>
>
> 1 which port should be alolwed for the windows machine to
see internet
> 2 can i restrct it to  something like :
> $iptables -A FORWARD  -p TCP -i $LAN_IFACE  -sport XX  
-dport XX -j  
> ACCEPT
>
> in other words, allow  the windows relevant port for
accesing on the  
> internet  to
> be connected to the specific port of the firewall
>
> regards
>
>
>
>

You could adopt a strategy where you allow all connections
started from  
the inside of your LAN (and, of course, all connections
related to those),  
but none that is started from the internet. So, you could
set the FORWARD  
policy to DROP, allow the IPs from inside the LAN to
connect to the  
internet and then use a rule that allows all ESTABLISHED
and RELATED  
connections.

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/


		
__________________________________ 
Yahoo! FareChase: Search multiple travel sites in one click.
http://farechase.yahoo.com

