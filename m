From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 08:58:54 +0100
Message-ID: <jb4nnu$s0u$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

nfq_set_verdict() or nfq_set_verdict2():
   NF_DROP    discard the packet
   NF_ACCEPT  the packet passes, continue iterations

In my callback I pass NF_ACCEPT to let the packet continue its travel
through the subsequent rules (normal iptables rules).
but the packet doesn't reach the subsequent rules.
The "obvious" explanation for that behavour would of course be
when not NF_ACCEPT but NF_DROP had been passed to the verdict routine.
But it's not the case. So, then NF_ACCEPT seems to behave anormal here,
that's mysterious.

Here's my script:

  ...
  iptables -A INPUT   -p all  -j NFQUEUE --queue-num 4711
  iptables -A INPUT   -p all  -j LOG --log-prefix "DEBUG ALL "
  ...

# iptables -L -n
Chain INPUT (policy DROP)
target     prot opt source               destination
...
NFQUEUE    all  --  0.0.0.0/0            0.0.0.0/0            NFQUEUE num 4711
LOG        all  --  0.0.0.0/0            0.0.0.0/0            LOG flags 0 level 4 prefix "DEBUG ALL "
...

The logging normally functions well, but when NFQUEUE is active
then logging of the received packets mysteriously stops.


# uname -a
Linux s7 3.0.0-1-rt-amd64 #1 SMP PREEMPT RT Sat Aug 27 17:34:31 UTC 2011 x86_64 GNU/Linux


int grcCB = 0;
static int cb(struct nfq_q_handle* qh, struct nfgenmsg* nfmsg, struct nfq_data* nfa, void* pUserData)
   { // this callback func is called from nfq_handle_packet()

     bool  fDrop = false;
     const u_int32_t id = process_pkt(nfa, fDrop);
     return grcCB = nfq_set_verdict(qh, id, fDrop ? NF_DROP : NF_ACCEPT, 0, NULL);
   }

...
const int rv = recv(fd, buf, sizeof(buf), 0);       // is blocking!
if (rv >= 0)
   {
     if (nfq_handle_packet(h, buf, rv) == 0)
       {
         //...
       }
     else
      {
        printf("ERR: rc of handle_packet is %d\n", grcCB);
      }
   }

nfq_set_verdict gives 0 and hence the "ERR" line doesn't get executed ever.

Is this a bug of the library or do I need to use something different than NF_ACCEPT?
What about the last 2 params of nfq_set_verdict, could they be the reason?

