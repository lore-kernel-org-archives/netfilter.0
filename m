From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: NATTING_help
Date: Wed, 16 Nov 2005 10:16:21 -0600
Message-ID: <1132157781.4527.27.camel@localhost.localdomain>
References: <437B456A.9090501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437B456A.9090501@gmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, 2005-11-16 at 17:42 +0300, compuomari wrote:
> Dears,
> I have a scenario that is somehow making me have a hardtime , i have a
> wiless access point that get the internat access from my linux box, i
> want any user that uses my internet to get a lnading page for my self (
> some kind of advertisment ) and then go to the internet , i don't need
> authentication , but i dont want this landing page occuring many more
> than once for the user ... anyhow , how can i do it with iptables? i
> want to DNAT all users to an internal apache server , then SNAT them to
> the inernet , how is that possible? double natting? proxying ? i need
> your help ..

i have effectively done this, (it is a registration system for the
campus that i work at).

overview:

1) use the mangle table to determine if users are forced (dnat'ed) to
the landing page (internal apache server)

2) use apache's mod_rewrite to capture any document in the web space.

3) once they view the page and click a link or hit a submit button have
a cgi that add's their ip to the mangle table that allows them passage
through the firewall (without being dnat'ed). also this cgi can print
out a http location header to send them to the original web site that
they wanted to go to.

the system that i helped build is mildly complex and consists of a
database for user tracking, scanning (using nessus), radius
authentication, ucarp (unfortunately not working yet), and other things.

but a stripped down version could be done with just one or two cgi's and
some firewall rules.

-matt zagrabelny


