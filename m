From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 18:43:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405101843.30575.Antony@Soft-Solutions.co.uk>
References: <1084206191.409fac6f1176a@webmail.floog.net> <200405101743.54501.Antony@Soft-Solutions.co.uk> <1084210299.409fbc7b3288c@webmail.floog.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084210299.409fbc7b3288c@webmail.floog.net>
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

On Monday 10 May 2004 6:31 pm, michael@floog.net wrote:

> Hi Antony,
>
> Thanks for the rapid response to my post.  I see you what you are
> saying.
>
> Maybe I could add a 3rd NIC to the linux router/firewall box and call it
> eth2 and give it a different subnet like 192.168.2.1 and then
> 192.168.1.9 will become 192.168.2.2 on the new subnet.

That would be an excellent solution - using NAT if you need the other machines 
to think it's 192.168.1.9 instead of 192.168.2.9 (however, they may be happy 
with the real address - it depends what you're using it for).

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


