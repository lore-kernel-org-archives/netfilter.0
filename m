From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 20:57:51 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206272051470.21019-100000@dns.toxicfilms.tv>
References: <20020627182753.GS31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627182753.GS31466@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.samba.org

> Does anyone have a good solution to catch the third (ACK) packet
> in a tcp connection setup?

# iptables -A INPUT -p tcp --tcp-flags ACK ACK -m recent --rcheck
  --seconds 60 -j LOG --log-prefix "3rd is ack: "

# iptables -A INPUT -p tcp -m state --state NEW --syn -m recent --set -j
  LOG --log-prefix "1st is syn: "

Would not it work?
First SYN packet triggers the recent module in the second rule.
Second (your) syn/ack goes on your OUTPUT.
Third ACK triggers the first rule.

I am not using recent, and i just made that up from the description.

But it seems reasonably.

Or does it?

Regards,
Maciej



