From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: mangle tables.
Date: Tue, 10 Sep 2002 13:18:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPOEDGCOAA.stewart.thompson@shaw.ca>
References: <3D7DEDDA.2080404@fugmann.dhs.org>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3D7DEDDA.2080404@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: Antony Stone <antony@soft-solutions.co.uk>, netfilter@lists.samba.org

Hi Anders:

	Not a bad diagram for ASCII. :) I am going to have to
save that one. Antony's advice is always sound. There may be
some differences in the latest releases, but I think it will be more
to do with the tables available, and what you can do with them.
I think the traversal order would be the same. I believe there have
been new tables added that aren't in say the 1.24 version I am
running. (Jump in if you have any different info Antony)
	As Antony suggested, a bunch of Logging Rules in all the
Tables and checking the /var/log/messages (on Redhat anyway)
would show the order it went through the tables. Alternately, you
could look at the source code, or talk to someone who is familiar
with it. Which isn't me, and maybe not Antony. Most of us don't
need to get down to that level.  As a general rule I have done fine
using RPM installs. It sounds like you are going to be digging
into things a lot more. Good luck and let us know how you make
out.

Regards,

Stu......



-----Original Message-----
From: Anders Fugmann [mailto:afu@fugmann.dhs.org]
Sent: September 10, 2002 6:04 AM
To: stewart.thompson@shaw.ca
Cc: Antony Stone; netfilter@lists.samba.org
Subject: Re: mangle tables.

Thanks.

This makes alot of sence.
To sum up, tables are traversed in the following mannor:

             [Packet enters the machine]
                          |
                    mangle-prerouting
                    /              \
   <To the machine itself>  <To be forwarded> [Locally gen. packet]
                   |                |                 |
             mangle-input     mangle-forward    mangel-output
                   |                |                 |
             filter-input     filter-forward    filter-output
                   |                \                 /
       [next level of the OSI]       mangle-postrouting
|
                                 [packet leaves the machine]

Legend:
[]: Event.
<>: Case (if).
| : Connector.

(mangle tables intentionally left out)
So there is no doubt that mangle-forward is traversed _before_
filter-forward.

Thanks again for clarifying.

Regards
Anders Fugmann


