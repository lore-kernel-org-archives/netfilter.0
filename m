From: Nilesh <niluforalways@yahoo.com>
Subject: Re: anti-dos
Date: Wed, 28 Jan 2004 02:42:43 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040128104243.49272.qmail@web13208.mail.yahoo.com>
References: <1075286102.2000.61.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075286102.2000.61.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: netfilter@lists.netfilter.org


Sir,
 
Will you help on this i have installed Iptables
firewall on my mail server with two eth cards eth0
for internet and eth1 for lan 
how can i protect from the attacks on 1st feb 
please help me can i use same rules  if yes 
$IFACE_INET --????
$IFACE_DMZ ---???
can u tell me about this 

waiting for reply 

--- Ray Leach <raymondl@knowledgefactory.co.za> wrote:
> On Wed, 2004-01-28 at 12:08, Axel Heinrici wrote:
> > Hi
> > 
> > On Wednesday 28 January 2004 09:14, Ray Leach
> wrote:
> > >
> > > You can use the limit support to limit packet
> rates:
> > >
> > > ### syn-flood chain
> > > $IPTABLES -N syn-flood
> > > $IPTABLES -A syn-flood -i $IFACE_INET -m limit
> --limit 75/s
> > > --limit-burst 100 -j RETURN
> > > $IPTABLES -A syn-flood -i $IFACE_DMZ -m limit
> --limit 75/s
> > > --limit-burst 100 -j RETURN
> > > $IPTABLES -A syn-flood -i $IFACE_INT -j RETURN
> > > $IPTABLES -A syn-flood -j LOG --log-prefix
> "SYN-FLOOD: "
> > > $IPTABLES -A syn-flood -j DROP
> > >
> > > $IPTABLES -A INPUT -i $IFACE_INT -p tcp --syn -j
> syn-flood
> > > $IPTABLES -A INPUT -i $IFACE_DMZ -p tcp --syn -j
> syn-flood
> > > $IPTABLES -A INPUT -i $IFACE_INET -p tcp --syn
> -j syn-flood
> > >
> > I have a questions on this. As I interpret the
> rules any packet with is 
> > not catched by the two limit-rules is targeted to
> LOG. 
> > Due to the huge number of possible SYN-Packets in
> a dos-attack this does 
> > not seem useful to me. Shouldn't there be a "-m
> --limit 
> > 10/minute" in the log-rule?
> The LOG rule is so I can trace where the DOS came
> from. The limit of
> 75/s is assuming that our 512K line is capable of
> receiving that many
> packets per second (if it isn't, then we better
> start looking for new
> hardware).
> 
> 
> > 
> > with kind regards
> > 	Axel
> -- 
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc |
> gpg --import"
> Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE
> 8757 EE47 F06F FB28
> --
> 

> ATTACHMENT part 2 application/pgp-signature
name=signature.asc



__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

