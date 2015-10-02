From: "W. Michael Petullo" <mike@flyn.org>
Subject: Obtaining process which generated packet
Date: Fri, 2 Oct 2015 13:38:37 -0400
Message-ID: <20151002173837.GA5132@imp.flyn.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am interested in identifying the process (if any) responsible for
creating a packet from within a netfilter module. Specifically, I would
like to (from within the kernel) inspect the appropriate process's task
structure and make a decision based on what I find. How might I do this?

Another user asked a similar question some time ago:

	http://lists.netfilter.org/pipermail/netfilter/2005-December/064225.html

However, I did not find a conclusive answer.

One of the responders stated this of the suggested use of
sk_buff->sock->socket->file->fown_struct->pid:

	"...and if using SMP you can't use it at all in netfilter context."

I was unable to follow why this would be the case. Would someone
be willing to elaborate on this too?

Thank you,

-- 
Mike

:wq
