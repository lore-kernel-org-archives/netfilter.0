From: Patrick Schaaf <bof@bof.de>
Subject: Re: Placement of Iptable Scripts
Date: Fri, 5 Jul 2002 08:17:48 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705081748.B11938@oknodo.bof.de>
References: <438C2AB1D4939648943D6DCF1EF01E1058C46E@AUSXMPS316.aus.amer.dell.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <438C2AB1D4939648943D6DCF1EF01E1058C46E@AUSXMPS316.aus.amer.dell.com>; from Mark_Vuong@Dell.com on Thu, Jul 04, 2002 at 09:57:16PM -0500
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark_Vuong@Dell.com
Cc: netfilter@lists.samba.org

On Thu, Jul 04, 2002 at 09:57:16PM -0500, Mark_Vuong@Dell.com wrote:
> I'm relatively new to iptables and have the following question.
> 
> where is the best place to place my iptable bash script so that it loads my
> iptable chains and rules when my server reboots?

The best place depends on the distribution you use. Look for a directory
/etc/init.d/ (or /sbin/init.d for old SuSE systems), and for a README
file, there.

If you are still lost, please consult general new user Linux mailing
lists or newsgroups. This is a system integration question, completely
independant of iptables itself; it's the same for any piece of software.

best regards
  Patrick

