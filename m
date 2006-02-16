From: David Vogt <mail@davidvogt.de>
Subject: Re: [libipq] Packet Fragmentation?
Date: Thu, 16 Feb 2006 15:48:09 +0100
Message-ID: <859616420602160648k351cf29dp@mail.gmail.com>
References: <859616420602150337i530a8c39s@mail.gmail.com>
	<2017dff40602150626q76ecc25bme545fe65a92cee16@mail.gmail.com>
	<859616420602150648y3bd37cc7w@mail.gmail.com>
	<2017dff40602150708o2dc1cdc1x966c912f19ec8318@mail.gmail.com>
	<859616420602160105i571967k@mail.gmail.com>
	<2017dff40602160640l17408b1fp45fd622eb4a85f1a@mail.gmail.com>
Reply-To: David Vogt <mail@davidvogt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2017dff40602160640l17408b1fp45fd622eb4a85f1a@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Sivasankar Sankaran <sivasankar.s4u@gmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Take a look at the manual page of libipq
(http://www.cs.princeton.edu/~nakao/libipq.htm) you can find an
example there.

David

2006/2/16, Sivasankar Sankaran <sivasankar.s4u@gmail.com>:
> Dear David,
>                 As we told that we use the netfillter hook function in
> kernal space.But we are not able to retrieve the values...so we decided t=
o
> use libipq...we do not know the complete working of ip_queue module...so
> please provide an sample code to retrieve the values in user space..
>
>                            Thanks in advance....
>
>
>
>
> On 2/16/06, David Vogt <mail@davidvogt.de> wrote:
> > Hi,
> >
> > how did you retrieve the packets from kernel before you decided to use
> libipq?
> > Or is your problem that the ip queing does not work anymore since you
> > use the new kernel 2.6.10 ???
> >
> > David
> >
> > 2006/2/15, Sivasankar Sankaran <sivasankar.s4u@gmail.com>:
> > > Dear David,
> > >               We are implementing a protocol scrubber....we have
> installed a
> > > new kernal 2.6.10 and we have compiled it to insert new module....our
> aim is
> > > to capture the packet and we want to retrieve the values of the recei=
ved
> > > packet but we have done the capturing using netfilter hook function..=
.we
> are
> > > not able to insert our data into the packet in kernal level..so we
> thought
> > > to use libpiq API using ip_queue module.. which will retrieve the pac=
ket
> > > from the queue using netfilter...but we are capturing the packet in
> kernal
> > > level but libipq is not compatible to our kernal...this is our
> problem...so
> > > please help us to retrieve the packet in user level...
> > >
> > >                        Thanks in advance....
> > >
> > >
> > >
> > > On 2/15/06, David Vogt <mail@davidvogt.de> wrote:
> > > > 2006/2/15, Sivasankar Sankaran < sivasankar.s4u@gmail.com >:
> > > > > Dear David,
> > > > >
> > > > >               Hai...We have also used the same scenario,but we ha=
ve
> > > captured
> > > > > the packet in kernal level.we are not able to push it to the user
> > > level...we
> > > > > have used the ip_queue module.We are working in 2.6.10 kernal...w=
e
> have
> > > to
> > > > > modify the packet in user level or at kernal level.So please help=
 us
> to
> > > > > retreive the values in user level..
> > > >
> > > > I don't really know exactly what your problem is, maybe you can
> > > > specify it a little bit more?
> > > >
> > > > So long, I suggest reading the manpage of libipq. There is an examp=
le
> > > > application that serves as a good starting point (as far as I am
> > > > concerned)
> > > >
> > > > David
> > > >
> > >
> > >
> >
>
>

