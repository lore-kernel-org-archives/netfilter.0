From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: Problem with state match for ip6tables
Date: Mon, 13 Feb 2006 09:21:26 +0000
Message-ID: <8764njipgp.fsf@newton.gmurray.org.uk>
References: <20060202133857.5bded5b8@localhost.localdomain>
	<87d5i3bf2t.fsf@newton.gmurray.org.uk>
	<20060210145631.1726fd0d@localhost.localdomain>
	<200602130416.k1D4GP73019763@toshiba.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1139822487; h=Received:X-Authentication-Warning:From:To:Subject:
	References:X-Hashcash:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type; b=SJh2U3/s9uK/6gKeaSSa57RMNQ0eBAE85IRqYI
	HF8nL4K2nxZCmrxju95sXXT8WC2n+M2U5AJUF++Dk98aR7Iw==
In-Reply-To: <200602130416.k1D4GP73019763@toshiba.co.jp> (Yasuyuki KOZAKAI's
	message of "Mon, 13 Feb 2006 13:16:24 +0900 (JST)")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp> writes:

> The only kernel >= 2.6.15 supports IPv6 state match.
> And kernel option CONFIG_NETFILTER_XTABLES and 
> CONFIG_NETFILTER_XT_MATCH_STATE are required.
>
> Please "make menuconfig" in kernel source, and go to the menu
> "Network packet filtering (replaces ipchains)",
> enable "Netfilter Xtables support (required for ip_tables)",
> enable "state match support".

I am using kernel 2.6.15 but I do not see these config options
anywhere. I have grep'd the kernel source and can find
CONFIG_IP_NF_MATCH_STATE (which is only used in the ipv4 makefile to
build ipt_state.o)

