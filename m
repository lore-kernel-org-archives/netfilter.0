From: Kim Jong Tae <dejavu@bora.dacom.co.kr>
Subject: hook function in  NF_IP_LOCAL_IN does not interruptible_sleep_on?
Date: Sun, 15 Sep 2002 20:13:28 +0900 (KST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.3.94K.1020915200933.12847A-100000@bora.dacom.co.kr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi all.

I  makes hook function, which will communicate with user process
for each packet's arrival.
First, hook function sends data to user process and user process sends
back data. I think that before receiving data from user process, hook
function must wait.  hook func's wait is using interruptible_sleep_on.
When hook func call interruptible_sleep_on, system hangs!!!

code is below .

static unsigned int
enpia_dr_in(unsigned int hooknum,
                struct sk_buff **skb_p,
                const struct net_device *in,
                const struct net_device *out,
                int (*okfn)(struct sk_buff *))
{
....

        interruptible_sleep_on(waitq)
        /* this point system hangs, and console prints "killing interrupt
handler " */
...
}


static struct nf_hook_ops in_ops = {
        { NULL, NULL },
         hook_func, PF_INET, NF_IP_LOCAL_IN, 100
};

When hook fuction goes to interruptible_sleep_on, linux is down.
Same result comes when udp sock communication instead of
nf_register_sockopt.



Why this happens?

Is there a method to wait for some condition in netfilter hook func in  
linux kernel?

If it is impossible, is there another methods to communicate user process?

any comment is appreciate!



