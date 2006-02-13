From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: Problem with state match for ip6tables
Date: Mon, 13 Feb 2006 10:56:26 +0000
Message-ID: <871wy7il2d.fsf@newton.gmurray.org.uk>
References: <20060202133857.5bded5b8@localhost.localdomain>
	<87d5i3bf2t.fsf@newton.gmurray.org.uk>
	<20060210145631.1726fd0d@localhost.localdomain>
	<200602130416.k1D4GP73019763@toshiba.co.jp>
	<8764njipgp.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1139828187; h=Received:X-Authentication-Warning:From:To:Subject:
	References:X-Hashcash:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type; b=Ky69zj+La858h5mcGXmTTUZdegxaNfryl+lvn5
	Du93i12hbNPzP8fwIfJjs9gU/MFzapTXVFIm2bI7L4vHDjVA==
In-Reply-To: <8764njipgp.fsf@newton.gmurray.org.uk> (Graham Murray's message
	of "Mon, 13 Feb 2006 09:21:26 +0000")
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

Graham Murray <graham@gmurray.org.uk> writes:

> I am using kernel 2.6.15 but I do not see these config options
> anywhere. I have grep'd the kernel source and can find
> CONFIG_IP_NF_MATCH_STATE (which is only used in the ipv4 makefile to
> build ipt_state.o)

Also connection tracking for ipv6 is working as I see ipv6 sessions in
/proc/net/nf_conntrack

