From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Netfilter on 2.0.x kernel !?
Date: Wed, 10 Jul 2002 14:29:42 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101329.g6ADTw812515@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter <netfilter@lists.samba.org>

I am posting this message on behalf of Jeff Muntel <jeffm@nova-eng.com> who 
seems to be having some problems with his subscription to the list.

I must admit it sounds like a pretty unlikely possibility to me....

----------  Forwarded Message  ----------

"Is there any way to patch a Linux 2.0.x kernel to add netfilter
functionality, or would it be best just to use ipfwadm to do packet
filtering with this kernel?  I'm working on an embedded application which
must use Linux 2.0.38, but my application needs netfilter support.  I will
need to have the capability to drop some packets, allow some to pass through
to the next phase of the network processing, and queue others to my
application in the userspace.  I have already determined that I cannot use
the 2.4 kernel in this embedded environment, so I have two options;
modify/patch the 2.0.38 kernel to add some (limited) netfilter support
(artificially insert hooks), or use ipfwadm with the 2.0.38 kernel.  FYI,
the only hooks used are NF_IP_PRE_ROUTING, NF_IP_LOCAL_OUT, and
NF_IP_POST_ROUTING with verdicts of NF_ACCEPT, NF_DROP, and NF_QUEUE.

I have done some research and it seems that ipfwadm will not work too well,
since I need to queue packets to the userspace.  It looks as if inserting
the artificial netfilter hooks would not be too terribly difficult, but I
would also have to reimplement ip_queue and any associated files, which
would probably be a big pain.

Any advice, words of wisdom, or solutions would be greatly appreciated.

Thanks,
Jeff

-------------------------------------------------------

