From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: ram and processor cycles for a firewall machine
Date: Fri, 1 Oct 2004 13:55:33 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E380@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Askar <askarali@gmail.com>, Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Askar wrote:
> thanks jose alot, okay i will upgrade ram to 128 * 2 =3D 256MB thanks,
> however where should I look for optimization the iptables rules?
> any link will be greatly appreciated

This is more of a manual activity. Things to speed up the ruleset would
be:

Putting the ESTABLISHED,RELATED rule above all others in its respective
chain. This avoids the lookups for all the match rules.

If you have a match rule with a 100000 hits during an interval, put it
before a match rule with 100 hits. This way, the inefficiency of
processing the more obscure rule is minimized.

This isn't so much of a big deal unless you have either insane amounts
of traffic, or many very very small sessions. Hosting 'normal' users, I
have 99.97% of my traffic hitting the ESTABLISHED,RELATED filtering
rule, so the efficiency of the other rules in my stack is
unconsequential.


# All Traffic
AAA=3D"`iptables -t filter -nvxL FORWARD | egrep -v 'FORWARD|pkts' | awk
'{print $2}' | sed s/"$"/"+"/`"; echo ${AAA}0| bc

# Only ESTABLISHED,RELATED traffic
AAA=3D"`iptables -t filter -nvxL FORWARD | grep 'RELATED,ESTABLISHED' |
awk '{print $2}' | sed s/"$"/"+"/`"; echo ${AAA}0| bc

% of traffic in ESTABLISHED,RELATED is just the second number divided by
the first.  The larger the percentage, the less any subsequent rule
arrangement will matter.

