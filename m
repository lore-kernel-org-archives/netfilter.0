From: "Brent Deterding" <brent.deterding@techguardsecurity.com>
Subject: RE: Linksys v. Netfilter
Date: Sat, 22 Jun 2002 19:37:14 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <GEEBIPMLCAMAMAMCECKJCEFECGAA.brent.deterding@techguardsecurity.com>
References: <FLEKIPPLAEDMJMOOBBDPAEHNCGAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPAEHNCGAA.stewart.thompson@shaw.ca>
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
To: stewart.thompson@shaw.ca, "David B. Bitton" <david@codenoevil.com>, netfilter@lists.samba.org

Correct me if I'm wrong - but we are talking about LinkSys Cable/Router
things, right? The same devices that allow anything out?

Although people tend to forget it - a firewall is there to control traffic
inbound AND outbound. If it isn't controlling it outbound then what's the
difference between a netfilter box and a simple NAT-only solution?
Everything out, nothing in.

-- Brent Deterding

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Stewart Thompson
Sent: Saturday, June 22, 2002 3:57 PM
To: David B. Bitton; netfilter@lists.samba.org
Subject: RE: Linksys v. Netfilter


Hmmm. I don't know, but I would think it would be like comparing apples
to oranges. I have, and continue to use both. The Linksys is quick and
easy to set up, and can be looked after by someone with a reasonable
amount of knowledge. It is great for small offices and homes where there
are only a few computers and they have simple needs. It does have some
problems with related connections, so I am not sure if it is truly stateful.
	However, I would never consider it for a serious application like
protecting a Corporate LAN. With Netfilter you can write a rule to cover
every situation. To allow or block specific ports and ip's on a case by case
basis. There are still a few areas that helper modules are being developed
for, but there is a core of real dedicated guys working on it. One of the
things I really like about Netfilter is the logging ability. I can set up
rules
to log all kinds of information, and real time data. There are also a number
of other programs that allow traffic shaping, routing, and limiting. This
kind of
stuff just isn't possible wit the Linksys.
	Yes it is more work to set up, and a little more capital outlay in
Equipment. However, I think the results are well worth the investment.
Just my two cents worth.

Stu...........


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of David B. Bitton
Sent: June 22, 2002 11:05 AM
To: netfilter@lists.samba.org
Subject: Linksys v. Netfilter

Have any whitepapers been written on the subject of a Linksys Router v. a
Netfilter implementation?
--

David B. Bitton
david@codenoevil.com
www.codenoevil.com

Code Made Fresh DailyT




