From: "Fred Trotter" <fred.trotter@gmail.com>
Subject: Time module included in the default Fedora
Date: Wed, 11 Apr 2007 09:52:12 -0500
Message-ID: <b317600c0704110752g2f9a82a1x8b18adaae15f775e@mail.gmail.com>
References: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=UPMs3jvqlFsTupEBpHnt4/9HgDoppcQNxtFDoZDBWKgkSNfIGQ5lqPzaOlrN2w/O2Fq+MzDupJP6iX1NWprw+kMH0fiA/jxsboOEacOuvAw45H2RYl9bSpLQ/Tp2HQ0rjxQxOYWbU5P73JfnPjJSdPYjM8G7DuJ2F8nYemrZEBc=
In-Reply-To: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi, I tried this request on the devel list but I guess from the
silence it was off-topic.

        I was told to write here about getting the time module
included "upstream". I hope that someone here might be able  to
educate me on the process for getting these things done. I understand
that there are many iptables modules and that some are included by
default while others are not.
        The problem is that the iptables userspace project documents
the time modules as though it is included, but at least in Fedora it
is not by default. They hold that they will not include it until it is
included "upstream", they indicated that you would be able to tell me
how to get it included "upstream".
          I am confused as to why the man pages reference
functionality that seems to be not typically turned on by default. Why
is the man page "upstream" but not the module? I do not say this to
accuse, I want to understand so that I can help fix this. It seems to
me that either the man pages should not mention the module or the
module should typically be included.
         Does this problem impact other documented modules that are
not actually included "upstream"?

Here is the link to original discussion.
  https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=233475

Regards,
-FT

-- 
Fred Trotter
http://www.fredtrotter.com

