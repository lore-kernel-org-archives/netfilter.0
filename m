From: Michael Gale <mgale@utilitran.com>
Subject: Re: Forwarding and masquerading got broken
Date: Tue, 2 Dec 2003 08:19:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202081932.70944ce6.mgale@utilitran.com>
References: <3FCD5E75.5020402@mchsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FCD5E75.5020402@mchsi.com>
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

Hello,

	Look the section"
--snip--
# --------( Sysctl Tuning - Recommended Parameters )--------

# Turn off IP forwarding by default
# (this will be enabled if you require masquerading)

if [ -e /proc/sys/net/ipv4/ip_forward ]; then
  echo 0 > /proc/sys/net/ipv4/ip_forward
fi
--snip--

The "echo 0" in the "/proc/sys/net/ipv4/ip_forward" is disabling ip_forwarding -- which is need to forward packets.

Change the "echo 0" to "echo 1"

:)

Michael.









On Tue, 02 Dec 2003 21:54:29 -0600
"Lawrence G. Hunsicker" <lhunsicker@mchsi.com> wrote:

> Hi, folks:
> 
> I have just used firestarter's wizard to allow access to my web server. 
>    This part of things worked correctly, but in the process my machine 
> has stopped forwarding and masquerading traffic from machines inside my 
> firewall to the outside world.  All of the interfaces themselves work 
> correctly.  I.e., from inside machines I can ping my server and from the 
> server I can see the outside world.  But I can't see the outside world 
> from the inside machines.  Is there someone out there that can tell me 
> what I have to do to get IP forwarding and masquerading working again?
> 
> I have attached a copy of my firewall.sh file.
> 
> Many thanks in advance for any help that you can give me.
> 
>   --
> Lawrence G. Hunsicker
> lhunsicker@mchsi.com
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

