From: Antonio Prado <thinkofit@gmail.com>
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 17:36:49 +0200
Message-ID: <6a0dd625-fe5a-d3df-bf33-75a39613fa5b@gmail.com>
References: <loom.20160705T084958-392@post.gmane.org>
 <f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
 <20160706142100.GA30556@Mail.DDoS-Mitigator.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=Glt201VIgQLJcbPtHWyQbJWqxoNC54NnV9s8ABDmwl0=;
        b=XgTJ3sqfk+P+Bc/gnWOKQ9x/1eETa0KvPBO2jjZkddhxjpdKY8df+r/+QGdIWBHTmE
         TognETgI82VMcUNt/En8FcXvwE/NCrX1ySG+GKFM4WIA4d9n543HhfjOIB+bLUhu5J2J
         mtM7z8cgBgMEVqZUuh2rDEVjMxX4apewSHtqX3F6zf5mTj/VfJ/5gVtsCbTvIyaRRpxS
         LE24ydsNbIJSFAgmE+AevSEk7Yx0QbvhjOUUL4hkO9+G4i5hI8nDxjOYpNRB8uuvIu7G
         EUKWEhngIjMj4pBbQ7efwDuoY3mGa0BSNwn01QnaH6R5kEaph49sZUz0U5ok7BaxqqNs
         ilZA==
In-Reply-To: <20160706142100.GA30556@Mail.DDoS-Mitigator.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alvin.ml@Mail.DDoS-Mitigator.net
Cc: Josh Day <conna666@gmail.com>, netfilter@vger.kernel.org

On 7/6/16 4:21 PM, alvin.ml@Mail.DDoS-Mitigator.net wrote:
> but without iptables, the ddos attacks are even worst ..

at BGP level, when an AS is DDoSed with a 10Gbps rate (or maybe more),
/usually/ there is a lot of gear inside an ISP that becomes unresponsive
before it can reach an iptables/firewall/ddos-mitigation box

so, dealing with iptables to sort out some local rate-limit effect
(until the pipe is not full) is ok, but it's useless if ASes don't
adhere to BCP38 or if they don't deploy BGPSec (for instance)

--
antonio
