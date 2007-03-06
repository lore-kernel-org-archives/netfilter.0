From: TheGesus <thegesus@gmail.com>
Subject: Re: [libipq] owner of packet, possible patch
Date: Tue, 6 Mar 2007 13:17:38 -0500
Message-ID: <5e70f6530703061017h655c8861q3b2cf4a0e92dee05@mail.gmail.com>
References: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
	<1173196307.23222.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=HPFHrxeEIusifLbVguAOOScoUoh9ZN/67MLZgsuGnOIwrwYa0ISFwmVOI8GVrxQCVMTY8tB67wQ/dpMTZJ+/f+hO1OTRl9C/fK5SbiIPdR6hbVggOY9bqJ9WxNyfaiGVl4oFrXUP0XZQcXTiQNs1EQbCMHX07/92dpOKxmY7rns=
In-Reply-To: <1173196307.23222.17.camel@localhost>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@lists.netfilter.org

On 3/6/07, Eric Leblond <eric@inl.fr> wrote:

> ipqueue is deprecated in favor of libnetfilter_queue ...

Oddly, our friends over at SourceFire are still using libipq for snort
inline for some unknown reason.

You should drop them a note on this subject and let them know the
error of their ways.  I'm sure they'd appreciate it.

While you're at it maybe you can convince them to stop linking against
that ancient version of libnet they're so fond of.

