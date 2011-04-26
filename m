From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset v6.latest bugs?
Date: Tue, 26 Apr 2011 15:57:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB61410.4070202@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 26 Apr 2011, Mr Dash Four wrote:

> > > Yeah, but the set is empty!
> > > 
> > > It is flushed, so why is it that after the set is cleared (and there are
> > > no
> > > elements in that set!), it still occupies 4 times as much memory it had
> > > initially with the same number of elements, i.e. zero? If this isn't a
> > > memory
> > > leak it is a very bad practice I would think.
> > 
> > Hashes are never shrunk. The hash was initiated with the size 1024. Then it
> > was doubled, again and again. Even after deleting all the elements, the base
> > structures are there, emptied, ready to occupy new elements.
> >   
> Right! OK, I just realised that the has value has grown as well, thus
> increasing the memory footprint, which is fair enough i suppose. I also
> assumed that the hash value could double up indefinitely until the maxelem is
> reached, but that turned out not to be the case - the hash value doubled up
> just once:
> [root@test1 ~]# ipset -N test hash:ip maxelem 262144
> [root@test1 ~]# ipset -A test 10.4.0.0-10.7.255.255
> ipset v6.4: Element cannot be added to the set: it's already added
> [root@test1 ~]# ipset -F test
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 2048 maxelem 262144
> Size in memory: 32896
> References: 0
> Members:
> [root@test1 ~]#
> 
> Is this intentional?

Due to the restarting bug (add the first element again) and failing as it 
is already added, the resizing happened once. If reissued the

ipset -A test 10.4.0.0-10.7.255.255
ipset -F test
ipset -L test

commands, you'd see that the hash is doubled again.

After the the bug is fixed, the hash will be doubled as many times as 
required and the parameters (maxsize) and physical memory permit.
 
> Performing the same set of statements as in my initial post, but with maxelem
> 262144 (the number of ip addresses in that range) as well as hashsize set to
> the same number produces no errors and after "flush" the hash set uses the
> same memory footprint as when there were no elements stored there.
> 
> > If you don't need a large set anymore, swap it with a smaller one.
> >   
> What happens if this set is used in iptables statements, would this work?

Yes, swapping works with sets in use by iptables rules.
 
> > The problem is that at some point the conversion has to be done.
> > It can be done before feeding the data to ipset too.   
> So you think it is a good idea for everybody out there using  ipset to get
> some sort of conversion utility so that hash:net is utilised in that manner
> then?
> 
> Wouldn't it be better if you could adapt ipset and make it behave the same way
> as it currently does with hash:ip type set in terms of specifying members? The
> same way as you did with specifying port ranges as well, not to mention that
> in versions 4+ that used to also be the case. The hash:net type set is the
> only exception in the whole range of sets on offer!

As I wrote, for a few weeks I won't have time to deal with adding new 
features.
 
> > hash:net and iptreemap are quite different. Let's look at 10.1.0.0/16: with
> > hash:net that is a single element, interpreted as a network and matching all
> > elements in it. In iptreemap, that's 65536 different, individual IP
> > addresses.
> >   
> ipset -L on a iptreemap type set tells different - it contains a single
> element - 10.1.0.0/16 - and that's it! It is even better because I could use
> both forms - cidr and ranges alike - and it shows me the ip address ranges
> when I list the actual set. In that respect iptreemap's implementation is much
> better than what currently exists with hash:net set in 6.4!

iptreemap is clever enough to collapse the successive elements into ranges 
in the output. But internally all network, range added to an iptreemap 
type is expanded into the individual IP addresses.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
