From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Download speeds drastically reduced through iptables
Date: Fri, 7 May 2004 09:03:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405070903.32135.Antony@Soft-Solutions.co.uk>
References: <20040507071012.20BD77266@sitemail.everyone.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040507071012.20BD77266@sitemail.everyone.net>
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

On Friday 07 May 2004 8:10 am, Joe Riley wrote:

> dear mailing list.
> I am having a problem with my iptables setup, the server sharing the
> connection (192.168.0.1) gets download speeds of 120kb/sec, the problem is
> is that the box being masqueraded (192.168.0.2) - behind the firewall only
> gets no more than 30-40kb/sec. this slow speed is comparable to a 256kbit
> isdn .. and it really bothers me.
>
> what is the secret for unlocking the speed in iptables?

It's hard to answer such a broad question, however I'd be interested to know 
if the performance is the same if you use a cabled connection instead of a 
wireless link to the machine?

I'm just wondering about things like collisions, latency, MTU, whatever...

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


