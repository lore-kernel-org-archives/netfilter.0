From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: nf_conntrack_sip and nf_nat_sip can do this??
Date: Mon, 11 Jan 2010 13:26:14 +0100
Message-ID: <20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es


Hi all,

I have been working with nf_conntrack_sip and nf_nat_sip for a while  
to permit SIP clients in a private LAN can connect to servers outside  
without problems.

However, in the case of an internal call, I was wondering if it is  
possible that these two modules detect that the incoming INVITE from  
the LAN is to another client of the same LAN and so not routing it  
outside.

Is it possible??

Thanks in advance,
Rebeca Martinez

