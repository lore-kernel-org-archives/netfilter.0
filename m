From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: SuSE Linux and iptables
Date: Sat, 29 May 2004 21:15:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040529211537.5bf13213.leslie.polzer@gmx.net>
References: <s0b89584.043@webmail.minorplanetusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0b89584.043@webmail.minorplanetusa.com>
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

On Sat, 29 May 2004 13:51:32 -0500
"Erick Sanz" <esanz@minorplanetusa.com> wrote:

> I just changed from Red Hat Linux 9.0 to SuSE Linux 
> [...]
> I just want to turn their firewall off and start 
> iptables on my own, with my own rules...
> 
> Has anyone done this?
I don't use SuSE, but if all else fails, you can just
create your own script and call it from /etc/rc.local.
Just don't forget flushing all chains there.

Leslie

