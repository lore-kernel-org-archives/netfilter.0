From: Scott MacKay <scottmackay@yahoo.com>
Subject: physdev only needs, con track location
Date: Tue, 8 Apr 2003 04:35:38 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030408113538.25082.qmail@web13903.mail.yahoo.com>
References: <200304080400.46995.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304080400.46995.netfilter@newkirk.us>
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
To: netfilter@lists.netfilter.org

Hello all!  2 quick questions, if I could.
It looks like the bridge + firewall solution of choice
for the 2.4 kernel is ebtables
(http://ebtables.sourceforce.net).  The only thing I
want to do with the bridge + firewalls is get my
physical device; I don't need to play with rules based
on ethernet header.  Does anyone know if I need both
the ebtables and bridge-nf patches or can I just use
the bridge-nf?

Since it is all integrated in the 2.5 kernel, does
anyone know how stable that is (yeah, beta) or
thoughts when it may leave the beta state?

Also, in the whole iptables chain order of things,
when is conn tracking performed?  

Thanks in advance for any help with the myrid of
questions!!!
-Scott

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

