From: gregory gilbert <gilbertgregory@caramail.com>
Subject: Re[1] about ip fragmentation
Date: Thu, 09 May 2002 20:17:29 GMT+1
Sender: netfilter-admin@lists.samba.org
Message-ID: <1020968249025056@caramail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Caramail_0250561020968249_ID"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "Ramin Alidousti <ramin@cannon.eng.us.uu.net>; gregory gilbert" <gilbertgregory@caramail.com>, , netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Caramail_0250561020968249_ID
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I use the DOS ping command. The -l option allow to specify 
the length ot the icmppackets.


"iptables -A FORWARD ! -f -p icmp -j DROP" should only drop 
the first fragment or the unfragmented packets

Greg

> I can confirm your finding. "iptables -A FORWARD -f -p 
icmp -j DROP"
> does not drop the second and further fragments of 
fragmented icmp
> packets. However, "iptables -A FORWARD ! -f -p icmp -j 
DROP" does
> work as predicted. Can someone shed some light on this 
behavior?
> 
> Ramin
> PS. I don't know which ping implementation you're using 
but on my
> machine "-l" means "ping sends that many packets as fast 
as
> possible before ..." and "-s" specifies the number of 
data bytes
> to be sent.
> 
> On Thu, May 09, 2002 at 08:51:21AM +0000, gregory gilbert 
wrote:
> 
> > Hi
> > 
> > i am a new user of iptables and i already have a 
problem :
> > i have ton conigure a firewall with iptables command. I 
> > have this first very simple rule:
> > 
> > iptables -A FORWARD -f -p icmp -j DROP
> > 
> > i think this rule should drop any 2nd, or 3rd and so 
on ... 
> > fragment of a ping command.
> > But if i ping a computer and the icmp packet goes 
through 
> > my firewall, i can see some fragments after the 
firewall (i 
> > use tcpdump). It seems this rule is not applied. The 
> > fragmented packets are before and after my linux 
firewall.
> > So i have a question : is there any ip defragmentation 
> > before the rules of the iptables are applied by the 
> > firewall? I mean, i wonder if some fragments are 
received 
> > by iptables, or if the defragmentation occures before 
(it 
> > would be strange : the -f or ! -f flags exist ... so 
the 
> > defragmentation should occur after the iptables rules 
> > application)
> > Or is there a mistake in my command? Or did i 
misunderstand 
> > something with iptables?
> > 
> > In fact, if i just add the following command :
> > 
> > iptables -A FORWARD -p icmp -j DROP
> > 
> > all the packets are dropped (the first fragment, the 
second 
> > and so on ...).
> > But if i just want to drop the 2nd, the 3rd ... 
fragments , 
> > i don't know which iptables rule to add.
> > 
> > To ensure i have fragments, i ping this way :
> > ping -l 2000 x.x.x.x
> > and i can see the fragments with tcpdump.
> > 
> > I really can't understand why my firewall does not 
behave 
> > the way i predicted. So could you help me?
> > 
> > Greg
> > 
_________________________________________________________ 
> > Envoyez des messages musicaux sur le portable de vos 
amis 
> > http://mobile.lycos.fr/mobile/local/sms_musicaux/
> > 
> 
> 
> 
> 
______________________________________________________
Bo=EEte aux lettres - Caramail - http://www.caramail.com


--=_NextPart_Caramail_0250561020968249_ID--


