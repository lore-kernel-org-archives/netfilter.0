From: Patrick Schaaf <bof@bof.de>
Subject: Re: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Mon, 24 Jun 2002 23:20:25 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624232025.B9475@oknodo.bof.de>
References: <20020624114108.A3305@spawar.navy.mil> <001b01c21baf$a4450a50$0a01a8c0@ed> <20020624125713.A3624@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624125713.A3624@spawar.navy.mil>; from seberino@spawar.navy.mil on Mon, Jun 24, 2002 at 12:57:13PM -0700
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.samba.org

> User defined chains are *not* tied to specific tables
> as far as I can tell.

Huh? User defined chains are tied to the table they are created in.
And I sometimes hate iptables for that...

best regards
  Patrick

