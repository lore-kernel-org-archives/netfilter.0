From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Relay to DNS Server ?
Date: Wed, 16 Jun 2004 18:30:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406161830.21188.Antony@Soft-Solutions.co.uk>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <40D04BB9.2030907@akao.fr> <20040616155319.3ae01819.leslie.polzer@gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040616155319.3ae01819.leslie.polzer@gmx.net>
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

On Wednesday 16 June 2004 2:53 pm, Patrick Leslie Polzer wrote:

> On Wed, 16 Jun 2004 15:31:37 +0200
>
> Akao <technique@akao.fr> wrote:
> > Is it possible to use netfilter rules to "relay" clients DNS requests ?
>
> Masquerading does that, but you must allow packets to port 53 tcp/udp to
> pass through to your ISP's DNS servers and their related packets back.

This is a completely correct and accurate answer to your question, however I 
think you would get much better performance for very little effort if you set 
up a simple caching-only name server somewhere on your network (possibly even 
on the firewall itself, but don't tell anyone I suggested that :)

Regards,

Antony.

-- 
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


