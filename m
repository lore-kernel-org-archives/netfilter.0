From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables spof address problem
Date: Wed, 28 Sep 2005 16:15:29 -0500
Message-ID: <200509281615.29632.rob0@gmx.co.uk>
References: <433B01E9.6050700@neostrada.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433B01E9.6050700@neostrada.pl>
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

On Wednesday 2005-September-28 15:49, Piotr Holubniak wrote:
> Lest assume that spoofed  address is IP which is not assignet in the
> local network. Netfilter logs incomming traffic but it shows MAC
> address unknown or completely unpredictable (Windows shows all 0-ros,

The MAC address is a layer 2 thing. It is only seen within a physical 
Ethernet segment. BTW/FYI, those are easily spoofed too; see ip(8) and 
ifconfig(8).

> How can I make netfilter to log MAC address of the attackers
> computer, not this one which is resolved by TCP/IP stack ? Is it 
> possible?

Not that I know of. You don't see MAC addresses outside your segment. 
Not seeing them is a pretty strong indicator that they won't be logged.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

