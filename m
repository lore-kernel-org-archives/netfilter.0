From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: route sorting
Date: Mon, 17 Oct 2011 13:22:52 +0100
Message-ID: <4E9C1E1C.4060309@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:content-type:content-transfer-encoding;
        bh=s+N23g8FNrh9MsJEqrP3EAhCXiG1k0KCGdZn6GsWSYI=;
        b=LmjJ6qWJVQaZPjLTvoKVvDpr/m1bQKIsCa5f7peYvejtgOToCmhNyOPmfNnsdqC6Q5
         IUPNucIZCvpKpZs6ZVuphk6YxF50jiOr/LGYNHGXykKOs4Ca7M0aysdj1KaMAUNF1PvX
         gB5IMkYhyOrwhUu4rlWFpzHOCdUf//NgewQZc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

When I execute "route" to display my routing table all entries are 
sorted by ip address (when -n is specified). This seems to be a bit 
different from previous kernel versions (I am using 3.0.6) - 2.6.38 for 
example - where the routing table used to show the most specific netmask 
first (at the top), which is what I really wanted as it was very easy to 
judge how a particular ip address is going to be routed. When I execute 
"route" now I can't get it to show the routing table the way I want and 
the way it was done in previous kernel versions. Any suggestions?
