From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: Two IP add
Date: Thu, 5 Jun 2003 19:51:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306051951.33575.pc-secure@home.nl>
References: <200306051156.45624.pandre@darkstar.nom.za> <1054813152.1206.9.camel@india> <1054819746.13885.39.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054819746.13885.39.camel@raylinux.internal>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Op donderdag 5 juni 2003 15:29, schreef Ray Leach:
> On Thu, 2003-06-05 at 13:38, Dharmendra.T wrote:
> > On Thu, 2003-06-05 at 15:26, Paulo Andre wrote:
> >         I would like to do the following:
> >
> >         Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8,
> > how would i do this with a rule.
> >
> >         iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j
> > MASQUERADE now how would i put in two ip address's ?

Ok , you could do something like this:

NO_MASK="10.10.10.5 10.10.10.8"

if [ ${NO_MASK} != "" ] ; then
  for nomask in ${NO_MASK}; do
 	iptables -t nat -A POSTROUTING -s x.x.x.x -d ! ${NO_MASK} -j MASQUERADE
done;
fi

this is a bit more flexible, cause , you can ad more ip's the NO_MASK easily 
without changing the rule itself, or have to write a new line.

Pascal


