From: blah blah <filt5447@yahoo.com>
Subject: RE: Trouble with --dport
Date: Tue, 22 Oct 2002 06:35:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021022133512.2456.qmail@web10901.mail.yahoo.com>
References: <37755.192.168.7.14.1035283337.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <37755.192.168.7.14.1035283337.squirrel@iw.k1k2.com>
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

Thanks for all of the help.  Adding a "-m tcp" appears
to have fixed the problem.

On a side note to answer one of the questions I was
asked.  I am using the command
/etc/rc.d/init.d/iptables startup script to reload the
rules after I change them.

Once again, thanks.

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

