From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_tables_names not showing any results.. please help
Date: Sun, 2 May 2004 18:23:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405021823.58366.Antony@Soft-Solutions.co.uk>
References: <1402.216.22.86.180.1083517083.squirrel@www.123plaza.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1402.216.22.86.180.1083517083.squirrel@www.123plaza.com>
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

On Sunday 02 May 2004 5:58 pm, 123plaza Malls wrote:

> Hi All,
>
> Please forgive my ignorance, but being an inexperienced linux user I
> managed to break something with my iptables

What were you doing when it broke?   Recompiling your kernel?   Recompiling 
iptables?   Fiddling with the startup scripts?  Un/Installing netfilter RPMs?

The /proc filesystem is a window into the innards of your kernel, so I suspect 
you've recompiled or loaded a kernel which does not have netfilter support, 
or you have unloaded all your netfilter modules (I'm not quite sure if that 
last one would cause this as I don't use modules, but it seems likely).

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


