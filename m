From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables and wireless card in promiscuous mode
Date: Tue, 30 Nov 2004 18:21:23 -0500
Message-ID: <200411301821.23588.Alistair@nerdnet.ca>
References: <41AC6D4F.7000001@eurecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41AC6D4F.7000001@eurecom.fr>
Content-Disposition: inline
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

 see inlined:
 
On November 30, 2004 07:53 am, Claudio Lavecchia wrote:
> Hello People,
>
> I have a little question:
>
> I have two laptops that have 802.11 wireless cards. I am developing some
> application that essentially perform sniffing functions using wireless
> cards in promiscuous mode. To test my code, I need those two laptops not
> to "see" each other (--> I do not want the wireless card of laptop A,
> which is operating in promiscuous mode to process packets coming from
> laptop B) and I tought to do it using iptables. so on laptop A i added
> the following rule:
>
> iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_B -j DROP
>
> and on laptop B I added the rule:
>
> iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_A -j DROP
>
> I just executed my first tests and the feeling  I got is that, for
> example, the wlan card of  laptop B still passes through the packet
> coming from laptop A.
>
> Can anyone confirm  this analysis? If I am right, can anyone give me a
> hint to possibly workaround this?

 Urrm.  
 You are likely doing the filtering in the wrong pipe.  These rules will only 
drop packets that are destined for the IP of the host they are on.  You 
PROBABLY are trying to drop *all* traffic from the other laptop.  Iptables 
can do this at the IP layer, however you will STILL be able to see the 
traffic across that card (from the other laptop) with any decent sniffer 
program since ip sniffers work below the IP layer, before iptables gets the 
packet to filter.  Most decent network sniffers, however, can do mac address 
filtering on input.

 If you would like to have the traffic dropped anyway, there are better places 
to put these rules, even though many are strongly against filtering anywhere 
but in the filter table (including myself) the following would get the 
traffic off your iptables radar:

iptables -A PREROUTING -t mangle -m mac --mac-source MAC_ADDRESS_LAPTOP_A -j \  
DROP

 Although in truth I'm not sure that this is wise, it might serve your 
purposes.

 Alistair Tonner
 RSO HP Unix support 


