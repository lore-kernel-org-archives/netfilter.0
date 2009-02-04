From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: conntrack counters on a bridge
Date: Wed, 4 Feb 2009 13:04:51 -0800
Message-ID: <498a0306.09038e0a.4ef5.2dfd@mx.google.com>
References: <5de7cdb50812121533j31484be5pfec1c4a91afae9bb@mail.gmail.com>	 <5de7cdb50902040948m56b1d58ctf3d9889cbee37465@mail.gmail.com> <d39744a20902041038n501dd455g7864cddd1d2f1870@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=wGbhMOYZ00NA+/hTt7tKdf8Af0ROdgIfSbwTazgxzYE=;
        b=m9rbNRjUj9ZiCzpGDj8Nu74eGQZND7dtqJ9eHmblRbmKxl80dJfzofFQq6SWinVrwZ
         YEP0WsIfcFYs9jIDc6xXsJYSojE13DUg1yiTSNW7epqwhObSL+1PcCtLdRK8k8MYfAtk
         17UJOeivoVUHFgGzHIAouvqQJAMOWsMcRlaGw=
In-Reply-To: <d39744a20902041038n501dd455g7864cddd1d2f1870@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have iptables running on a bridge. The bridge has three interfaces

I am trying to understand what happens with flooded packets.
Below are my conclusions. I would appreciate comments and corrections. If
someone has a relevant link, that's even better.

- Flooding is done by the bridge code, and therefore flooded packets are
seen twice in the FORWARD chain
- Conntrack counters are updated in PRE_ROUTING, and therefore 
   - The connection counters are correct (not duplicate)
   - Counters are also updated for packets which are eventually dropped
- Conntrack confirms connections in POST_ROUTING, and therefore
   - Dropped connections are not confirmed
   - Accepted connections are confirmed twice, and that's harmless ?

Thanks
Gilad 

