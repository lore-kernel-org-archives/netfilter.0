From: "Bret Holbrook" <bholbrook@michiganfamilyresources.org>
Subject: Iptables:  Bad policy name
Date: Mon, 31 Mar 2003 16:13:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se886948.098@michiganfamilyresources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: "'netfilter@lists.netfilter.org'", netfilter@lists.netfilter.org, , 

Hi all,

Having a small problem with the error message in the subject.  I'm
running Slackware 9.0, Iptables 1.2.7a, rc.firewall-2.4-stronger version
.77s.  Basically it gives me the above error on each of the following
commands trying to set up my default policy:

iptables -P INPUT REJECT
iptables -P OUTPUT REJECT
iptables -P FORWARD REJECT

Same error wether I punch it in from the command line or it runs in the
script.  Alternately, the same commands with ACCEPT instead of REJECT
works fine.  I've used these very same fw rules on various other
machines with different versions of Linux and they have worked just
fine.  This is the first time I've used slackware 9 and the newest
iptables though.  Is there something I'm missing here?  Thanks for the
help!

Bret

