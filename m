From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: --sport
Date: 05 Mar 2003 20:52:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046893969.16606.3.camel@tux.rsn.bth.se>
References: <ABEKJILKOKKGGDJKHKDFGEALCAAA.patrick@vikus.com>
	 <3E66277F.3090001@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E66277F.3090001@gmx.de>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: Patrick Ahler <patrick@vikus.com>, Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-03-05 at 17:36, Sven Schuster wrote:
> What you need is the mport-match:
> 
> iptables -A FORWARD -p tcp -m mport --sport 5000:5020 -m state ...

mport is not needed for a simple range

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

