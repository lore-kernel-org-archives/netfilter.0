From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: IP Fragmentation
Date: Mon, 31 Mar 2003 12:41:37 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303311241.37811.danielf@supportteam.net>
References: <127503161447.20030331000615@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <127503161447.20030331000615@lf.lv>
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
To: Peteris Krumins <newsgroups@lf.lv>, netfilter@lists.netfilter.org

Depends on your network and weather or not you care to be rfc compliant. 
I see real fragmented traffic all the time. I choose not to block it. Because 
it would break stuff that our customers need to use. So i just keep an eye on 
fragmentation and watch fro abuse of it. We host 125,000 web sites, and use 
iptables on our Firewalls (8).

On Sunday 30 March 2003 15:06, Peteris Krumins wrote:
> Hi,
>
>  How often does IP Fragmentation occur?
>  Is it safe to restrict any fragmented packets to 'come' into my
>  network?
>
>
> P.Krumins

-- 
Daniel Fairchild - Chief Security Engineer | danielf@supportteam.net

