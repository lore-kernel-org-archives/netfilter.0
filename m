From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: tracking usage by mac address
Date: 30 Aug 2004 20:54:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093887545.23659.47.camel@nostromo.bgsecm.com>
References: <41329413.3080407@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41329413.3080407@shaw.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 30 de 08 de 2004 a las 04:42, Henry Baxter escribió:
> Hello,
> 
> I have been reading this list for several months, and I've really 
> enjoyed learning all that I have, thank you everybody for the 
> opportunity to listen:)
> 
> Ultimately I am hoping to track the bandwidth usage of about 50 client 
> computers through my router based on their MAC address. I understand 
> that by simply writing a rule that does nothing to the packet, such as 
> 'iptables -A FORWARD -m <mac address>' I can parse the netfilter log and 
> find out what I need. This seems rather convoluted though - getting 
> netfilter to create a basically human readable log file, and then 
> parsing it.
> 
> All of the network traffic is passing through unmanaged switches until 
> finally hitting the interface on the router.
> 
> I'm sure this must have been done by many others before, so could 
> anybody give me some idea of what the most common way to handle this 
> situation would be?
> 
> I appreciate any input.
> 
> Henry Baxter

If you don't have a big number of users you can do something like this:

iptables -N MACSTATS
iptables -A INPUT -j MACSTATS
iptables -A OUTPUT -j MACSTATS
iptables -A FORWARD -j MACSTATS
iptables -A MACSTATS -m mac --mac-source $CLIENT1_MAC_ADDRESS -j RETURN
iptables -A MACSTATS -m mac --mac-source $CLIENT2_MAC_ADDRESS -j RETURN
...

So you can read the data transfered by each client with the command:
iptables -L MACSTATS -nv

More or less this is what we do in our bastion-firewall-stats module
from our bastion-firewall GPL firewall, but we extract the counters with
C code to put it in a rrdtool database and then create graphs with the
data. If need code you can look at the source code of this addon from
our firewall.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


