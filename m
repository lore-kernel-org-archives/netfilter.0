From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Sun, 26 Jun 2005 22:46:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506262243380.15156@yvahk01.tjqt.qr>
References: <5d2f379105062511588033857@mail.gmail.com>
	<002e01c579e1$4d326d00$4206a8c0@loki>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002e01c579e1$4d326d00$4206a8c0@loki>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marius Mertens <marius.mertens@gmx.de>
Cc: netfilter@lists.netfilter.org



On another note; I was criticized for using

  -m limit --limit 2/minute -p tcp --dport 22

which was too perceived as too restrictive by some (or just one).
Anyway, I've looked closer into the manpage of dstlimit and
I would be glad to exchange my lines with

  -m dstlimit --dstlimit 2/minute --dstlimit-mode srcip-dstip
  -p tcp --dport 22

Comments please :)


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

