From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 10:58:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382AB4@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: 'Nick Drage' <nickd@metastasis.org.uk>, netfilter@lists.netfilter.org


I think there has been a bit of loss of direction from the initial thread.

programatically speaking NO services which allow traffic of any kind s/be
running
'out of the box'...

the fewer and smaller amount of code the more secure.

i.e.,,,if it ain't running you cant attack it....common sense....

re: bellovin, cheswick, farmer, wiezste, et al...

console should be how one initally accesses the box unless
we are speaking of a centrally managed security enclave scenario.

why take needless chances...

~piranha


> Just my two cents on this:

My two pennies :)

> If your firewall is designed correctly, there shouldn't be any network
> available services running baring SSH.

If you're using IPTables as a seperate firewall then wouldn't you just
want SSHD listening on the internal interface?

> Because of this, if a hacker gets into your firewall I assume that
> 99.9999% of the time, they'll have root access. Any hacker that could
> hack into your Linux box will be able to disable any iptables rules in
> a second. Hence, blocking the OUTPUT chain on a firewall does NOT
> secure you against hackers.

You're presuming that IPTables isn't protecting a single host.  If
you're using it on a desktop or a server filtering on the OUTPUT chain
gives you a huge gain in security.

-- 
"I think a church with a lightning rod shows a decided lack of confidence"

