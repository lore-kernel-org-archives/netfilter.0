From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: block kazaa
Date: Tue, 25 Mar 2003 15:45:45 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030325214545.GA1817@placemark.com>
References: <20030325183312.2501.87766.Mailman@kashyyyk> <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
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
Content-Transfer-Encoding: 7bit
To: paulc@ibiblio.org
Cc: netfilter@lists.netfilter.org

On Tue, Mar 25, 2003 at 09:27:16PM +0000, paulc@ibiblio.org wrote:
> The way I block Kazaa (and the other file sharing applications) is a 
> blanket ban on all ports by default. I then open the ports as I think is 
> appropriate at the firewall. These only include the port 23 for anyone 
> wishing to use telnet. All web and ftp style ports on 80, 21 and the like 
> are handled by a web-proxy to prevent using them for other purposes. All 
> incoming connects (and lots of ICMP messages) are dropped by the firewall 
> also.

In my personal experience, that still allows kazaa clients to download
files.  Uploads are prevented, and that's a good thing if you're
committed to stopping p2p traffic.  However it's only half a solution.

The reality is, fighting p2p traffic is a losing battle.  I suspect
that's one of those things that will have to be addressed by corporate
policy/enforcement and with host-based restrictions (don't let users
install software on their own boxes).

Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)

