From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: deny cgi scanner
Date: Tue, 1 Apr 2003 20:17:25 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4096.212.242.51.102.1049221045.squirrel@www.ramstedt.dk>
References: <3E89CD8A.5020007@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E89CD8A.5020007@gmx.ch>
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
To: mailing-lists@gmx.ch
Cc: netfilter@lists.netfilter.org

> does anybody know how to drop packets with
> destination-port 80 after a limit of connections
> has been reached?
> i'd like to deny access for the attacker as soon
> as a cgi-scan has been detected.
>
> is it possible to do that with iptables?

The patch-o-matic module iplimit can do exactly that.

//Jesper



