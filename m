From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Mangling problem
Date: Thu, 22 May 2003 01:33:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030522013356.798353f8.arnt@c2i.net>
References: <20030415222001.8410.94392.Mailman@kashyyyk>
	<000001c31f8f$1866f1d0$88cc858b@TOSHIBAFIRE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c31f8f$1866f1d0$88cc858b@TOSHIBAFIRE>
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

On Wed, 21 May 2003 12:49:54 +0100, 
"Regina Reine" <regina@erg.abdn.ac.uk> wrote in message 
<000001c31f8f$1866f1d0$88cc858b@TOSHIBAFIRE>:

> 
> Hi,
> I am doing an experiment with iptables. I use a hub to connect two

..hub?  And being visible wont hurt your experiment?

> computers. Computer A captures the video packet (or any packets) and
> computer B runs iptables and my code in Red Hat 8. Basically, with
> hub, computer B will be able to see the packets coming to computer A.
> I would like computer B to preroute this packet and put these packets
> in userspace where I run my code. 
> 
> I uses :
> 
> ** Iptables -t mangle -I PREROUTING -p udp -I eth0 -j QUEUE
> 
> However, seems like I only be able to capture broadcast packets. (But
> TCPDUMP could see the udp packets). I have checked my code (just a
> simple code that scan what kind of packets and it worked with udp
> generator such as iperf or hping). 
> I have tried a few other similar ways but still only could capture
> broadcast packets. Does anybody spots my mistake or could give me
> advice for better solution? Thank you
> 
> Best regards,
> Regina Reine
> 

..you want tcpdump running in promiscous mode, 'info tcpdump' 
for the gory details, it is also possible to pipe it.

..you could also set up an ip-less sniff bridge, it works nicely 
for bandwidth throttling too.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



