From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Problem of Setting dafault polocies to 'DROP'
Date: Thu, 25 Dec 2003 05:01:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031225050121.3439e53a.arnt@c2i.net>
References: <20031224110324.15253.qmail@web60404.mail.yahoo.com>
	<200312241112.00560.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312241112.00560.Antony@Soft-Solutions.co.uk>
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

On Wed, 24 Dec 2003 11:12:00 +0000, 
Antony Stone <Antony@Soft-Solutions.co.uk> wrote in message 
<200312241112.00560.Antony@Soft-Solutions.co.uk>:

> On Wednesday 24 December 2003 11:03 am, ads nat wrote:
> 
> > The moment I set "iptables -P INPUT DROP"
> > System hangs.
> 
> Are you working on a local keyboard + screen, or via a remote ssh
> session?
> 
> If you are on a network connection, then of course an empty ruleset +
> default DROP policy will block your connection.

...so you will wanna set up a rule set that allows you to finish 
setup of the firewall, before you set up the drop policy.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



