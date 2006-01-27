From: "Jimmy Hedman" <jimmy.hedman@southpole.se>
Subject: Re: Completely Bypassing a Firewall?!
Date: Fri, 27 Jan 2006 09:50:47 +0100 (CET)
Message-ID: <33402.138.106.11.116.1138351847.squirrel@intern.southpole.se>
References: <1138198038.16454.73.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138198038.16454.73.camel@localhost.localdomain>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Noble <sysadmin@polezero.com>
Cc: netfilter@lists.netfilter.org

> We just heard a rumor about our rival company, that they have developed
> a "system" that can completely bypass a properly-configured/locked-down
> firewall (netfilter or any other).
>
> Is this truly possible? with only external access and no software that's
> already been planted inside the firewall?
>
If you have someone at the "inside" there is no problem to create tunnels
with for example OpenVPN that completly "bypasses" the firewall. If you
create a tunnel with OpenVPN over https and bridge the networks together
you could get everything through with the traffic looking just like
ordinary https-traffic.
But with only access from the outside it is very vary hard, if not
impossible.

// Jimmy


