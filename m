From: Patrick Schaaf <bof@bof.de>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 19:49:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709194926.A17608@oknodo.bof.de>
References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com>; from travis@visionsbeyond.com on Tue, Jul 09, 2002 at 11:29:49AM -0600
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
To: Travis Crook <travis@visionsbeyond.com>
Cc: netfilter@lists.samba.org

>     I currently have two firewalls running.  Both on Mandrake 8.1 running iptables.  I currently have two internet connections (one is a DSL line at 1Mb, the other is straight from an ISP at 2.5 Mb).  I can get 700Kb speeds through the firewall on the DSL line (which is about as fast as it ever is) but I only get about 500Kb speeds through the firewall on the ISP line.  Shouldn't I be able to get at least 2Mb speeds through this firewall? 

At least you can be almost assured that your problems have nothing to
do with iptables and it's NAT. Starting up my crystal ball, I predict
you'll find some half/full duplex mismatch on one of your Ethernets.
Oh, and what type and speed are your CPUs?

best regards
  Patrick

