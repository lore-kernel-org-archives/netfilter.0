From: pravin rane <pgr_80@yahoo.com>
Subject: Forwarding PPPOE packets through Linux Router
Date: Thu, 20 Oct 2005 00:42:31 -0700 (PDT)
Message-ID: <20051020074231.46712.qmail@web31504.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi

I am having a Linux box running with kernel 2.4.20 . I
am using it as a router. My Desktops machins are
behind this router and on private segments. These
Desktop machines dial a PPP connection over ethernet
(PPPOE)to log on to some trusted Network. Some how
Linux Rouer dont forward PPPoE request further.

When I configure this router in Birdge mode then these
machines are able to connect and succssfully logs on
net Network

I tried to MASQUERADE all traffic but it didnt worked
out

Regards
Pravin




		
__________________________________ 
Yahoo! Music Unlimited 
Access over 1 million songs. Try it free.
http://music.yahoo.com/unlimited/

