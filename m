From: "Heupink, Mourik Jan C." <Heupink@INTECH.UNU.EDU>
Subject: howto only allow outgoing mail from certain hosts
Date: Tue, 1 Oct 2002 16:08:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1100D69203AAD2118E3C00508B8B9E8A67F000@mailhost.intech.unu.edu>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello all.

The subject says it all, really. I want to (of course) allow OUTGOING mail
from our domain, from only two designated servers. So, drop outgoing mail
from any other host.

I can't seem to produce the iptables command to get this to work... (using
forward chain, because using transp. bridging firewall...)

I guess this: iptables -A FORWARD -s x.x.x.0/24 -p tcp --dport 25 -REJECT
would drop all outgoing mail, right? (i guess the way to select outgoing
mail traffic would be to use --dport..?)

Now i have to find a way to make an exclusion in that rule. something like
-s x.x.x.0/24 EXCEPT x.x.x.y

Could anyone shed some light onto this..?

Thanks very much in advance,
Yours,
Mourik Jan


