From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Kernel: NET: messages suppressed (I am sure it has been covered before)
Date: Thu, 23 Oct 2003 17:03:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310231603.h9NG3x702705@onyx.rockstone.co.uk>
References: <3F41DBB59549A54482D4FC25AEEDCBE18B9A9F@MAIL-06VS.atlarge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F41DBB59549A54482D4FC25AEEDCBE18B9A9F@MAIL-06VS.atlarge.net>
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
To: Netfilter@Lists.Netfilter.org

On Thursday 23 October 2003 4:47 pm, Frischknecht Peter wrote:

> I am getting slammed.  My server will display anywhere from a few
> hundred to 50K messages suppressed.
>
> Network analizers (Ntop, iptraf) have been unable to identify the source
> of the traffic.  If I run these utilities on the server, they freeze
> (while a flood is going on).  If I run the utilities on a different
> computer on a port of the switch, they don't see the traffic intended
> for the server (obviously).  If I configure the switch for a "monitor"
> port (one that sees all traffic) and plug a different computer on that
> port, then that computer freezes too, along with the server.

Try connecting a hub between your switch and the server which is being 
affected, then plug a machine running a protocol analyser such as ethereal 
into the hub, without assigning a network-valid IP address to the analysis 
machine.   If you're worried about the analysis machine being affected by the 
flood of traffic, just plug it in for a couple of seconds and then unplug it, 
and then see what the analyser caught during that time.

If you've found some network attack which blows away the Linux network stack, 
causing the 'freezing', try using a machine running BSD (or maybe even 
Windows!?) for doing the analysis - they're unlikely to be vulnerable to the 
same sort of attack.

You say you have managed to identify some of the machines causing the traffic 
floods - what operating system/s do they run, and what happens if you plug 
the network protocol analyser into a hub connected to these machines?

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

