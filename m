From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Routing for multiple uplinks/providers
Date: Mon, 02 Jan 2012 10:09:59 -0600
Message-ID: <op.v7gsixgyx1lyi3@debiandesk2.net>
References: <op.v69g6qvbx1lyi3@debiandesk2.net>
 <op.v7eyssd3x1lyi3@debiandesk2.net> <4F01A679.8090103@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F01A679.8090103@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

On Mon, 02 Jan 2012 06:43:37 -0600, Ed W <lists@wildgooses.com> wrote:

> I believe also routes are cached per IP, so I guess it might accidentally persist beyond even individual streams (assuming to/from same IPs)

Thanks, I didn't think of that.  If no policy routing rules are matched, the cached route should be used.  Of course, this doesn't explain why connections were dropped when the outgoing interface had a non-routable (LAN) IP number, but were never dropped from the one interface that has a public IP.

I'm hoping someone will comment on the use of "-p tcp" in the SNAT invocation:

(example rule)
iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source 194.236.50.155

I have always seen this rule with "-p tcp", and yet I think it is best to mark ALL my outgoing connections, in case the one interface associated with the default route happens to be down.  For example, DNS queries are usually UDP, I believe.

-- 
Lloyd Standish
