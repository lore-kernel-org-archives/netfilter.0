From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What targets are available in mangle table
Date: Wed, 7 Apr 2004 10:26:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071026.16694.Antony@Soft-Solutions.co.uk>
References: <000101c41c6b$86d682a0$1664640a@Younger>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c41c6b$86d682a0$1664640a@Younger>
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

On Wednesday 07 April 2004 7:42 am, Younger Wang wrote:

> Hi,
>
> In iptables tutorial, it says "Targets that are only valid in the mangle
> table: TOS, TTL and MARK"..
>
> Does it mean that only TOS TTL and MARK are valid in mangle table or TOS
> TTL and MARK are valid only in mangle table? I am confused. Thank you!

The second: it means you can use these targets in the mangle tables, but you 
cannot use them in any other tables.

There are other targets you can use in mangle as well, but those can be used 
in other tables too.

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


