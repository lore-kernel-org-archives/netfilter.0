From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Problem with bridge+iptables+ulog
Date: Thu, 13 Mar 2003 01:01:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030313010143.5174883d.arnt@c2i.net>
References: <078601c2e886$039a49e0$13fcc5cb@Housecall>
	<20030312135021.58bf6699.arnt@c2i.net>
	<07cc01c2e8ae$8d8ee160$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <07cc01c2e8ae$8d8ee160$13fcc5cb@Housecall>
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

On Wed, 12 Mar 2003 21:16:31 +0530, 
"hare ram" <hareram@sol.net.in> wrote in message 
<07cc01c2e8ae$8d8ee160$13fcc5cb@Housecall>:

> From: "Arnt Karlsen" <arnt@c2i.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, March 12, 2003 6:20 PM
> Subject: Re: Problem with bridge+iptables+ulog
> 
> 
> > On Wed, 12 Mar 2003 15:55:34 +0530, 
> > "hare ram" <hareram@sol.net.in> wrote in message 
> > <078601c2e886$039a49e0$13fcc5cb@Housecall>:
> > 
> > > Hi all
> > > 
> > > some one can help i have the following setup
> > > 
> > > x.x.x.1/24            x.x.x.2/24
> > >    +----------+                     +------+
> > >    | Router A |---------+ +---------| PC B |
> > >    +----------+         | |         +------+
> > >                         | |
> > >                     eth0| | eth1
> > >                       +-----+
> > >                       | qos | (br0 =3D x.x.x.3/24)
> > >                       +-----+
> > > 
> > > 
> > > 
> > > Router A is connected to internet
> > > QOS box running with bridge
> > > PC B is my LAPTOP
> > > 
> > > iam try to make the ULOG usig the following command
> > > 
> > > 
> > > $IPTABLES -I INPUT -i eth1 -j ULOG --ulog-nlgroup 1 --ulog-cprange
> > >    --ulog-qthreshold 50 --ulog-prefix "EXT_IN"
> > 
> > ..does eth1 have an ip address?  Why does br0 have an ip address 
> > at all?  IMNTHO, it does not need it, but then I can generate logs 
> > from: 'tcpdump -i $interface | grep -v $whatever-I-dont-need \
> >  | grep $what-I-want.etc.iterate.greps.as.needed >> $logfile '
> >  
> Hi
> 
> thanks, BR0 have IP becoz of monitoring purpose
> 
> i would like to use IPTABLES to monitor the packets 
> but i could not able to do so, looking for the same help.

..ok, I monitor etc from a third nic inside my firewall, and left 
my bridge and its interfaces, ip-less, outside my firewall.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


