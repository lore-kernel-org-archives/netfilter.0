From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Empty Target
Date: Fri, 06 Feb 2009 20:15:09 -0600
Message-ID: <gmiqrd$u0s$1@ger.gmane.org>
References: <498cb439.20018e0a.3be8.ffffc9e3@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498cb439.20018e0a.3be8.ffffc9e3@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gilad Benjamini wrote:
> I am trying to troubleshoot an iptables rule set, trying to understand where
> different packets are going. I have found that using "iptables -L -v" is a
> useful tool, with the counters telling me what's going on.
> To "trigger" counters I currently use LOG rules. I would actually prefer
> some sort of empty rule; a rule that would do nothing beyond increasing the
> counters.
> 
> Does something like that exist ?
> Seems trivial to implement. 

Extremely trivial, and already there.  There is no requirement that a rule
must have a target.  Just write the rule without one.  I have several such
rules in my ruleset.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

