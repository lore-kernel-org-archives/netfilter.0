From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: return
Date: Fri, 4 Jun 2004 11:27:54 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017d01c44a40$20102d70$49caa8c0@caris.priv>
References: <5D3C2276FD64424297729EB733ED1F760639A918@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>, netfilter <netfilter@lists.netfilter.org>

Oh, I see ....
But would that not just return you to the parent chain of syn-flood ????

Thank you for the reply
Peter

----- Original Message ----- 
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "Peter Marshall" <peter.marshall@caris.com>; "netfilter"
<netfilter@lists.netfilter.org>
Sent: Friday, June 04, 2004 11:14 AM
Subject: RE: return


The first time I used RETURN was today.

-A syn-flood -m limit --limit 6/s --limit-burst 10 -j RETURN

As I pasted in the message below, as it is useful in these situations in
which you need to limit packets per second.


-----Original Message-----
From: Peter Marshall [mailto:peter.marshall@caris.com]
Sent: Friday, June 04, 2004 10:02 AM
To: Piszcz, Justin Michael; netfilter
Subject: Re: return

I don't mean to sound rude .. but your response ( as far as I can tell
..
and I apologize if I am missing something) has nothing to do with my
question .. at all ...

Peter

----- Original Message ----- 
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "Peter Marshall" <peter.marshall@caris.com>; "netfilter"
<netfilter@lists.netfilter.org>
Sent: Friday, June 04, 2004 10:49 AM
Subject: RE: return


I do after reading this message:

Now that I've got ipt_recent installed and running, I'd be grateful for
comments or rule samples that could work best to ameliorate syn-floods.
(The site I'm working on has been the target of moderate-to-large-sized
syn-floods for a few months now, ongoing.)

I've been using this approach:

-N syn-flood
-A syn-flood -m limit --limit 6/s --limit-burst 10 -j RETURN
-A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
-A syn-flood -j DROP

-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -i eth0 -p tcp --syn -j syn-flood

...and, on the high-traffic site involved, have had occasions when the
machine became unreachable, the server load too high.

Someone suggested ipt_recent could handle this matter more accurately.
I found a rule on the web that someone was using, and tried that a few
minutes ago, with this approach:

-N syn-flood
-A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
-A syn-flood -j DROP

-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -i eth0 -p tcp --syn -m recent --hitcount 10 --update \
   --seconds 60 -j syn-flood

...but very soon _no one_ could get a server connection, with that.

My 'mental model' of how ipt_recent is working must not be correct --
at least, I don't understand why the '--limit' ruleset seems to allow
normal traffic under most conditions but the '-m recent' rule kept
normal users from getting in, just a few minutes ago.

If anyone knows what I'm missing in my understanding of this, or has a
ruleset that works well to ameliorate syn-flooding, please let me know.

Thanks kindly,

-- 

 -- Jeff --   <http://www.wellnow.com>

 "There's nothing left in the world to prove.  All that's worth doing
  is to love one another, using whatever means are available to serve."



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter Marshall
Sent: Friday, June 04, 2004 9:39 AM
To: netfilter
Subject: return

I was just wondering if anyone here uses "return" in their rules .. I
understand what it is for .. just wondering if it is efficient to use.

ex.

-A Forward -s 192.168.200.5 -o eth1 -j subchain1
-A Forward -s 192.168.200.0/24 -o eth1 -j subchain2

-A subchain1 -d 200.200.200.200 --dport 1234 -j ACCEPT
-A subchain1 -d 200.200.300.300 --dport 4321 -j ACCEPT
-A subchain1 -j RETURN

-A subchain2 .......... blah blah blah ....

Or would you just write the rules different ?

Also, I was wondering is there a way to specify multiple source ip
address ?

ex -s 192.168.200.5, 192.168.200.20 .....

Thank you,
Peter.


Peter Marshall, BCS
Network Administrator, CARIS
115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
Phone:  (506) 458-8533 (Reception)










