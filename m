From: forum@users.pc9.org
Subject: Re: Iptables Email Alerting
Date: Mon, 15 Mar 2004 12:52:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040315125223.e292b321@alkaid.pc9>
References: <20040315180815.18699.qmail@web40701.mail.yahoo.com>
  <200403151815.24769.lists@edeca.net>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403151815.24769.lists@edeca.net>
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
To: netfilter@lists.netfilter.org

> > I'm looking for something similair to the -j LOG
> > option, perhaps a -j MAIL ?
> 
> You could quite possibly jump to a userspace script that handles this.
> I believe the target is QUEUE, but support will need to be compiled into
> your kernel to support it.

I think your best bet is to use an IDS such as snort; this is ideal for 
rudimentary log or traffic analysis, and can send all kinds of alerts.

-- 
forum@users.pc9.org



