From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Problem with adresstranslation
Date: Fri, 3 Oct 2003 21:38:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOIEEHCCAA.markee@bandwidthco.com>
References: <1065015522.28138.1.camel@linux.local>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065015522.28138.1.camel@linux.local>
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
To: rhelms@mayn.de, netfilter@lists.netfilter.org

Ruprecht - I read through your script and didn't see anything obvious that
could be causing you problems.  There was one mistake on line 140:
INTLAN="192.168.0.0(24"

which is just a typo I suspect.  But this could be giving you the problems
you.  Are you getting any error messages when you run the script?  If this
is not the problem itself, then I suggest the culprit is with your FORWARD
chain.  Try setting the default -P to ACCEPT and see if your packets pass.
If so, troubleshoot your FORWARD chain from there.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ruprecht Helms
Sent: Wednesday, October 01, 2003 6:39 AM
To: netfilter@lists.netfilter.org
Subject: Problem with adresstranslation


Hi,

I have a script with some rulesets for iptable. By running the script I
can't use an internetconnection from a host in my lan. Only from the
firewallhost itselve I can get connection to outsite.

My internal lan use the segment 192.168.0.x/ 24 (Subnetmask
255.255.255.0).

On which position is a mistake and how have I to configure for proper
working.

Regards,
Ruprecht




