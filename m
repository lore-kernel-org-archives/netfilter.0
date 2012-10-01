From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: More that one not ! condition in a single rule.
Date: Mon, 1 Oct 2012 16:32:03 -0500
Message-ID: <20121001213202.GN3672@harrier.slackbuilds.org>
References: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Oct 01, 2012 at 03:14:10PM -0300, Net Warrior wrote:
> Does anyone know if it's possible to include more than one ! not
> clause in a single rule ?
> I' have the following
> 
> IPTABLES -A AUDIT-RULE  -d $D_INT  ! -s x.x.x.x \
>          -m limit --limit 10/s -j LOG \
> 
> I'd like to include other IP's, do I have to duplicate the sentence ?

In addition to Andy's good suggestion, you should think about what 
the second negated rule would mean.

"If the destination is not $D_INT and the source is not x.x.x.x, log 
this packet not exceeding 10 per second." The source is y.y.y.y, so 
your rule matches, and it's logged. The next packet is from x.x.x.x, 
so the rule does NOT match and is not logged. *Both* packets then 
proceed to the next rule.

So then your next rule might be:
-A AUDIT-RULE -d $D_INT ! -s y.y.y.y -m limit --limit 10/s -j LOG

The packet from source y.y.y.y does not match and is not logged. But 
the following packet from x.x.x.x DOES match, and IS logged. Was that 
what you wanted? I bet not.

You probably want something like another user chain, or maybe some 
RETURN rules before a blanket LOG rule at the end of this one, e.g.:

-A AUDIT-RULE -d $D_INT ! -s x.x.x.x -j RETURN
-A AUDIT-RULE -d $D_INT ! -s y.y.y.y -j RETURN
-A AUDIT-RULE -d $D_INT -m limit --limit 10/s -j LOG
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
