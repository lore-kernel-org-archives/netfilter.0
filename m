From: Shaun Sharples <shaun@bflyblue.za.net>
Subject: Many TC u32 filter rules
Date: Tue, 1 Mar 2005 15:16:30 +0200
Message-ID: <20050301151630.B30345@starlight.chat.za.net>
Mime-Version: 1.0
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

Hi,

I'm using many u32 rules to match single IP addresses which then get
shaped using HFSC. Rules continually get added and removed as our DSL
clients authenticat or disconnect.

The initial problem I had was a 'tc filter del' only deletes rules
reliably by referring to the rule's handle. From the cls_u32.c code its
apparent the lower part of the handle can range from 0x800 to 0xfff so I
use hash buckets to allow more than 2048 rules (hashing on the last
octet).

The next problem is that the code allocates the 'next highest' handle
available:

static u32 gen_new_kid(struct tc_u_hnode *ht, u32 handle)
{
        struct tc_u_knode *n;
        unsigned i = 0x7FF;

        for (n=ht->ht[TC_U32_HASH(handle)]; n; n = n->next)
                if (i < TC_U32_NODE(n->handle))
                        i = TC_U32_NODE(n->handle);
        i++;

        return handle|(i>0xFFF ? 0xFFF : i);
}

Over time this reaches 0xfff, and multiple rules then exist with the
same handle. I've hacked some (rather ugly) code together to allocate
the lowest available handle instead:

static u32 gen_new_kid(struct tc_u_hnode *ht, u32 handle)
{
        struct tc_u_knode *n;
        unsigned i;
        int bit;
        char avec[256];

        memset(avec, 0, sizeof(avec));

        for (n=ht->ht[TC_U32_HASH(handle)]; n; n = n->next)
        {
                i = TC_U32_NODE(n->handle);
                if (i >= 0x800 && i <= 0xFFF)
                {
                        bit = i - 0x800;
                        avec[bit / 8] |= 1 << (bit % 8);
                }
        }

        for (i = 0x800; i < 0xFFF; i++)
        {
                bit = i - 0x800;
                if (!(avec[bit / 8] & (1 << (bit % 8))))
                        break;
        }

        return handle|(i>0xFFF ? 0xFFF : i);
}

This seems to work using some basic testing, but when running over a
long period of time I'm getting kernel crashes. It is possible for
more than one 'filter add' or 'filter del' to be running in parallel
(this is on an SMP server running 2.6.11-rc2-mm2).

Can anyone suggest why this might be causing Oopes or a better way of
allocating handles? Otherwise, is there an easier way of managing tc
filter rules that I'm missing?

Regards,
Shaun Sharples

