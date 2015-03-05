From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: packet marking
Date: Thu, 5 Mar 2015 08:01:39 +0100
Message-ID: <20150305070139.GA25656@unicorn.suse.cz>
References: <54F78167.6070104@computerisms.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F78167.6070104@computerisms.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

On Wed, Mar 04, 2015 at 02:04:23PM -0800, Bob Miller wrote:
> I have been reading man pages and googling and I am not finding
> understanding.  maybe somebody can explain:
> 
> under my mangle table (using iptables-restore to load):
> 
> -A PREROUTING -p udp -m udp --dport 4500 -j MARK --set-mark 30
> -A PREROUTING -s 192.168.171.0/24 -m mark ! --mark 30 -j MARK --set-mark 40
> -A PREROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
> -A PREROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40
> 
> This logs packets with both marks.
> 
> If I change the LOG target to POSTROUTING, like so:
> 
> -A POSTROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
> -A POSTROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40
> 
> only packets with the mark 40 are logged.  I think it should log both.
> 
> If I consult the nfpacket flow chart, nat/PREROUTING comes after
> mangle/PREROUTING, and I cannot log packets with a mark of 30 there
> either.
> 
> Traffic keeps flowing, so the packets themselves are not being
> dropped, but the mark apparently is not passed from the initial
> chain. Everything I have read indicates it should be.  what could I
> have done (or not done) to make this happen?  Or better yet, what
> should I be reading that would explain this?  I get the feeling I am
> overlooking something really obvious...

Without seeing a complete set of rules and without knowing what do the
packets look like (and your network configuration), I'm afraid it would
be only a guesswork.

The "vpnX30" log prefix sounds like there is some kind of VPN involved.
So are those packets being sent on really the same packets you mark in
PREROUTING?

                                                        Michal Kubecek

