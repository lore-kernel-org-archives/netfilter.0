From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: Re: RE: Ip Forwarding
Date: Sun, 23 Feb 2003 17:08:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6be7c6bd6e.6bd6e6be7c@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Thanks for the reply, I'd like to say that you're right I do need






To read up more about IP routing. =A0Did you know these protocols






Come in layers?(just a little joke.) Anyway I thought I would explain






My situation in case any one else needs to do what I did. Frankly I






Wouldn=92t find this situation obscure at all as long as you're using






A vital windows system behind a dedicated firewall box.






The key was not netfilter at all, though netfilter is amazing and






Should be used for ip filtering on the box. =A0The key was bridge-utils.






Bridge-utils makes your box into essentially a transparent switching






device. =A0A link to an article I found on the home page's site made it






so easy to set up that I don't know why I didn=92t find out about it






sooner. =A0






Anyway as long as you set the default gateway of the bridge box to the=20






original gateway that your computers were using, and the internal=20






network gateway to the virtual device's IP, then youre ok. If you do use=20






bridge make sure you upgrade to at least the 2.4.20 kernel and run the=20






latest bridge patch, even if its for an earlier kernel(2.4.19 etc) itll=20






work. =A0It's about the most transparent setup without having to buy more=
=20






hardware.






Will Olbrys






for any Win2k Active Directory boxes, the client computers will have to=20






rejoin the domain. =A0I know it has something to do with IP routing but I=
=20






cant explain other than to say that it works.






----- Original Message -----






From: Bjorn Ruberg <bjorn@ruberg.no>






Date: Saturday, February 22, 2003 10:43 pm






Subject: RE: Ip Forwarding






> On Sat, 2003-02-22 at 15:57, William Olbrys wrote:






> > Was this too complicated? Heh that's why I wrote such a generic






> > questions






> >=20






> > -----Original Message-----






> > From: netfilter-admin@lists.netfilter.org






> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of=20






> William Olbrys






> > Sent: Friday, February 21, 2003 7:48 PM






> > To: netfilter@lists.netfilter.org






> > Subject: RE: Ip Forwarding






> >=20






> > Well I want to put a windows 2000 domain controller behind my






> > iptables-enabled redhat 8 box. The domain controller had a=20






> static ip






> > before it went behind the firewall and for Active Directory to work






> > correctly it HAS to stay that way. I spent days and days trying






> > otherwise but windows is far too stubborn. AD plus legacy=20






> support for






> > WINS makes nat translation a living hell. So I simply set up all my






> > rules as default accept and let it fly, hoping that the=20






> forwarding would






> > take care of itself. Essentially it did! I could perform simple=20






> function> like connecting to the internet but I couldn't do more=20






> important> functions like cruise the windows network or have=20






> things join/leave/see






> > the domain behind this iptables enabled box. =A0I thought it had=20






> something> to do with routers not seeing the right ip address as=20






> it leaves the






> > iptables box or the routers not being able to find its way back=20






> to this






> > box behind the firewall.






> >=20






> > It struck that while I wrote this complicated email I may have=20






> come up






> > with a solution. Since the static IP of the win2k box is the=20






> same and






> > only the gateway has changed, then the data it sends will be=20






> legitimate> concerning it's IP address(not an internal IP). Could=20






> I create an alias






> > at the outbound NIC level for the win2k's IP address and SNAT=20






> packets> leaving the outbound NIC that originated from the win2k box?






>=20






> Generic questions get generic answers, and that is not what you need.






>=20






> Your questions are not complicated (and the email is definitely not),






> just obscure.






>=20






> To cut to the chase:






>=20






> You do not say anything about what kind of network you use behind your






> Linux firewall.






>=20






> If we assume you use a private network (192.168.*.*, 172.16.*.*,






> 10.*.*.* or similar) of course nothing on the outside will be able to






> connect to your Windows server - simply because they don't know they






> need to connect to it through your Linux server. This is a routing






> issue. A significant fact about NATed networks is that there are=20






> no way






> anything on the outside will know that given resources are behind the






> NATing firewall.






>=20






> If you are still using an IP dedicated to your Windows server but on






> another IP network, consider it pure luck that anything works at all.






>=20






> If you want to get serious answers from this list, you need to=20






> distinctbetween what matters (e.g. your IP network and your=20






> routing tables) and






> what does not matter at all (e.g. how many days you tried beating=20






> senseinto Microsoft products). Provide a network diagram=20






> explaining your






> configuration and any problems related to it. Trying to parse your






> message, however, makes me think that you need to read up on IP=20






> routingbefore you try anything more complicated.






>=20






> And, by the way, please read the netfilter documentation. It's=20






> availableon http://www.netfilter.org/documentation/.






>=20






> Bj=F8rn






>=20






>=20






>=20






>=20






>=20






>=20






> E2-I: The presence of this footer indicates the message has been=20






> scanned for viruses by the WebShield e500.






>=20






>=20






>=20






>=20




=0D
=0D
 E2-O: The presence of this footer indicates the message has been scanned=
 for viruses by the WebShield e500.=0D



