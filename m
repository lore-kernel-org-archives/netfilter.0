From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack and ipt_conntrack
Date: Fri, 23 Jan 2004 19:48:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401231948.22760.Antony@Soft-Solutions.co.uk>
References: <BAY10-F46m2m2XkO28Q0000cf3b@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F46m2m2XkO28Q0000cf3b@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Friday 23 January 2004 6:14 pm, Rodre Ghorashi-Zadeh wrote:

> If ipt_conntrack does the state matching then what does the ipt_state
> module do?

Indeed - a good question.

To quote from the comments at the top of ipt_state.c and ipt_conntrack.c:

(ipt_state.c)
/* Kernel module to match connection tracking information.
 * GPL (C) 1999  Rusty Russell (rusty@rustcorp.com.au).

(ipt_conntrack.c)
/* Kernel module to match connection tracking information.
 * Superset of Rusty's minimalistic state match.
 * GPL (C) 2001  Marc Boucher (marc@mbsi.ca).

So, the answer is that they are both connection trackinf state matches, but 
ipt_conntrack claims to be a more comprehensive one.

To find out more I suggest you look at the source code of each, or ask on the 
developers' list.

 - Unless anyone else around here can give a good answer to this???

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


