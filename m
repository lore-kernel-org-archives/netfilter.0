From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: About CONNTRACK patch with 2.6.6 kernel
Date: Sat, 19 Jun 2004 19:12:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087665125.1942.44.camel@axl.seasidesoftware.co.za>
References: <40D445DE.3050800@uganet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D445DE.3050800@uganet.com.br>
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
To: Carlo Pires <carlo@uganet.com.br>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-06-19 at 15:55, Carlo Pires wrote:

> Is anyone using CONNTRACK patch with 2.6.6 kernel ? Experiencing problems ?

I'm using 2.6.5, and haven't noticed any problems at around 2Mbps web
traffic served through the firewall.  There've been two reports of a
memory leak in conntrack, but I can't reproduce the problem myself. 
Perhaps the memory leak only manifests under load, although that may
simply have to do with too-short timeouts in
/proc/sys/net/ipv4/netfilter.

Ciao,
Sheldon.



