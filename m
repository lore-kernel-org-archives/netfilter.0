From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: iptables analyzer - but slightly OT
Date: Tue, 28 Oct 2003 22:57:29 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031029065729.13556.qmail@web40203.mail.yahoo.com>
References: <3F9F5163.5020805@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9F5163.5020805@Loudoun-Fairfax.com>
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
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org

You would have to have a complete dataset from every packet that
passesnetfilter to run any kind of rule analysis. Knowing which rule droppeda
packet isn't the same as knowing exactly which condition of that rulecaused the
drop. Could be iface, dport, sport, etc. You would almosthave to duplicate the
logic of netfilter itself to do any meaningfulanalysis at this level. However I
think a simpler but still useful toolcould be created by using the packet and
byte count kept by netfilterto sort rules within chains
  

Jeff

I agree with Jeff here. In fact I have been thinking about this for some time..
I even attempted something with bash script to do this...but my scripting
capability is not up to par..

Upon really thinking about it.... if I could just do a continuous iptables
-vxnL   I would be happy. Perhaps some added counters for in which the the
differences are shown from the last time it is last checked... say like a 5-10
second delay?

Sort of a iptop heh.... an iptables in... top like display...

This is my dream!
SBlaze



=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/

