From: "Erick Sanz" <esanz@remotedynamics.com>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 10:46:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLECICIIDHIEIENHHOOLEEPBCEAA.esanz@remotedynamics.com>
References: <41241244.40804@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41241244.40804@svw.com>
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
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Sudheer,

I like to block all outgoing traffic in case that someone can take control
either from my firewall system or any other system in my network.

The firewall should be the most secure system in your network; however, like
any other system, it is still vulnerable to bugs and exploits.

If the firewall allows everything out, your system can turn out to be the
one used to attack other systems. It might bee too paranoid, but I like to
protect other people from having my systems attacking theirs.

Also, if you don't have a good system security policy, you might not realize
that your system was taken over until the gentleman with the nice black
suits
knock at your door  ....    =)

-- Just my two cents! maybe even less!




> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Sudheer
> Divakaran
> Sent: Wednesday, August 18, 2004 9:37 PM
> To: Netfilter mailing list
> Subject: A simple question
>
>
> Hi,
>
> In almost all IP Tables articles I've found that the default policy of
> all tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as
> far as INPUT and FORWARD tables are concerned, but I do not understand
> why should we set the default policy of OUTPUT chain to DROP.  OUTPUT
> chain is responsible for packets originating from the firewall itself.
> Whay should we DROP it?
>
> Thanks,
> Sudheer
>
>
>
> This email message has been scanned for viruses.
>



This email message has been scanned for viruses.


