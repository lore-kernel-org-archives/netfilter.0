From: John Lister <john.lister@kickstone.co.uk>
Subject: Statistic module nth problem
Date: Thu, 26 Feb 2009 20:49:25 +0000
Message-ID: <49A70055.7090207@kickstone.co.uk>
References: <49A6F50D.6010405@kickstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49A6F50D.6010405@kickstone.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've played with the nth function of the statistic module and i can't 
seem to get it to work, This mirrors a previous post where it matches 
each entry once and then doesn't match any more...

looking at the source code makes me surprised it does this unless i've 
misunderstood completely...


from /net/netfilter/xt_statistic.c

static bool
statistic_mt(const struct sk_buff *skb, const struct net_device *in,
  const struct net_device *out, const struct xt_match *match,
  const void *matchinfo, int offset, unsigned int protoff,
  bool *hotdrop)
{
  struct xt_statistic_info *info = (struct xt_statistic_info *)matchinfo;
  bool ret = info->flags & XT_STATISTIC_INVERT;

  switch (info->mode) {
    case XT_STATISTIC_MODE_RANDOM:
    if ((net_random() & 0x7FFFFFFF) < info->u.random.probability)
      ret = !ret;
      break;
    case XT_STATISTIC_MODE_NTH:
      info = info->master;
      spin_lock_bh(&nth_lock);
      if (info->u.nth.count++ == info->u.nth.every) {
        info->u.nth.count = 0;
        ret = !ret;
      }
      spin_unlock_bh(&nth_lock);
      break;
    }

  return ret;
}


The second case should look like this - or have i missed something?
    case XT_STATISTIC_MODE_NTH:
      info = info->master;
      spin_lock_bh(&nth_lock);
      if (info->u.nth.count == info->u.nth.packet) {
        ret=!ret;
      }
      if (info->u.nth.count++ == info->u.nth.every) {
        info->u.nth.count = 0;
      }
      spin_unlock_bh(&nth_lock);
      break;


I'll submit a patch if anyone agrees and i'll also add stuff to handle 
multiple counts - why was this removed????

Thanks



