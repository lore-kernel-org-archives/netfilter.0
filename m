From: Roderik van Heijst <roderik@digicit.nl>
Subject: Re: forwarding to an external ip (edition II)
Date: Wed, 19 Jan 2005 12:04:16 +0100
Message-ID: <20050119110416.GA28664@digicit.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi again,

quick abstract:
-=-=-=-=-
i'm trying to redirect 80.69.73.147:1111 (boron) to 131.155.228.4:1111 (orion). To do
this, i use exactly the same config as i used to redirect
62.131.95.133:1111 (phex) to 131.155.228.4:1111 (orion). Surprisingly,
boron refuses to act the same as phex (when trying to connect to
boron, you simply get no reaction -> connection timed out after some
time. phex however, cutely redirects to orion). This discrepancy can't be due to
the configs .. they're the same! So what is the 'problem'?
-=-=-=-=-

i'm good in responding late :D i'm responding to both Jason and Samuel
in this single email, so if you're the latter one, scroll down :p

> > iptables -F
> > iptables -t nat -F
> > iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 1111 -j DNAT --to
> > 131.155.228.4
> 
> shouldn't that be:

>   iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 4321 \
>     -j DNAT --to-destination 131.155.228.4:1111

hmm yeah according to what i said, yes, but instead of redirecting
[boron|phex]:4321 to orion:1111, i decided to make both 1111. As to
diminish my confusion a little ;) no 4321's anymore.

> it would be nice to see the output of:
> 
>   iptables -t nat -vnxL && iptables -vnxL

this is phex (the working one):


Chain PREROUTING (policy ACCEPT 307796 packets, 19158968 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       2      108 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:1111 to:131.155.228.4 
       7      348 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:8080 to:131.155.228.4:1111 

Chain POSTROUTING (policy ACCEPT 41528 packets, 2703403 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
      14      756 MASQUERADE  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:1111 
   15428  1089859 MASQUERADE  all  --  *      *       10.0.0.0/24          0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 70013 packets, 8101780 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
Chain INPUT (policy ACCEPT 5992886 packets, 2962747150 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 5969935 packets, 2763419996 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 8497655 packets, 958047964 bytes)
    pkts      bytes target     prot opt in     out     source               destination         


and this is boron (who refuses acting nicely):

Chain PREROUTING (policy ACCEPT 2739595 packets, 217170951 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       8      480 DNAT       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:1111 to:131.155.228.4 
     166     8828 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:8080 to:80.69.73.147:80 

Chain POSTROUTING (policy ACCEPT 233464 packets, 14658006 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       1       60 MASQUERADE  tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp dpt:1111 

Chain OUTPUT (policy ACCEPT 233480 packets, 14658966 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
Chain INPUT (policy ACCEPT 21931975 packets, 13480955641 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
      98     6841 DROP       icmp --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 17811292 packets, 15499906021 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

> > Now for the difference that i can spot which may have to do with this:
> > phex uses 2.4.20 whereas boron has 2.4.24. A subtle difference (at least that's what it
> > seems to me) is that phex preroutes things from ppp0 while boron should
> > do that from eth0, maybe that can be the problem? i don't see how, but
> 
> you need to specify the correct interface, yes.  if i put "-i bob" in my
> rules--they won't ever match.  computers are funny that way.

hehe .. :p that's not what i meant though. If i specify ppp0 at phex,
which uses ppp0, and eth0 at boron, which uses eth0 .. that should be no
difference to phex/boron, right ... how the heck could they know the
difference between a ppp0 and eth0 if it's only about the protocol that
runs on those interfaces? that's what i meant by 'cant see how that
should be a problem'.

> > 
<snip> 
> if you were on this you would've seen this come up before, and been able
> to read the explanation on why it works the way it does.  you can still
> search the archives if it's keeping you up at night.

ok i'll do that :) 

now for Samuel ..
 
> What do you mean by `but this is user-space' ?

mmwell, boron and phex (phex is the working one, boron is the
i-got-the-same-config-but-won't-do-what-you-tell-me one) got a small
difference in their kernel, but i don't think that could be 'the
problem', the factor causing the difference in performance - because
iptables is user-space, so it shouldn't matter that much if the back-end
in the kernel works the same (which i assume, because back-ends need to
be very compatible :)).

> 
> > I'm sorry if i sound frustrated, but i am.
> 
> Against what ? 8)

Myself. It took hours to figure out something seemingly simple and I
remembered getting it right in half an hour the first time .. that just
gets me frustrated :p plus having absolutely no idea what to do next ..
can't think of any 'steps' that would help. Randomly trying stuff
doesn't  :p

> Quick comment : May I guess you have static external ip ?

oh yes :)

> If you do, use SNAT instead of MASQUERADE.

i immediately understand why i should do that. :D will change that..

> > A subtle difference (at least that's what it seems to me) is that phex
> > preroutes things from ppp0 while boron should
> > do that from eth0, maybe that can be the problem? i don't see how, but
> > that doesn't surprise me anymore by now.
> 
> That, obiviously, is a problem. The packet will never get DNAT'ed
> (because it doesn't match your rule) if you specified it should
> come from ppp0 where, in fact, it comes from eth0.

Jason replyed with the same thing, so I guess i was very unclear :p .. i
specified the right interface on both phex/boron, ppp0 for phex and eth0
for boron. I wondered if even after specifying this 'difference', there
could be a different way of processing stuff so eventually different
outcomes could be revealed .. i'm trying to find an answer on this
problem in every corner i can find :p

> Maybe I missed something ?

Well, at least someone feels the same as I do :D
still didn't figure it out, still have no idea.

thanks again,
Roderik.

thanks again for responding to my ranting :)
i'm glad there are people who can tell me more, and that they are
willing to do so! 
Roderik.


> > (still valid) p.s. i'm not on this list, figured it's a little silly to subscribe for
> > one question, so please reply/cc/bcc to my address, which is
> > roderik@digicit.nl .. and many thanks in advance.


