From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ethernet headers and iptables counters
Date: Mon, 10 Nov 2003 09:40:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311100940.hAA9eij16696@agate.rockstone.co.uk>
References: <1068455679.10203.4.camel@hohum.marcsnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068455679.10203.4.camel@hohum.marcsnet.com>
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
To: netfilter@lists.netfilter.org

On Monday 10 November 2003 9:14 am, Marc Lucke wrote:

> Hi,
>
> Do the iptables counters include layer 2 ethernet packet headers?  If
> so, how much traffic is this - is it a set amount?

No, because you may not be using ethernet.

Netfilter can be used for packets across ethernet, 802.11, PPP modems - all 
sorts of network transports.

Packet and byte counters in netfilter are IP (OSI layer 3) and upwards.

You can check this easily by creating a rule matching something specific (eg 
ping packets), send a known amount of traffic through the box (or measure it 
with a packet sniffer / protocol analyser such as ethereal, which will give 
you a detailed view of the contents of the packets), and then check what the 
counters say.

Antony

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics
                                                     Please reply to the list;
                                                           please don't CC me.

