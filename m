From: Patrick Schaaf <bof@bof.de>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 20:53:19 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627205319.E2890@oknodo.bof.de>
References: <20020627182753.GS31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627182753.GS31466@cannon.eng.us.uu.net>; from ramin@cannon.eng.us.uu.net on Thu, Jun 27, 2002 at 02:27:53PM -0400
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.samba.org

Hi Ramin,

> Does anyone have a good solution to catch the third (ACK) packet
> in a tcp connection setup?

Maybe you could use the CONNMARK patch, found in patch-o-matic?
Mark the conntrack one way for the first packet of a new connection,
and later match on that mark, changing it to something else when that
match hits.

Thanks for a nice idea from the "how do I bend iptables into a
programming language" department. :-)

best regards
  Patrick

