From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 20:25:52 +0000
Message-ID: <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
	 <hnqkk4$62v$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>
	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=oUMIdIDR2hJF5SLkv1kBcK6hNoKRkIcpdOrGOe+1MqI=;
        b=hFPkNNAeegJaptmwB0nntwlvOX5Lz9w0z2D0IXZZS5I0yxi2EMyDKjUhP3mnA0skvp
         p//6S9JK3LioSXg3P4geNJcVwG3cFhCNChcwVTZ8ZVirljdIwxtL2VaoT/bVozOxw3lD
         pv6VM2BDIh46rehVIUYwHEPoA+jHQmbj+KdfI=
In-Reply-To: <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Angel Motta <angelmotta@gmail.com>
Cc: netfilter@vger.kernel.org

On 17 March 2010 15:20, Angel Motta <angelmotta@gmail.com> wrote:

> When I apply this rule i did iptable-save and I see that NAT and I
> also see my rule with itpables -t nat -L, but the clients vpn still
> are conected to the Firewall with that public IP.

Existing connections prior to the rule being inserted will not be
moved until they reestablish a new connection.

You can turn tracing on (iptables -t raw -A PREROUTING -j trace) and
see if the rule is being met or not.

By the sound of it something isn't matching so you might want to try
inserting a rule to log traffic - just use the same match criteria but
use the log target rather than DNAT - if you see no log entries then
the rule for some reason isn't quite right...



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
