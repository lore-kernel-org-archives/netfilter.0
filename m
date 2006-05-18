From: Bowie Bailey <Bowie_Bailey@BUC.com>
Subject: RE: iptables and pop3 lockup
Date: Thu, 18 May 2006 10:04:17 -0400
Message-ID: <4766EEE585A6D311ADF500E018C154E302684A2D@bnifex.cis.buc.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'Netfilter List (E-mail)'" <netfilter@lists.netfilter.org>

Rob Sterenborg wrote:
> > Glad to here that worked for you.
> > 
> > As for getting connection tracking to work I'll defer that to
> > others on the list.  I'm have a similar problem on a Fedora Core 2
> > virtual instance that we lease offsite for a project.  In that case
> > everything was statically linked but I can't use any of the loaded
> > modules (or better said they don't work).  But for me it wasn't
> > critical so I just gave up on it.
> 
> The OP could build a new kernel from kernel.org and see if the problem
> goes away. You can't take advantage of the RH kernel updates anymore
> if you do this but so far only the FC2 kernel seems to have this
> problem. Of course, if this is a production site then it is not
> really an option but then perhaps a test-server could be built.

This is a production box, so I am not interested in building a custom
kernel.  I am running CentOS 4.3 which should be nearly the same
kernel as RHEL4.

-- 
Bowie

