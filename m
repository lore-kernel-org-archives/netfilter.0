From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: --mark match/subsetting question
Date: Thu, 29 Apr 2004 11:19:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16529.7421.149983.244664@saint.heaven.net>
References: <Sea2-F42Vd7cl4TlL8R0002b70a@hotmail.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea2-F42Vd7cl4TlL8R0002b70a@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Smith <snafflefu@hotmail.com>
Cc: netfilter@lists.netfilter.org

Aaron Smith writes:
> Then I figured I'd put a mark rule out front to mark connections I don't 
> want redirected, and
> every redirect rule would have a --mark ! 0x01, but the not operator doesnt 
> seem to work with mark.

Use --mark 0/0x01

--
Dick St.Peters, stpeters@NetHeaven.com 

