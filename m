From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Tuneable UDP Timeout in iptables?
Date: Tue, 25 Mar 2003 18:09:13 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303251808590.12234@dns.toxicfilms.tv>
References: <3E808B49.9070409@ucdavis.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E808B49.9070409@ucdavis.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Cc: netfilter@lists.netfilter.org

> Is there a way to modify the IPTABLES source code to have a tuneable UDP
> timeout? Or, even be able to hardcode a larger timeout? I am having
> problems with AFS, and would like to not have to modify the kernel.
There's a patch in patch-o-matic.

Regards,
Maciej


