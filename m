From: Norman Rasmussen <norman@rasmussen.co.za>
Subject: nft tproxy without iproute2 rule
Date: Wed, 9 Oct 2019 13:49:57 -0700
Message-ID: <CAGF1phaHKy_bb1ALmB+YpB27gYtN30U8=zViaJ181TaCEPd4sQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmussen.co.za; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=pqFIG0/MnPKA3krR49Mhbin6rxderxNTnZ8S5jOT5X4=;
        b=uLB9Fz+YxDbWPq+u19PwW1DcNv7mZSBh1q9OBUPb1SHYnr7OduqbLd1SbEsUZVSW4Y
         XiE7CX4+Z/LHW8WgPW+we+4Es6rEkHw6ZSB8kru9igq+sZl1QvoA7WZWpB0XSw8WlLUQ
         92Coscpyag8uxseGG3o7JapW0y2302rUjEJ4M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

If there was a way to set the output interface in the prerouting and
output hooks, would the meta mark action and ip rule & route still be
required?

The netdev fwd statement can be used to transmit packets via a given
interface, but is only supported in the ingress hook. Would supporting
setting the output interface it for inet hooks just be a matter of
supporting the oif and oifname keywords for the "meta set" statement?
(adding NFT_META_OIF and NFT_META_OIFNAME to nft_meta_set_init and
nft_meta_set_eval)

For example (taking from Documentation/networking/tproxy.txt) the
config becomes:

# nft add chain filter divert "{ type filter hook prerouting priority -150; }"
# nft add rule filter divert meta l4proto tcp socket transparent 1 fwd
to lo accept
# nft add rule filter divert tcp dport 80 tproxy to :50080 meta set
oif lo accept

and for local connections:
# nft add chain filter local "{ type filter hook output priority -150; }"
# nft add rule filter local tcp dport 80 tproxy to :50080 meta set oif
to lo accept

Is there a complication with supporting this in prerouting and output,
or would this mostly just work as expected? I assume it wouldn't need
to do the same as the netdev fwd path where the packet is immediately
sent to egress and xmit, and just doing the far simpler set skb->dev
and let the rest of the processing continue would work fine?

For example in nft_meta_set_eval's switch:

  case NFT_META_OIF:
    dev = dev_get_by_index_rcu(nft_net(pkt), value);
    if (!dev) {
      kfree_skb(pkt->skb);
      return;
    }
    // does this need updating?
    nft_out(pkt)->ifindex = value
    // is this the right way to change the output device?
    skb->dst = dev
    break;
  NFT_META_OIFNAME:
    // something similar to above but using dev_get_by_name_rcu?

Thoughts?

-- 
- Norman Rasmussen
 - Email: norman@rasmussen.co.za
 - Home page: http://norman.rasmussen.co.za/
