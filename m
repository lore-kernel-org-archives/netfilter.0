From: Alaios <alaios@yahoo.com>
Subject: Re: Problem reexplained.....
Date: Tue, 27 Sep 2005 09:49:47 -0700 (PDT)
Message-ID: <20050927164947.43318.qmail@web54709.mail.yahoo.com>
References: <65aa6af9050927092673267410@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050927092673267410@mail.gmail.com>
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
To: Edmundo Carmona <eantoranz@gmail.com>, netfilter@lists.netfilter.org

I have restarted my pc just for being sure.. i have
run your commands but the tcpdump -i eth0 -vv -n give
nothing :( 
it doesnt work :(
I think its time to start debugging. plz suggest me
how to  use efficiently logging so as to find out what
the is the problem

--- Edmundo Carmona <eantoranz@gmail.com> wrote:

> Well.. first easiest (probably insecure) attempt:
> 
> iptables -P FORWARD ACCEPT
> iptables -t nat -A PREROUTING -d 143.233.222.77 -j
> DNAT
> --to-destination 10.2.4.2
> 
> echo 1 > /proc/blah/blah
> 
> That should stablish comunication between internet
> and the 10.2.4.2
> box (started from the internet).
> 
> On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> > Let me reexplain the problem plz
> > >From src 143.233.222.253 starts some traffic that
> goes
> > to the 143.233.222.77 this is the eth1 of the
> laptop
> > The laptop has also one more interface the
> 10.2.4.1
> > that is connected back to back (cross cable) with
> the
> > interface of an other pc with ip address 10.2.4.2
> > IO want the traffic that reaches 143.233.222.77
> reach
> > the 10.2.4.2
> > This is the first step.. when i succesfully
> implement
> > this then the next step is to forward this traffic
> > from the pc to a second pc... ( i ll use the same
> > methodology if step one works)
> > So now we can only focus to the first step
> > Plz take in mind that i dont have any firewall
> enables
> > /proc/sys/net/ipv4/ip_forward is set to 1. I have
> no
> > other iptables rules applied... I will only apply
> what
> > u ll write to do..
> > Before applying any iptables rules firstly i do
> > iptables -F
> > iptables -F -t nat
> > (if more flush commands are necessary plz say it
> so)
> > So i need your help to implement this simple task
> >
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam
> protection around
> > http://mail.yahoo.com
> >
> >
> 
> 



		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com

