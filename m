From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: RE: New not syn (again...)
Date: Mon, 04 Aug 2003 10:01:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c35a5e$90f4bdd0$d90315ac@rsrc.be.local>
References: <7C9884991ADAE0479C14F10C858BCDF5122E16@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <7C9884991ADAE0479C14F10C858BCDF5122E16@alderaan.smgtec.com>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,


I'm having the same problem as the original poster, i'd like to have these
entries no longer visible in my firewall logs, so do you have any idea on
how to change this "conntrack timeout value" to something higher ?


thanks,


Tom.



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Daniel Chemko
Sent: 01 August 2003 17:57
To: Gavin Hamill; netfilter@lists.netfilter.org
Subject: RE: New not syn (again...)


Basically the client or the server sends out a FIN or RST to signify
that they are done with the connection. The Conntrack would drop the
session. Afterwards the other side sends out an acknowledgement that the
session was dropped. The packets are flagged as not established, since
the connection from the other side was closed. I think it depends on an
IPTables conntrack timeout value to determine how long to wait for the
other side's response.

I don't know what everyone else does about them, but I generally just
drop them It may not be that clean, leaving other PC's IP stacks timeout
the session close, but it happens so rarely to me, *meh*


>My question is regarding syn packets, and probably statefulness... I'm
>getting
>a lot of log messages like this:



****************************************************************************
Disclaimer: 
This electronic transmission and any files attached to it are strictly 
confidential and intended solely for the addressee. If you are not 
the intended addressee, you must not disclose, copy or take any
action in reliance of this transmission. If you have received this 
transmission in error, please notify the sender by return and delete
the transmission.  Although the sender endeavors to maintain a
computer virus free network, the sender does not warrant that this
transmission is virus-free and will not be liable for any damages 
resulting from any virus transmitted. 
Thank You.
****************************************************************************


