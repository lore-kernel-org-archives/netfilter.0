From: Saad Faruque <faruque@gmail.com>
Subject: Re: IT WORKS!!
Date: Fri, 2 Jul 2004 15:41:55 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1d7da3f40407020241774b51d9@mail.gmail.com>
References: <AE4D8F0E-CB8C-11D8-B251-000A95AD0230@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AE4D8F0E-CB8C-11D8-B251-000A95AD0230@mac.com>
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

if ur in redhat,
chakconfig --level 345 iptables on
service iptables stop
run ur firewall scripts
service iptables on 
that should solve ur problem

On Thu, 1 Jul 2004 13:30:08 -0500, Sam Loy <sampaw@mac.com> wrote:
> 
> I got it working! Thanks again.....many thanks.
> 
> One question. What is the best way to ensure the rules are applied
> automatically on reboot.
> 
> The last time I did /sbin/service iptables save, it broke everything.
> 
> Thanks,
> 
> Sam
> 
>

